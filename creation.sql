-- Tipo endereço
CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
    rua VARCHAR2(100),
    cidade VARCHAR2(100),
    estado VARCHAR2 (100),
    numero VARCHAR2(10),
    cep NUMBER,
    CONSTRUCTOR FUNCTION tp_endereco(
        SELF IN OUT NOCOPY tp_endereco, 
        rua VARCHAR2,
        cidade VARCHAR2,
        numero VARCHAR2,
        cep NUMBER
    ) RETURN SELF AS RESULT
);
/
CREATE OR REPLACE TYPE BODY tp_endereco AS
    CONSTRUCTOR FUNCTION tp_endereco(
        SELF IN OUT tp_endereco, 
        rua VARCHAR2,
        cidade VARCHAR2,
        estado VARCHAR2,
        numero VARCHAR2,
        cep NUMBER
    ) RETURN SELF AS RESULT IS 
    BEGIN
        SELF.rua := Rua;
        SELF.cidade := Cidade;
        SELF.estado := Estado;
        SELF.numero := Numero;
        SELF.cep := Cep;
        RETURN;  
    END;
END;
/
-- tipo alimentacao
CREATE OR REPLACE TYPE tp_alimentacao AS OBJECT (
    cod_barras NUMBER,
    nome_produto VARCHAR2(100),
    data_hora_consumo TIMESTAMP
);
/
-- tipo nt alimentos
CREATE TYPE tp_lista_alimentos AS TABLE OF tp_alimentacao;
/
-- Tipo plano de assinatura com MAP MEMBER FUNCTION e Member Procedure
CREATE OR REPLACE TYPE tp_plano_de_assinatura AS OBJECT (
    id_plano NUMBER,
    nivel VARCHAR2(50),
    tempo NUMBER,
    preco DECIMAL(10, 2),
    
    -- Referência a outro plano para indicar evolução
    plano_evoluido REF tp_plano_de_assinatura,
    
    -- MAP MEMBER FUNCTION para calcular o valor total
    MAP MEMBER FUNCTION calcular_valor_total RETURN DECIMAL,

    -- Member Procedure para atualizar o preço
    MEMBER PROCEDURE atualizar_preco(novo_preco DECIMAL)
);
/
-- Adicionando a Member Procedure no tipo tp_plano_de_assinatura
CREATE OR REPLACE TYPE BODY tp_plano_de_assinatura AS
    -- Implementação da MAP MEMBER FUNCTION
    MAP MEMBER FUNCTION calcular_valor_total RETURN DECIMAL IS
    BEGIN
        RETURN SELF.preco * SELF.tempo;
    END;

    -- Member Procedure para atualizar o preço
    MEMBER PROCEDURE atualizar_preco(novo_preco DECIMAL) IS
    BEGIN
        SELF.preco := novo_preco; -- Atualiza o preço do objeto
        -- Atualiza o preço na tabela tb_plano_de_assinatura
        UPDATE tb_plano_de_assinatura 
        SET preco = novo_preco 
        WHERE id_plano = SELF.id_plano;
    END;
END;
/

