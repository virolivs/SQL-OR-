-- Tabela pessoa
-- Quantas vezes cada alimento foi consumido pelos usuarios e ordena em mais consumido para menos
SELECT
	COUNT (p.nome) AS total_consumo,
	a.nome_produto
FROM
	tb_pessoa p,
	TABLE(p.lista_alimentos) a
GROUP BY a.nome_produto
ORDER BY total_consumo DESC

-- quantidade de vezes que cada alimento foi consumido
SELECT 
    a.nome_produto,
    COUNT(u.nome) AS total_consumos
FROM 
    tb_pessoa u,
    TABLE(u.lista_alimentos) a
GROUP BY 
    a.nome_produto
ORDER BY total_consumos DESC;

-- Quantos elementos foram consumidos por cada usuário
SELECT 
    u.nome AS nome_usuario,
    u.contar_alimentos_consumidos() AS total_alimentos_consumidos
FROM 
    tb_pessoa u
ORDER BY total_alimentos_consumidos DESC

-- lista de usuarios que consomem alimentos acima da média
SELECT p.nome, p.id_usuario, p.contar_alimentos_consumidos() AS qtd_alimentos_consumidos
FROM tb_pessoa p
WHERE p.contar_alimentos_consumidos() > (SELECT 
    AVG(u.contar_alimentos_consumidos()) AS media_consumo
FROM 
    tb_pessoa u)
ORDER BY qtd_alimentos_consumidos DESC

--Consulta dos usuarios, compras e os planos associados a eles

SELECT 
    p.id_usuario AS id_usuario,
    p.nome AS nome_usuario,
    pa.nivel AS nivel_plano,
    pa.preco AS preco_plano,
    cp.data_hora_compra AS data_hora_compra
FROM 
    tb_pessoa p
JOIN 
    tb_compra_pessoa cp ON p.id_usuario = cp.pessoa.id_usuario
JOIN 
    tb_plano_de_assinatura pa ON cp.plano_de_assinatura.id_plano = pa.id_plano;


--Descrição dos usuarios de são paulo

SELECT 
	p.descricao_usuario() AS user_description
FROM
	tb_pessoa p
WHERE
	p.id_usuario IN (SELECT 

	p.id_usuario
FROM 
	tb_pessoa p
WHERE
	p.endereco.estado = 'São Paulo')

-- retorna a quantidade total de pessoas que participaram dos eventos de empresa j e b
SELECT 
    SUM(DEREF(o.evento).qtd_pessoas) AS qtd_pessoas,
    DEREF(o.empresa).nome
FROM 
    tb_organiza o
WHERE 
    DEREF(o.empresa).id_usuario IN (
        SELECT 
            e.id_usuario id
        FROM 
            tb_empresa e
        WHERE 
            e.nome = 'Empresa J' 
        UNION ALL
        SELECT 
            e.id_usuario id 
        FROM 
            tb_empresa e
        WHERE 
            e.nome = 'Empresa B'
    )
GROUP BY 
    DEREF(o.empresa).nome;


-- Tabela empresa
-- lista da quantidade de cada tipo de alimento consumidos por determinada empresa 
SELECT 
    a.nome_produto,
    COUNT(u.nome) AS nome_usuario
FROM 
    tb_empresa u,
    TABLE(u.lista_alimentos) a
WHERE u.id_usuario = 101
GROUP BY 
    a.nome_produto
-- lista a regiao que cada empresa cadastrada pertence
SELECT 
    e.nome,
    e.endereco.cidade,
    CASE 
        WHEN e.endereco.cidade IN('Acre','Amapá','Amazonas','Pará','Rondônia','Roraima','Tocantins')  THEN 'NORTE'
        WHEN e.endereco.cidade IN('Alagoas','Bahia','Ceará','Maranhão','Paraíba','Pernambuco','Piauí','Rio Grande do Norte','Sergipe') THEN 'Nordeste'
        WHEN e.endereco.cidade IN('Goiás', 'Mato Grosso', 'Mato Grosso do Sul', 'Distrito Federal') THEN 'Centro-Oeste'
    	WHEN e.endereco.cidade IN('Espírito Santo', 'Minas Gerais', 'Rio de Janeiro', 'São Paulo') THEN 'Sudeste'
    	WHEN e.endereco.cidade IN('Paraná', 'Rio Grande do Sul', 'Santa Catarina') THEN 'Sul'
        ELSE 'Desconhecido'
    END AS região
