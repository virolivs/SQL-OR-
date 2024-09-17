-- inserindo em pessoa, endereço e alimentação

INSERT INTO tb_pessoa VALUES (
    1, -- id_usuario
    'João Silva', -- nome
    tp_endereco('Rua A', 'Cidade X', '12', 12345678), -- endereco
    11987654321, -- telefone
    tp_lista_alimentos(tp_alimentacao(7894561237890, 'Arroz', TIMESTAMP '2024-09-15 12:30:00'), tp_alimentacao(7894561237891, 'Feijão', TIMESTAMP '2024-09-15 12:45:00')), -- lista_alimentos (Nested Table)
    12345678900 -- cpf
);

INSERT INTO tb_pessoa VALUES (
    2, -- id_usuario
    'Maria Oliveira', -- nome
    tp_endereco('Rua B', 'Cidade Y', '34', 23456789), -- endereco
    11998765432, -- telefone
    tp_lista_alimentos(tp_alimentacao(7894561237892, 'Macarrão', TIMESTAMP '2024-09-15 13:00:00'), tp_alimentacao(7894561237893, 'Carne', TIMESTAMP '2024-09-15 13:15:00')), -- lista_alimentos (Nested Table)
    98765432100 -- cpf
);

INSERT INTO tb_pessoa VALUES (
    3, -- id_usuario
    'Carlos Pereira', -- nome
    tp_endereco('Rua C', 'Cidade Z', '56', 34567890), -- endereco
    11991234567, -- telefone
    tp_lista_alimentos(tp_alimentacao(7894561237894, 'Frango', TIMESTAMP '2024-09-15 13:30:00'), tp_alimentacao(7894561237895, 'Arroz', TIMESTAMP '2024-09-15 13:45:00')), -- lista_alimentos (Nested Table)
    11223344556 -- cpf
);

INSERT INTO tb_pessoa VALUES (
    4, -- id_usuario
    'Ana Costa', -- nome
    tp_endereco('Rua D', 'Cidade W', '78', 45678901), -- endereco
    11993456789, -- telefone
    tp_lista_alimentos(tp_alimentacao(7894561237896, 'Feijão', TIMESTAMP '2024-09-15 14:00:00'), tp_alimentacao(7894561237897, 'Batata', TIMESTAMP '2024-09-15 14:15:00')), -- lista_alimentos (Nested Table)
    22334455667 -- cpf
);

INSERT INTO tb_pessoa VALUES (
    5, -- id_usuario
    'Fernanda Souza', -- nome
    tp_endereco('Rua E', 'Cidade V', '90', 56789012), -- endereco
    11994567890, -- telefone
    tp_lista_alimentos(tp_alimentacao(7894561237898, 'Peixe', TIMESTAMP '2024-09-15 14:30:00'), tp_alimentacao(7894561237899, 'Cenoura', TIMESTAMP '2024-09-15 14:45:00')), -- lista_alimentos (Nested Table)
    33445566778 -- cpf
);



-- inserindo empresa

INSERT INTO tb_empresa VALUES (
    101, -- id_usuario
    'Empresa A', -- nome
    tp_endereco('Av. Principal', 'Cidade A', '10', 11111111), -- endereco
    1133334444, -- telefone
    tp_lista_alimentos(tp_alimentacao(7891234567890, 'Café', TIMESTAMP '2024-09-15 08:00:00'), tp_alimentacao(7891234567891, 'Açúcar', TIMESTAMP '2024-09-15 08:15:00')), -- lista_alimentos (Nested Table)
    12345678000101 -- cnpj
);

INSERT INTO tb_empresa VALUES (
    102, -- id_usuario
    'Empresa B', -- nome
    tp_endereco('Rua Industrial', 'Cidade B', '20', 22222222), -- endereco
    1144445555, -- telefone
    tp_lista_alimentos(tp_alimentacao(7891234567892, 'Leite', TIMESTAMP '2024-09-15 09:00:00'), tp_alimentacao(7891234567893, 'Pão', TIMESTAMP '2024-09-15 09:15:00')), -- lista_alimentos (Nested Table)
    98765432000102 -- cnpj
);

INSERT INTO tb_empresa VALUES (
    103, -- id_usuario
    'Empresa C', -- nome
    tp_endereco('Alameda das Flores', 'Cidade C', '30', 33333333), -- endereco
    1155556666, -- telefone
    tp_lista_alimentos(tp_alimentacao(7891234567894, 'Suco', TIMESTAMP '2024-09-15 10:00:00'), tp_alimentacao(7891234567895, 'Água', TIMESTAMP '2024-09-15 10:15:00')), -- lista_alimentos (Nested Table)
    87654321000103 -- cnpj
);