-- Tipo de Telefone
CREATE TYPE tp_tipo_telefone AS OBJECT(
    numero_telefone NUMBER -- número de telefone
);
/
-- VARRAY para múltiplos telefones
CREATE TYPE varray_tipo_telefone AS VARRAY (3) OF tp_tipo_telefone; -- permite até 3 números de telefone
/
-- Tipo para armazenar o VARRAY de telefones e o ID do usuário
CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    id_usuario NUMBER, -- ID do usuário associado
    telefones varray_tipo_telefone -- múltiplos telefones
);
/
-- tipo convidado
CREATE OR REPLACE TYPE tp_convidado AS OBJECT(
	numero_convidado NUMBER,
	nome_convidado VARCHAR2(50)
);
/
-- tipo nt convidado
CREATE TYPE tp_lista_convidados AS TABLE OF tp_convidado;
/
-- Modificação do tipo usuario para incluir a função que pode ser sobrescrita
CREATE OR REPLACE TYPE tp_usuario AS OBJECT (
    id_usuario NUMBER, 
    nome VARCHAR2(25),
    endereco tp_endereco, 
    telefone varray_tipo_telefone,  -- VARRAY para múltiplos números de telefone
    lista_alimentos tp_lista_alimentos,
    
    -- Método FINAL para contar os alimentos consumidos
    FINAL MEMBER FUNCTION contar_alimentos_consumidos RETURN NUMBER,

    -- Método que pode ser sobrescrito para descrição do usuário
    MEMBER FUNCTION descricao_usuario RETURN VARCHAR2
) NOT FINAL;
/
CREATE OR REPLACE TYPE BODY tp_usuario AS
    -- Implementação do método FINAL que conta os alimentos consumidos
    FINAL MEMBER FUNCTION contar_alimentos_consumidos RETURN NUMBER IS
        total_alimentos NUMBER := 0;
    BEGIN
        IF SELF.lista_alimentos IS NOT NULL THEN
            total_alimentos := SELF.lista_alimentos.COUNT;
        END IF;
        RETURN total_alimentos;
    END contar_alimentos_consumidos;

    -- Implementação da função de descrição do usuário
    MEMBER FUNCTION descricao_usuario RETURN VARCHAR2 IS
        descricao VARCHAR2(4000);
        telefone_list VARCHAR2(100);
    BEGIN
        -- Formatação da lista de telefones
        telefone_list := '';
        FOR i IN 1 .. SELF.telefone.COUNT LOOP
            telefone_list := telefone_list || SELF.telefone(i).numero_telefone || ', ';
        END LOOP;

        -- Monta a descrição
        descricao := 'ID: ' || SELF.id_usuario || ', Nome: ' || SELF.nome || 
                     ', Telefones: ' || RTRIM(telefone_list, ', ') ||
                     ', Total de Alimentos: ' || SELF.contar_alimentos_consumidos;

        RETURN descricao;
    END descricao_usuario;