FROM 
    tb_empresa e;



--Tabela evento
--Lista eventos que ocorrem entre determinada data
SELECT * FROM tb_evento
WHERE data_hora_evento BETWEEN TIMESTAMP '2024-10-01 14:00:00' AND TIMESTAMP '2025-01-15 15:00:00';

-- retorna o nome da empresa, o id do evento e a contagem de eventos organizados por cada empresa
SELECT 
    e.id_evento AS id_evento,
    emp.nome AS nome_empresa,  
    COUNT(o.evento) AS total_eventos
FROM 
    tb_evento e
JOIN 
    tb_organiza o ON e.id_evento = DEREF(o.evento).id_evento
JOIN 
    tb_empresa emp ON o.empresa = REF(emp)
GROUP BY 
    e.id_evento, 
    emp.nome  
ORDER BY 
    total_eventos DESC;

-- teste de ORDER MEMBER FUNCTION para comparar eventos
DECLARE
    evento1 tp_evento;  
    evento2 tp_evento;  
    resultado NUMBER;  -- Para armazenar o resultado da comparação
BEGIN
    SELECT VALUE(e)
    INTO evento1
    FROM tb_evento e
    WHERE e.id_evento = 1;
    
    SELECT VALUE(e)
    INTO evento2
    FROM tb_evento e
    WHERE e.id_evento = 2;

    -- Comparando os eventos
    resultado := evento1.compare_by_qtd_pessoas(evento2);

    -- Exibindo o resultado da comparação
    IF resultado > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Evento 1 teve mais pessoas.');
    ELSIF resultado < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Evento 2 teve mais pessoas.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Os eventos tiveram a mesma quantidade de pessoas.');
    END IF;

END;
/

-- Tabela organiza
--Retorna o nome e o id da empresa que organizou um evento com a maior qtd de pessoas
SELECT 
    DEREF(o.empresa).id_usuario AS id_empresa,
    DEREF(o.empresa).nome AS nome_empresa
FROM 
    tb_organiza o
WHERE
    DEREF(o.evento).id_evento = (
    SELECT id_evento
FROM tb_evento
WHERE qtd_pessoas = (
	SELECT MAX(qtd_pessoas) AS maior_evento
	FROM tb_evento    
))

--Consulta traz o ID da empresa, ID do evento, data/hora do evento e qtdd de participantes
SELECT DEREF(O.empresa).id_usuario AS empresa_id,
       DEREF(O.evento).id_evento AS evento_id, 
       DEREF(O.evento).data_hora_evento AS data_evento,
       DEREF(O.evento).qtd_pessoas AS participantes
FROM tb_organiza O;


-- quantidade de horas gastas em evento pela empresa J

SELECT SUM(DEREF(o.evento).duracao) as tempo_total
FROM tb_organiza o
WHERE DEREF(o.empresa).nome = 'Empresa J'

--Tabela espaco de trabalho
-- a pessoa que mais alocou pessoas numa reserva por espaço de trabalho (considera empate)
SELECT 
    e.tipo_espaco AS espaco_trabalho,
    p.nome AS nome_pessoa,
    r.qtd_pessoas AS quantidade_pessoas
FROM 
    tb_espaco_trabalho e
JOIN 
    tb_reserva_pessoa r ON r.espaco_trabalho = REF(e)  
JOIN 
    tb_pessoa p ON r.pessoa = REF(p)  
WHERE 
    r.qtd_pessoas = (
        SELECT MAX(r2.qtd_pessoas)
        FROM tb_reserva_pessoa r2
        WHERE r2.espaco_trabalho = r.espaco_trabalho
    )
ORDER BY 
    e.tipo_espaco, p.nome;



--Tabela plano de assinatura
--Média de preco dos planos de assinatura
SELECT AVG(p.preco) FROM tb_plano_de_assinatura p

