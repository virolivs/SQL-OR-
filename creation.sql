-- Tipo endereço
CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
    rua VARCHAR2(50),
    cidade VARCHAR2(25),
    numero CHAR(2),
    cep NUMBER,
    CONSTRUCTOR FUNCTION tp_endereco(
        SELF IN OUT NOCOPY tp_endereco, 
        rua VARCHAR2,
        cidade VARCHAR2,
        numero CHAR,
        cep NUMBER
    ) RETURN SELF AS RESULT
);
/
CREATE OR REPLACE TYPE BODY tp_endereco AS
    CONSTRUCTOR FUNCTION tp_endereco(
        SELF IN OUT tp_endereco, 
        rua VARCHAR2,
        cidade VARCHAR2,
        numero CHAR,
        cep NUMBER
    ) RETURN SELF AS RESULT IS 
    BEGIN
        SELF.rua := Rua;
        SELF.cidade := Cidade;
        SELF.numero := Numero;
        SELF.cep := Cep;
        RETURN;  
    END;
END;
/

-- tipo alimentacao
CREATE OR REPLACE TYPE tp_alimentacao AS OBJECT (
    cod_barras NUMBER,
    nome_produto VARCHAR2(25),
    data_hora_consumo TIMESTAMP
);
/

-- tipo nt alimentos
CREATE TYPE tp_lista_alimentos AS TABLE OF tp_alimentacao;
/

-- tipo plano de assinatura
CREATE OR REPLACE TYPE tp_plano_de_assinatura AS OBJECT (
    nivel VARCHAR2(50),
    tempo NUMBER,
    preco DECIMAL(10, 2),
    
    -- Referência a outro plano para indicar evolução
    plano_evoluido REF tp_plano_de_assinatura,
    
    -- MEMBER PROCEDURE para atualizar o preço
    MEMBER PROCEDURE atualizar_preco(novo_preco DECIMAL),
    
    -- MEMBER FUNCTION para calcular o valor total
    MEMBER FUNCTION calcular_valor_total RETURN DECIMAL
);
/
CREATE OR REPLACE TYPE BODY tp_plano_de_assinatura AS
    -- MEMBER PROCEDURE para atualizar o preço
    MEMBER PROCEDURE atualizar_preco(novo_preco DECIMAL) IS
    BEGIN
        SELF.preco := novo_preco;
    END;
    
    -- MEMBER FUNCTION para calcular o valor total
    MEMBER FUNCTION calcular_valor_total RETURN DECIMAL IS
    BEGIN
        RETURN SELF.preco * SELF.tempo;
    END;
END;
/

-- tipo usuario
CREATE OR REPLACE TYPE tp_usuario AS OBJECT (
    id_usuario NUMBER, 
    nome VARCHAR2(25),
    endereco tp_endereco, 
    telefone NUMBER,  
    lista_alimentos tp_lista_alimentos,
    
    -- MEMBER PROCEDURE para aplicar desconto
    MEMBER PROCEDURE aplicar_desconto (plano REF tp_plano_de_assinatura),
    FINAL MEMBER FUNCTION calcular_total_alimentos RETURN NUMBER 
) NOT FINAL;
/
CREATE OR REPLACE TYPE BODY tp_usuario AS
    -- Implementação do método final para calcular o total de alimentos consumidos
    MEMBER FUNCTION calcular_total_alimentos RETURN NUMBER IS
        total NUMBER := 0;
    BEGIN
        FOR i IN 1 .. SELF.lista_alimentos.COUNT LOOP
            total := total + 1; -- Contabiliza cada alimento na lista
        END LOOP;
        RETURN total;
    END;
END;
/
CREATE OR REPLACE TYPE BODY tp_usuario AS
    -- Método para aplicar desconto (não faz nada no tipo base)
    MEMBER PROCEDURE aplicar_desconto (plano REF tp_plano_de_assinatura) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Nenhum desconto aplicável para este tipo de usuário.');
    END;
END;
/

-- tipo empresa
CREATE OR REPLACE TYPE tp_empresa UNDER tp_usuario (
    cnpj NUMBER,
    
    -- Sobrescrevendo o método de desconto para empresas
    OVERRIDING FINAL MEMBER PROCEDURE aplicar_desconto (plano REF tp_plano_de_assinatura)
);
/
CREATE OR REPLACE TYPE BODY tp_empresa AS
    -- Implementação do método que aplica desconto de 10% no plano
    OVERRIDING FINAL MEMBER PROCEDURE aplicar_desconto (plano REF tp_plano_de_assinatura) IS
        novo_preco DECIMAL(10, 2);
    BEGIN
        -- Calcula o novo preço com 10% de desconto
        novo_preco := plano.preco * 0.90;
        
        -- Atualiza o preço do plano
        plano.atualizar_preco(novo_preco);

    END;