END;
/
-- tipo empresa
CREATE OR REPLACE TYPE tp_empresa UNDER tp_usuario (
    cnpj NUMBER
);
/
-- tipo pessoa 
CREATE OR REPLACE TYPE tp_pessoa UNDER tp_usuario (
    cpf NUMBER,
    lista_convidados tp_lista_convidados,

    -- Sobrescrevendo a função de descrição do usuário
    OVERRIDING MEMBER FUNCTION descricao_usuario RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY tp_pessoa AS
    -- Sobrescrevendo a função de descrição do usuário
    OVERRIDING MEMBER FUNCTION descricao_usuario RETURN VARCHAR2 IS
        descricao VARCHAR2(4000);
        telefone_list VARCHAR2(100);
        convidados_list VARCHAR2(4000);
    BEGIN
        -- Formatação da lista de telefones
        telefone_list := '';
        FOR i IN 1 .. SELF.telefone.COUNT LOOP
            telefone_list := telefone_list || SELF.telefone(i).numero_telefone || ', ';
        END LOOP;

        -- Formatação da lista de convidados
        convidados_list := '';
        FOR i IN 1 .. SELF.lista_convidados.COUNT LOOP
            convidados_list := convidados_list || SELF.lista_convidados(i).nome_convidado || ' (Convidado ' || SELF.lista_convidados(i).numero_convidado || '), ';
        END LOOP;

        -- Monta a descrição
        descricao := 'ID: ' || SELF.id_usuario || ', Nome: ' || SELF.nome || 
                     ', Telefones: ' || RTRIM(telefone_list, ', ') || 
                     ', Total de Alimentos: ' || SELF.contar_alimentos_consumidos || 
                     ', Convidados: ' || RTRIM(convidados_list, ', ');

        RETURN descricao;
    END descricao_usuario;
END;
/
CREATE OR REPLACE TYPE tp_evento AS OBJECT (
    id_evento NUMBER,
    data_hora_evento TIMESTAMP,
    duracao NUMBER,
    qtd_pessoas NUMBER,
    
    -- ORDER MEMBER FUNCTION para comparar eventos
    ORDER MEMBER FUNCTION compare_by_qtd_pessoas(other_event IN tp_evento) RETURN NUMBER
);
/
CREATE OR REPLACE TYPE BODY tp_evento AS
    ORDER MEMBER FUNCTION compare_by_qtd_pessoas(other_event IN tp_evento) RETURN NUMBER IS
    BEGIN
        RETURN SELF.qtd_pessoas - other_event.qtd_pessoas;
    END compare_by_qtd_pessoas;
END;
/

-- Tipo de espaço
CREATE OR REPLACE TYPE tp_espaco_trabalho AS OBJECT (
    id_espaco NUMBER,
    tipo_espaco VARCHAR2(50),  
    capacidade NUMBER
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
    lista_convidados tp_lista_convidados
);
/
-- tipo reserva pessoa 
CREATE OR REPLACE TYPE tp_reserva_pessoa AS OBJECT (
	pessoa REF tp_pessoa,
	espaco_trabalho REF tp_espaco_trabalho,
    sessao REF tp_sessao,
	qtd_pessoas NUMBER
);
/
-- tipo reserva empresa
CREATE OR REPLACE TYPE tp_reserva_empresa AS OBJECT (
	empresa REF tp_empresa,
	espaco_trabalho REF tp_espaco_trabalho,
    sessao REF tp_sessao,
	qtd_pessoas NUMBER
);
/
-- Tipo pagamento
CREATE OR REPLACE TYPE tp_cartao_de_credito AS OBJECT (
    nome_portador VARCHAR2(100),
    cpf_portador VARCHAR2(11),  -- CPF geralmente tem 11 dígitos
    numero_cartao VARCHAR2(16),  -- Cartão geralmente tem 16 dígitos
    data_vencimento DATE,
    codigo_seguranca VARCHAR2(4),  -- Ajuste aqui para refletir o código de segurança

    CONSTRUCTOR FUNCTION tp_cartao_de_credito(
        SELF IN OUT NOCOPY tp_cartao_de_credito, 
        nome_portador VARCHAR2,
        cpf_portador VARCHAR2,
        numero_cartao VARCHAR2,
        data_vencimento DATE,
        codigo_seguranca VARCHAR2
    ) RETURN SELF AS RESULT
);
/
CREATE OR REPLACE TYPE BODY tp_cartao_de_credito AS
    CONSTRUCTOR FUNCTION tp_cartao_de_credito(
        SELF IN OUT tp_cartao_de_credito, 
        nome_portador VARCHAR2,
        cpf_portador VARCHAR2,
        numero_cartao VARCHAR2,
        data_vencimento DATE,
        codigo_seguranca VARCHAR2
    ) RETURN SELF AS RESULT IS 
    BEGIN
        SELF.nome_portador := nome_portador;  -- Corrigido para minúsculas
        SELF.cpf_portador := cpf_portador;
        SELF.numero_cartao := numero_cartao;
        SELF.data_vencimento := data_vencimento;
        SELF.codigo_seguranca := codigo_seguranca;
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







CREATE TABLE tb_plano_de_assinatura OF tp_plano_de_assinatura (
    id_plano PRIMARY KEY
);
/
CREATE TABLE tb_pagamento OF tp_pagamento (
	id_pagamento PRIMARY KEY
);
/
CREATE TABLE tb_empresa OF tp_empresa (
    id_usuario PRIMARY KEY
)NESTED TABLE lista_alimentos STORE AS nt_alimentos_empresa;
/
CREATE TABLE tb_pessoa OF tp_pessoa (
    id_usuario PRIMARY KEY
)NESTED TABLE lista_alimentos STORE AS nt_alimentos_pessoa
NESTED TABLE lista_convidados STORE AS nt_convidados_pessoa;
/
CREATE TABLE tb_compra_empresa OF tp_compra_empresa (
	empresa WITH ROWID REFERENCES tb_empresa NOT NULL,
    plano_de_assinatura WITH ROWID REFERENCES tb_plano_de_assinatura NOT NULL,
    pagamento WITH ROWID REFERENCES tb_pagamento NOT NULL
);
/
CREATE TABLE tb_compra_pessoa OF tp_compra_pessoa (
	pessoa WITH ROWID REFERENCES tb_pessoa NOT NULL,
    plano_de_assinatura WITH ROWID REFERENCES tb_plano_de_assinatura NOT NULL,
    pagamento WITH ROWID REFERENCES tb_pagamento NOT NULL
);
/
CREATE TABLE tb_sessao OF tp_sessao (
    id_sessao PRIMARY KEY
)NESTED TABLE lista_convidados STORE AS nt_convidados_sessao;
/
CREATE TABLE tb_reserva_empresa OF tp_reserva_empresa (
    empresa WITH ROWID REFERENCES tb_empresa NOT NULL
);
/
CREATE TABLE tb_reserva_pessoa OF tp_reserva_pessoa (
    pessoa WITH ROWID REFERENCES tb_pessoa NOT NULL
);
/
CREATE TABLE tb_evento OF tp_evento (
    id_evento PRIMARY KEY
);
/
CREATE TABLE tb_organiza OF tp_organiza (
    empresa WITH ROWID SCOPE IS tb_empresa NOT NULL, 
    evento WITH ROWID SCOPE IS tb_evento NOT NULL    
);
/
CREATE TABLE tb_espaco_trabalho OF tp_espaco_trabalho(
    id_espaco PRIMARY KEY       
);