--O plano de assinatura mais custo beneficio levando em conta o metodo implementado
SELECT p.calcular_valor_total() AS custo_beneficio
FROM tb_plano_de_assinatura p
ORDER BY custo_beneficio ASC
FETCH FIRST 1 ROWS ONLY;

-- retorna o plano de assinatura mais em custo benefício utilizando o método implementado
SELECT 
    p.id_plano,
    p.nivel,
    p.calcular_valor_total() AS valor_total  
FROM 
    tb_plano_de_assinatura p
ORDER BY 
    valor_total ASC  
FETCH FIRST 1 ROWS ONLY 
--Média de preco dos planos de assinatura
SELECT AVG(p.preco) FROM tb_plano_de_assinatura p


--Tabela pagamento
-- nomes de pessoas que pagaram com cartão cuja data de vencimento é em 2025 ordenada por qual está mais próximo de vencer

SELECT 
    p.cartao_de_credito.nome_portador AS nome_portador,
    p.cartao_de_credito.data_vencimento AS data_vencimento
FROM 
    tb_pagamento p
WHERE 
	EXTRACT(YEAR FROM p.cartao_de_credito.data_vencimento) = 2025
ORDER BY                                         
    data_vencimento ASC;  


--Tabela compra empresa
-- Plano de assinatura mais adquirido pelas empresas
SELECT 
	DEREF (ce.plano_de_assinatura).id_plano AS plano_mais_comprado,
    COUNT(DEREF(ce.empresa).nome) AS qtd
FROM
	tb_compra_empresa ce
GROUP BY 
	DEREF (ce.plano_de_assinatura).id_plano
ORDER BY
	qtd DESC
FETCH FIRST 1 ROWS ONLY;

-- total arrecadado ate agora com compra de plano de assinatura  pelas empresas
SELECT 
    SUM(qtd)
FROM (SELECT 
    COUNT(ce.plano_de_assinatura) * AVG(DEREF(ce.plano_de_assinatura).preco) AS qtd
FROM
    tb_compra_empresa ce
GROUP BY 
    DEREF(ce.plano_de_assinatura).id_plano)


--Tabela compra pessoa
-- total arrecadado com compra de plano de assinatura tanto de empresa quanto de pessoa
SELECT 
    SUM(qtd_total) AS total_geral
FROM (
    SELECT 
        COUNT(ce.plano_de_assinatura) * AVG(DEREF(ce.plano_de_assinatura).preco) AS qtd_total
    FROM
        tb_compra_empresa ce
    GROUP BY 
        DEREF(ce.plano_de_assinatura).id_plano

    UNION ALL

    SELECT 
        COUNT(ce.plano_de_assinatura) * AVG(DEREF(ce.plano_de_assinatura).preco) AS qtd_total
    FROM
        tb_compra_pessoa ce
    GROUP BY 
        DEREF(ce.plano_de_assinatura).id_plano
);


-- somar total de compras por plano entre os meses de março e outubro

SELECT
    p.nivel, 
    COUNT(*) AS total_compras,
	EXTRACT(MONTH FROM cp.data_hora_compra) AS mes
FROM 
    tb_compra_pessoa cp
JOIN tb_plano_de_assinatura p ON cp.plano_de_assinatura = REF(p)
WHERE 
	EXTRACT(MONTH FROM cp.data_hora_compra)  BETWEEN 3 AND 10   
    AND EXTRACT(YEAR FROM cp.data_hora_compra) = 2024 
GROUP BY 
    EXTRACT(MONTH FROM cp.data_hora_compra),
    p.nivel

-- retorna os dados de pagamento da compra do usuario 1
SELECT 
    DEREF(cp.pagamento).id_pagamento,
    DEREF(cp.pagamento).data_hora_pagamento,
    DEREF(cp.pagamento).cartao_de_credito.nome_portador,
    DEREF(cp.pagamento).cartao_de_credito.cpf_portador,
    DEREF(cp.pagamento).cartao_de_credito.numero_cartao,
    DEREF(cp.pagamento).cartao_de_credito.data_vencimento,
    DEREF(cp.pagamento).cartao_de_credito.codigo_seguranca