INSERT INTO tb_empresa VALUES (
    104, -- id_usuario
    'Empresa D', -- nome
    tp_endereco('Av. das Nações', 'Cidade D', '40', 44444444), -- endereco
    1166667777, -- telefone
    tp_lista_alimentos(tp_alimentacao(7891234567896, 'Cerveja', TIMESTAMP '2024-09-15 11:00:00'), tp_alimentacao(7891234567897, 'Refrigerante', TIMESTAMP '2024-09-15 11:15:00')), -- lista_alimentos (Nested Table)
    76543210000104 -- cnpj
);

INSERT INTO tb_empresa VALUES (
    105, -- id_usuario
    'Empresa E', -- nome
    tp_endereco('Rua do Comércio', 'Cidade E', '50', 55555555), -- endereco
    1177778888, -- telefone
    tp_lista_alimentos(tp_alimentacao(7891234567898, 'Biscoito', TIMESTAMP '2024-09-15 12:00:00'), tp_alimentacao(7891234567899, 'Chocolate', TIMESTAMP '2024-09-15 12:15:00')), -- lista_alimentos (Nested Table)
    65432100000105 -- cnpj
);


-- inserindo evento
INSERT INTO tb_evento VALUES (
    1, -- id_evento
    TIMESTAMP '2024-10-01 14:00:00', -- data_hora_evento
    4, -- duracao (em horas)
    65 -- qtd_pessoas
);

INSERT INTO tb_evento VALUES (
    2, -- id_evento
    TIMESTAMP '2024-11-10 18:00:00', -- data_hora_evento
    3, -- duracao (em horas)
    75 -- qtd_pessoas
);

INSERT INTO tb_evento VALUES (
    3, -- id_evento
    TIMESTAMP '2024-12-05 09:00:00', -- data_hora_evento
    6, -- duracao (em horas)
    15 -- qtd_pessoas
);

INSERT INTO tb_evento VALUES (
    4, -- id_evento
    TIMESTAMP '2024-12-25 20:00:00', -- data_hora_evento
    5, -- duracao (em horas)
    20 -- qtd_pessoas
);

INSERT INTO tb_evento VALUES (
    5, -- id_evento
    TIMESTAMP '2025-01-15 15:00:00', -- data_hora_evento
    2, -- duracao (em horas)
    50 -- qtd_pessoas
);

-- exemplo de uso da map function de evento
DECLARE
    evento tp_evento;
    descricao VARCHAR2(500);
BEGIN
    -- Seleciona o evento da tabela
    SELECT VALUE(e) INTO evento
    FROM tb_evento e
    WHERE e.id_evento = 1;

    -- Chama a MAP MEMBER FUNCTION para obter a descrição do evento
    descricao := evento.descricao_evento;
    
    DBMS_OUTPUT.PUT_LINE('Descrição do Evento: ' || descricao);
END;
/


-- inserir plano de assinatura
INSERT INTO tb_plano_de_assinatura VALUES (
    tp_plano_de_assinatura(
        'Básico',  -- nivel
        12,        -- tempo
        99.99,     -- preco
        NULL       -- plano_evoluido (não evolui para outro plano neste caso)
    )
);
INSERT INTO tb_plano_de_assinatura VALUES (
    tp_plano_de_assinatura(
        'Intermediário',  -- nivel
        24,               -- tempo
        149.99,           -- preco
        NULL              -- plano_evoluido
    )
);
-- Inserir um plano que evolui do plano básico
DECLARE
    v_plano_brasico REF tp_plano_de_assinatura;
BEGIN
    SELECT REF(p)
    INTO v_plano_brasico
    FROM tb_plano_de_assinatura p
    WHERE p.nivel = 'Básico';

    -- Inserir um novo plano que evolui do plano básico
    INSERT INTO tb_plano_de_assinatura VALUES (
        tp_plano_de_assinatura(
            'Avançado',  -- nivel
            24,         -- tempo
            199.99,     -- preco
            v_plano_brasico -- plano_evoluido
        )
    );
END;
/
DECLARE
    v_plano_intermediario REF tp_plano_de_assinatura;