END;
/

-- tipo pessoa 
CREATE OR REPLACE TYPE tp_pessoa UNDER tp_usuario (
	cpf NUMBER
);
/

-- tipo evento
CREATE OR REPLACE TYPE tp_evento AS OBJECT (
    id_evento NUMBER,
    data_hora_evento TIMESTAMP,
    duracao NUMBER,
    qtd_pessoas NUMBER(2),
    
    -- MAP MEMBER FUNCTION para formatar a descrição do evento
    MAP MEMBER FUNCTION descricao_evento RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY tp_evento AS
    -- MAP MEMBER FUNCTION para formatar a descrição do evento
    MAP MEMBER FUNCTION descricao_evento RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Evento ID: ' || SELF.id_evento || ', Data e Hora: ' || TO_CHAR(SELF.data_hora_evento, 'DD/MM/YYYY HH24:MI:SS') ||
               ', Duração: ' || SELF.duracao || ' minutos, Quantidade de Pessoas: ' || SELF.qtd_pessoas;
    END;
END;
/

-- tipo tipo espaço
CREATE TYPE tp_tipo_espaco AS OBJECT(
	nome_tipo VARCHAR2(15)
);
/

-- varray tipo espaço
CREATE TYPE varray_tipo_espaco AS VARRAY (3) OF tp_tipo_espaco; -- permite ate 3
/

-- tipo espaço de trabalho 
CREATE OR REPLACE TYPE tp_espaco_trabalho AS OBJECT (
	id_espaco NUMBER,
	tipo_espaco varray_tipo_espaco,
	capacidade NUMBER(2)
);
/

-- tipo organiza
CREATE OR REPLACE TYPE tp_organiza AS OBJECT (
	empresa REF tp_empresa,
	evento REF tp_evento
);
/

-- Criação do tipo tp_sessao
CREATE OR REPLACE TYPE tp_sessao AS OBJECT (
    id_sessao NUMBER,
    data_e_hora TIMESTAMP,
    
    -- ORDER MEMBER FUNCTION para comparar sessões por id_sessao
    ORDER MEMBER FUNCTION compare_sessao (other tp_sessao) RETURN INTEGER
);
/
CREATE OR REPLACE TYPE BODY tp_sessao AS
    ORDER MEMBER FUNCTION compare_sessao (other tp_sessao) RETURN INTEGER IS
    BEGIN
        IF SELF.id_sessao > other.id_sessao THEN
            RETURN 1;
        ELSIF SELF.id_sessao < other.id_sessao THEN
            RETURN -1;
        ELSE
            RETURN 0;
        END IF;
    END;
END;
/

-- tipo convidado
CREATE OR REPLACE TYPE tp_convidado AS OBJECT(
	numero_convidado NUMBER,
	nome_convidado VARCHAR2(50),
	pessoa REF tp_pessoa
);
/

-- tipo reserva pessoa 
CREATE OR REPLACE TYPE tp_reserva_pessoa AS OBJECT (
	pessoa REF tp_pessoa,
	espaco_trabalho REF tp_espaco_trabalho,
	qtd_pessoas NUMBER
);
/

-- tipo reserva empresa
CREATE OR REPLACE TYPE tp_reserva_empresa AS OBJECT (
	empresa REF tp_empresa,
	espaco_trabalho REF tp_espaco_trabalho,
	qtd_pessoas NUMBER
);
/
-- tipo pagamento
CREATE OR REPLACE TYPE tp_cartao_de_credito AS OBJECT (
    nome_portador VARCHAR2(100),
    cpf_portador VARCHAR2(100),
    numero_cartao NUMBER,
    data_vencimento DATE,
	codigo_seguranca CHAR,

    CONSTRUCTOR FUNCTION tp_cartao_de_credito(
        SELF IN OUT NOCOPY tp_cartao_de_credito, 
        nome_portador VARCHAR2,
        cpf_portador VARCHAR2,
        numero_cartao NUMBER,
        data_vencimento DATE,
		codigo_seguranca CHAR
    ) RETURN SELF AS RESULT
);
/
CREATE OR REPLACE TYPE BODY tp_cartao_de_credito AS
    CONSTRUCTOR FUNCTION tp_cartao_de_credito(
        SELF IN OUT tp_cartao_de_credito, 
        nome_portador VARCHAR2,
        cpf_portador VARCHAR2,
        numero_cartao NUMBER,
        data_vencimento DATE,
		codigo_seguranca CHAR
    ) RETURN SELF AS RESULT IS 
    BEGIN
        SELF.nome_portador := Nome_portador;
        SELF.cpf_portador := Cpf_portador;
        SELF.numero_cartao := Numero_cartao;
        SELF.data_vencimento := Data_vencimento;
		SELF.codigo_seguranca := Codigo_seguranca;
        RETURN;  
    END;
END;
/

CREATE OR REPLACE TYPE tp_pagamento AS OBJECT (
	id_pagamento NUMBER,
	data_hora_pagamento TIMESTAMP,
	cartao_de_credito tp_cartao_de_credito
);
/
CREATE OR REPLACE TYPE tp_compra_pessoa AS OBJECT (
	pessoa REF tp_pessoa,
	plano_de_assinatura REF tp_plano_de_assinatura,
	pagamento REF tp_pagamento,
	data_hora_compra TIMESTAMP
);
/
-- relacionamento compra n:1:1
CREATE OR REPLACE TYPE tp_compra_empresa AS OBJECT (
	empresa REF tp_empresa,
	plano_de_assinatura REF tp_plano_de_assinatura,
	pagamento REF tp_pagamento,
	data_hora_compra TIMESTAMP
);
/


CREATE TABLE tb_pagamento OF tp_pagamento (
	id_pagamento PRIMARY KEY
);
/
CREATE TABLE tb_compra_empresa OF tp_compra_empresa (
	empresa WITH ROWID REFERENCES tb_empresa,
	plano_de_assinatura WITH ROWID REFERENCES tb_plano_de_assinatura,
	pagamento WITH ROWID REFERENCES tb_pagamento
);
/
CREATE TABLE tb_compra_pessoa OF tp_compra_pessoa (
	pessoa WITH ROWID REFERENCES tb_pessoa,
	plano_de_assinatura WITH ROWID REFERENCES tb_plano_de_assinatura,
	pagamento WITH ROWID REFERENCES tb_pagamento
);
/
CREATE TABLE tb_sessao OF tp_sessao (
    id_sessao PRIMARY KEY
);
/
CREATE TABLE tb_espaco_trabalho OF tp_espaco_trabalho (
    id_espaco PRIMARY KEY
);
/

ALTER TYPE tp_espaco_trabalho ADD ATTRIBUTE descricao VARCHAR2(100) INVALIDATE;/

CREATE TABLE tb_empresa OF tp_empresa (
    id_usuario PRIMARY KEY
)NESTED TABLE lista_alimentos STORE AS nt_alimentos_empresa;
/

CREATE TABLE tb_pessoa OF tp_pessoa (
    id_usuario PRIMARY KEY
)NESTED TABLE lista_alimentos STORE AS nt_alimentos_pessoa;
/
CREATE TABLE tb_reserva_empresa OF tp_reserva_empresa (
    empresa WITH ROWID REFERENCES tb_empresa, -- Referência ao ROWID da tabela tb_pessoa
    espaco_trabalho WITH ROWID REFERENCES tb_espaco_trabalho -- Referência ao ROWID da tabela tb_espaco_trabalho
);
/
CREATE TABLE tb_reserva_pessoa OF tp_reserva_pessoa (
    pessoa WITH ROWID REFERENCES tb_pessoa, -- Referência ao ROWID da tabela tb_pessoa
    espaco_trabalho WITH ROWID REFERENCES tb_espaco_trabalho -- Referência ao ROWID da tabela tb_espaco_trabalho
);
/
CREATE TABLE tb_convidado OF tp_convidado (
	numero_convidado PRIMARY KEY,
	pessoa SCOPE IS tb_pessoa
);
/
CREATE TABLE tb_plano_de_assinatura OF tp_plano_de_assinatura (
    nivel PRIMARY KEY
);
/
CREATE TABLE tb_evento OF tp_evento (
    id_evento PRIMARY KEY
);
/
CREATE TABLE tb_organiza OF tp_organiza (
	empresa WITH ROWID REFERENCES tb_empresa,
	evento WITH ROWID REFERENCES tb_evento
);
/
CREATE TABLE enderecos OF tp_endereco (
    CONSTRAINT pk_endereco PRIMARY KEY (cep)  -- Define o CEP como chave primária
);
/