FROM 
    tb_compra_pessoa cp
WHERE 
	cp.pessoa.id_usuario = 1

--Tabela sessao
-- lista de convidados por sessao
-- convidados sao nested table
SELECT s.id_sessao AS id_sessao, 
       T.numero_convidado AS numero, 
       T.nome_convidado AS convidados
FROM tb_sessao s, 
     TABLE(s.lista_convidados) T;

--Tabela reserva pessoa
--retornar o princial espaco de trabalho das pessoas que moram no rj ou em sp
SELECT 
	COUNT(DEREF(rp.pessoa).id_usuario) AS qtd_usuario,
    DEREF(rp.espaco_trabalho).tipo_espaco AS tipo_espaco
FROM 
	tb_reserva_pessoa rp
WHERE 
	DEREF(rp.pessoa).endereco.estado IN('São Paulo', 'Rio de Janeiro')
GROUP BY
	DEREF(rp.espaco_trabalho).tipo_espaco
ORDER BY
	qtd_usuario DESC
FETCH FIRST 1 ROWS ONLY;

-- contar quantas pessoas participaram em cada espaço de trabalho
SELECT 
    DEREF(rp.espaco_trabalho).tipo_espaco AS tipo_espaco, 
    SUM(rp.qtd_pessoas) AS total_pessoas
FROM 
    tb_reserva_pessoa rp
GROUP BY 
    DEREF(rp.espaco_trabalho).tipo_espaco;


-- retorna o espaco de coworking mais utilizado e todas as suas informações
SELECT * FROM tb_espaco_trabalho et
WHERE et.tipo_espaco = (
    SELECT DEREF(rp.espaco_trabalho).tipo_espaco AS tipo_espaco
    FROM tb_reserva_pessoa rp
    GROUP BY DEREF(rp.espaco_trabalho).tipo_espaco
    ORDER BY COUNT(DEREF(rp.sessao).id_sessao) DESC
    FETCH FIRST 1 ROWS ONLY
);

--reserva os nomes dos usuarios de determinada sessao reservada
SELECT 
	c.nome_convidado
FROM
	tb_reserva_pessoa tb,
	TABLE(DEREF(tb.sessao).lista_convidados) c
WHERE
	DEREF(tb.sessao).id_sessao = 1

-- quantidade de convidados por sessao
SELECT 
	COUNT(c.nome_convidado),
    DEREF(tb.sessao).id_sessao
FROM
	tb_reserva_pessoa tb,
	TABLE(DEREF(tb.sessao).lista_convidados) c
GROUP BY
	DEREF(tb.sessao).id_sessao


--Tabela reserva empresa
-- retorna informações os espaços de trabalho que possuem capacidade acima média
SELECT 
    et.id_espaco,
    et.tipo_espaco,
    et.capacidade
FROM
    tb_espaco_trabalho et
WHERE
    et.capacidade > (SELECT 
	AVG(re.qtd_pessoas) AS media_qtd_pessoas
FROM
	tb_reserva_empresa re
)

-- pegar o nome e o cnpj da empresa que alocou mais pessoas em uma reserva
SELECT DEREF(re.empresa).nome AS nome_empresa, 
       DEREF(re.empresa).cnpj AS cnpj, 
       SUM(re.qtd_pessoas) AS qtd_pessoas
FROM tb_reserva_empresa re
GROUP BY DEREF(re.empresa).nome, DEREF(re.empresa).cnpj
ORDER BY qtd_pessoas DESC
FETCH FIRST 1 ROWS ONLY;


--Tabela evento
-- retorna total por mês, duração média dos eventos por mês, total de pessoas esperadas por mês
SELECT 
    TO_CHAR(data_hora_evento, 'YYYY-MM') AS mes,
    COUNT(*) AS total_eventos,
    AVG(duracao) AS duracao_media,
    SUM(qtd_pessoas) AS total_pessoas
FROM 
    tb_evento
GROUP BY 
    TO_CHAR(data_hora_evento, 'YYYY-MM')
ORDER BY 
    mes;