BEGIN
    SELECT REF(p)
    INTO v_plano_intermediario
    FROM tb_plano_de_assinatura p
    WHERE p.nivel = 'Intermediário';

    -- Inserir um novo plano que evolui do plano intermediário
    INSERT INTO tb_plano_de_assinatura VALUES (
        tp_plano_de_assinatura(
            'Avançado Plus',  -- nivel
            36,               -- tempo
            249.99,           -- preco
            v_plano_intermediario -- plano_evoluido
        )
    );
END;
/


-- inserir sessao
INSERT INTO tb_sessao VALUES (
        1, -- id_sessao
        TIMESTAMP '2024-09-15 09:00:00' -- data_e_hora
);
/
INSERT INTO tb_sessao VALUES (
    2, -- id_sessao
    TIMESTAMP '2024-09-16 14:30:00' -- data_e_hora
);
/
INSERT INTO tb_sessao VALUES (
    3, -- id_sessao
    TIMESTAMP '2024-09-17 10:00:00' -- data_e_hora
);
/
INSERT INTO tb_sessao VALUES (
    4, -- id_sessao
    TIMESTAMP '2024-09-18 18:45:00' -- data_e_hora
);
/
INSERT INTO tb_sessao VALUES (
    5, -- id_sessao
    TIMESTAMP '2024-09-19 08:15:00' -- data_e_hora
);
/
-- teste da order function
DECLARE
    sessao1 tp_sessao;
    sessao2 tp_sessao;
    resultado INTEGER;
BEGIN
    -- Selecionar a primeira sessão (id_sessao = 1)
    SELECT tp_sessao(id_sessao, data_e_hora)
    INTO sessao1
    FROM tb_sessao
    WHERE id_sessao = 1;

    -- Selecionar a segunda sessão (id_sessao = 3)
    SELECT tp_sessao(id_sessao, data_e_hora)
    INTO sessao2
    FROM tb_sessao
    WHERE id_sessao = 3;

    -- Comparar as duas sessões
    resultado := sessao1.compare_sessao(sessao2);

    -- Mostrar o resultado da comparação
    IF resultado = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Sessao 1 tem id_sessao maior que Sessao 2.');
    ELSIF resultado = -1 THEN
        DBMS_OUTPUT.PUT_LINE('Sessao 1 tem id_sessao menor que Sessao 2.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Sessao 1 tem o mesmo id_sessao que Sessao 2.');
    END IF;
END;
/


-- inserir na tabela convidado
INSERT INTO tb_convidado VALUES (
    1001,  -- numero_convidado
    'João Almeida',  -- nome_convidado
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 1)  -- Referência para o convidado com id_usuario = 1
);
INSERT INTO tb_convidado VALUES (
    1002,  -- numero_convidado
    'Maria Fernandes',  -- nome_convidado
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 2)  -- Referência para o convidado com id_usuario = 2
);
INSERT INTO tb_convidado VALUES (
    1003,  -- numero_convidado
    'Carlos Santos',  -- nome_convidado
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 3)  -- Referência para o convidado com id_usuario = 3
);
INSERT INTO tb_convidado VALUES (
    1004,  -- numero_convidado
    'Ana Costa',  -- nome_convidado
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 4)  -- Referência para o convidado com id_usuario = 4
);
INSERT INTO tb_convidado VALUES (
    1005,  -- numero_convidado
    'Pedro Oliveira',  -- nome_convidado
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 5)  -- Referência para o convidado com id_usuario = 5
);



-- inserir em reserva pessoas
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 1), -- Referência ao ROWID da tabela tb_pessoa
    (SELECT REF(e) FROM tb_espaco_trabalho e WHERE e.id_espaco = 1), -- Referência ao ROWID da tabela tb_espaco_trabalho
    2 -- Quantidade de pessoas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 2), -- Referência ao ROWID da tabela tb_pessoa
    (SELECT REF(e) FROM tb_espaco_trabalho e WHERE e.id_espaco = 2), -- Referência ao ROWID da tabela tb_espaco_trabalho
    3 -- Quantidade de pessoas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 3), -- Referência ao ROWID da tabela tb_pessoa
    (SELECT REF(e) FROM tb_espaco_trabalho e WHERE e.id_espaco = 3), -- Referência ao ROWID da tabela tb_espaco_trabalho
    4 -- Quantidade de pessoas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 4), -- Referência ao ROWID da tabela tb_pessoa
    (SELECT REF(e) FROM tb_espaco_trabalho e WHERE e.id_espaco = 4), -- Referência ao ROWID da tabela tb_espaco_trabalho
    1 -- Quantidade de pessoas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 5), -- Referência ao ROWID da tabela tb_pessoa
    (SELECT REF(e) FROM tb_espaco_trabalho e WHERE e.id_espaco = 5), -- Referência ao ROWID da tabela tb_espaco_trabalho
    5 -- Quantidade de pessoas
);


-- inserir em reserva empresas
INSERT INTO tb_reserva_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 101),  -- Referência à empresa com id_usuario 101
    (SELECT REF(et) FROM tb_espaco_trabalho et WHERE et.id_espaco = 1),  -- Referência ao espaço de trabalho com id_espaco 1
    20  -- Quantidade de pessoas
);
INSERT INTO tb_reserva_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 102),  -- Referência à empresa com id_usuario 102
    (SELECT REF(et) FROM tb_espaco_trabalho et WHERE et.id_espaco = 2),  -- Referência ao espaço de trabalho com id_espaco 2
    15  -- Quantidade de pessoas
);
INSERT INTO tb_reserva_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 103),  -- Referência à empresa com id_usuario 103
    (SELECT REF(et) FROM tb_espaco_trabalho et WHERE et.id_espaco = 3),  -- Referência ao espaço de trabalho com id_espaco 3
    25  -- Quantidade de pessoas
);
INSERT INTO tb_reserva_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 104),  -- Referência à empresa com id_usuario 104
    (SELECT REF(et) FROM tb_espaco_trabalho et WHERE et.id_espaco = 4),  -- Referência ao espaço de trabalho com id_espaco 4
    50  -- Quantidade de pessoas
);
INSERT INTO tb_reserva_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105),  -- Referência à empresa com id_usuario 105
    (SELECT REF(et) FROM tb_espaco_trabalho et WHERE et.id_espaco = 5),  -- Referência ao espaço de trabalho com id_espaco 5
    10  -- Quantidade de pessoas
);


-- Inserir Cartão de Crédito 
DECLARE
    v_cartao tp_cartao_de_credito;
BEGIN
    v_cartao := tp_cartao_de_credito(
        'João Silva',          -- nome_portador
        '123.456.789-00',      -- cpf_portador
        1234567890123456,      -- numero_cartao
        DATE '2025-12-31',     -- data_vencimento
        '123'                  -- codigo_seguranca
    );

    INSERT INTO tb_pagamento VALUES (
        tp_pagamento(
            1,                            -- id_pagamento
            TIMESTAMP '2024-09-16 15:00:00', -- data_hora_pagamento
            v_cartao                      -- cartao_de_credito
        )
    );
END;
/

DECLARE
    v_cartao tp_cartao_de_credito;
BEGIN
    v_cartao := tp_cartao_de_credito(
        'Maria Oliveira',      -- nome_portador
        '987.654.321-00',      -- cpf_portador
        6543210987654321,      -- numero_cartao
        DATE '2026-06-30',     -- data_vencimento
        '456'                  -- codigo_seguranca
    );

    INSERT INTO tb_pagamento VALUES (
        tp_pagamento(
            2,                            -- id_pagamento
            TIMESTAMP '2024-09-17 16:30:00', -- data_hora_pagamento
            v_cartao                      -- cartao_de_credito
        )
    );
END;
/

DECLARE
    v_cartao tp_cartao_de_credito;
BEGIN
    v_cartao := tp_cartao_de_credito(
        'Carlos Almeida',      -- nome_portador
        '111.222.333-44',      -- cpf_portador
        7890123456789012,      -- numero_cartao
        DATE '2027-05-15',     -- data_vencimento
        '789'                  -- codigo_seguranca
    );

    INSERT INTO tb_pagamento VALUES (
        tp_pagamento(
            3,                            -- id_pagamento
            TIMESTAMP '2024-09-18 14:45:00', -- data_hora_pagamento
            v_cartao                      -- cartao_de_credito
        )
    );
END;
/

DECLARE
    v_cartao tp_cartao_de_credito;
BEGIN
    v_cartao := tp_cartao_de_credito(
        'Ana Costa',           -- nome_portador
        '555.666.777-88',      -- cpf_portador
        8901234567890123,      -- numero_cartao
        DATE '2028-03-20',     -- data_vencimento
        '321'                  -- codigo_seguranca
    );

    INSERT INTO tb_pagamento VALUES (
        tp_pagamento(
            4,                            -- id_pagamento
            TIMESTAMP '2024-09-19 10:00:00', -- data_hora_pagamento
            v_cartao                      -- cartao_de_credito
        )
    );
END;
/