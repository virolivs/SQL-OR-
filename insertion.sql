-- Inserir pessoa
INSERT INTO tb_pessoa VALUES (
    1,  -- id_usuario
    'João Silva',  -- nome
    tp_endereco('Rua das Flores', 'São Paulo', 'São Paulo', '12', 12345678),  -- endereco com estado
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(11987654321)  -- um telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7894561237890, 'Chips de Batata Doce', TIMESTAMP '2024-09-15 12:30:00'), 
        tp_alimentacao(7894561237891, 'Pudim', TIMESTAMP '2024-09-15 12:45:00'),
        tp_alimentacao(7894561237892, 'Iogurte', TIMESTAMP '2024-09-15 12:50:00')
    ), 
    12345678900,
    tp_lista_convidados(  -- lista de convidados (Nested Table)
        tp_convidado(1, 'Carlos Silva')  -- apenas um convidado
    )
);
INSERT INTO tb_pessoa VALUES (
    2,  -- id_usuario
    'Maria Oliveira',  -- nome
    tp_endereco('Rua Vinte e Cinco de Março', 'Rio de Janeiro', 'Rio de Janeiro', '34', 23456789),  -- endereco com estado
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(11998765432), 
        tp_tipo_telefone(21987654321)  -- dois telefones
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7894561237893, 'Chips de Batata Doce', TIMESTAMP '2024-09-15 13:00:00'),
        tp_alimentacao(7894561237894, 'Barrinhas de Cereais', TIMESTAMP '2024-09-15 13:15:00')
    ), 
    98765432100,
    tp_lista_convidados(  -- lista de convidados (Nested Table)
        tp_convidado(2, 'Lucas Mendes'), 
        tp_convidado(3, 'Ana Costa'), 
        tp_convidado(4, 'Joana Silva')
    )
);
INSERT INTO tb_pessoa VALUES (
    3,  -- id_usuario
    'Carlos Pereira',  -- nome
    tp_endereco('Avenida Paulista', 'São Paulo', 'São Paulo', '56', 34567890),  -- endereco com estado
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(11991234567)  -- apenas um telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7894561237895, 'Iogurte', TIMESTAMP '2024-09-15 13:30:00'), 
        tp_alimentacao(7894561237896, 'Smoothies em Garrafinhas', TIMESTAMP '2024-09-15 13:45:00')
    ), 
    11223344556,
    tp_lista_convidados(  -- lista de convidados (Nested Table)
        tp_convidado(5, 'Fernanda Souza'),    
        tp_convidado(6, 'José Almeida')
    )
);
INSERT INTO tb_pessoa VALUES (
    4,  -- id_usuario
    'Ana Costa',  -- nome
    tp_endereco('Rua Augusta', 'Campinas', 'São Paulo', '78', 45678901),  -- endereco com estado
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(11993456789), 
        tp_tipo_telefone(21987654321), 
        tp_tipo_telefone(21912345678)  -- três telefones
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7894561237897, 'Biscoitos Integrais', TIMESTAMP '2024-09-15 14:00:00'),
        tp_alimentacao(7894561237898, 'Pipoca', TIMESTAMP '2024-09-15 14:15:00')
    ), 
    22334455667,
    tp_lista_convidados(  -- lista de convidados (Nested Table)
        tp_convidado(7, 'Ricardo Lima')
    )
);
INSERT INTO tb_pessoa VALUES (
    5,  -- id_usuario
    'Fernanda Souza',  -- nome
    tp_endereco('Rua das Palmeiras', 'Salvador', 'Bahia', '90', 56789012),  -- endereco com estado
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(11994567890), 
        tp_tipo_telefone(21987654322)  -- dois telefones
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7894561237899, 'Fatia de Bolo', TIMESTAMP '2024-09-15 14:30:00'), 
        tp_alimentacao(7894561237900, 'Café', TIMESTAMP '2024-09-15 14:45:00')
    ), 
    33445566778,
    tp_lista_convidados(  -- lista de convidados (Nested Table)
        tp_convidado(8, 'Sofia Andrade'),    
        tp_convidado(9, 'Gabriel Santos')
    )
);
INSERT INTO tb_pessoa VALUES (
    6,  -- id_usuario
    'Lucas Mendes',  -- nome
    tp_endereco('Avenida Brasil', 'Belo Horizonte', 'Minas Gerais', '101', 67890123),  -- endereco com estado
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(11995678901), 
        tp_tipo_telefone(21956789012)  -- dois telefones
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7894561237900, 'Iogurte', TIMESTAMP '2024-09-15 15:00:00'), 
        tp_alimentacao(7894561237901, 'Smoothies em Garrafinhas', TIMESTAMP '2024-09-15 15:15:00')
    ), 
    44556677889,
    tp_lista_convidados(  -- lista de convidados (Nested Table)
        tp_convidado(10, 'Pedro Ferreira')
    )
);
INSERT INTO tb_pessoa VALUES (
    7,  -- id_usuario
    'Clara Santos',  -- nome
    tp_endereco('Rua Sete de Setembro', 'Curitiba', 'Paraná', '202', 78901234),  -- endereco com estado
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(11996789012)  -- um telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7894561237902, 'Chips de Batata Doce', TIMESTAMP '2024-09-15 15:30:00')
    ), 
    55667788990,
    tp_lista_convidados(  -- lista de convidados (Nested Table)
        tp_convidado(11, 'Bruno Marques')
    )
);
INSERT INTO tb_pessoa VALUES (
    8,  -- id_usuario
    'Pedro Ferreira',  -- nome
    tp_endereco('Rua XV de Novembro', 'Florianópolis', 'Santa Catarina', '303', 89012345),  -- endereco com estado
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(11997890123), 
        tp_tipo_telefone(21978901234)  -- dois telefones
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7894561237904, 'Pipoca', TIMESTAMP '2024-09-15 16:00:00')
    ), 
    66778899001,
    tp_lista_convidados(  -- lista de convidados (Nested Table)
        tp_convidado(12, 'Lucas Oliveira'),    
        tp_convidado(13, 'Marta Reis')
    )
);
INSERT INTO tb_pessoa VALUES (
    9,  -- id_usuario
    'Helena Duarte',  -- nome
    tp_endereco('Rua da Consolação', 'Porto Alegre', 'Rio Grande do Sul', '404', 90123456),  -- endereco com estado
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(11998901234)  -- um telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7894561237906, 'Pudim', TIMESTAMP '2024-09-15 16:30:00'), 
        tp_alimentacao(7894561237907, 'Café', TIMESTAMP '2024-09-15 16:45:00')
    ), 
    77889900112,
    tp_lista_convidados(  -- lista de convidados (Nested Table)
        tp_convidado(14, 'Mariana Costa')
    )
);
INSERT INTO tb_pessoa VALUES (
    10,  -- id_usuario
    'Ricardo Lima',  -- nome
    tp_endereco('Avenida Rio Branco', 'Fortaleza', 'Ceará', '505', 01234567),  -- endereco com estado
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(11999012345), 
        tp_tipo_telefone(21990123456)  -- dois telefones
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7894561237908, 'Fatia de Bolo', TIMESTAMP '2024-09-15 17:00:00'), 
        tp_alimentacao(7894561237909, 'Chips de Batata Doce', TIMESTAMP '2024-09-15 17:15:00')
    ), 
    88990011223,
    tp_lista_convidados(  -- lista de convidados (Nested Table)
        tp_convidado(15, 'Thiago Carvalho'),    
        tp_convidado(16, 'Paula Silva'), 
        tp_convidado(17, 'Gustavo Rocha')
    )
);
INSERT INTO tb_pessoa VALUES (
    11,  
    'Renata Alves',  
    tp_endereco('Rua dos Andradas', 'Belo Horizonte', 'Minas Gerais', '101', 98765432),  
    varray_tipo_telefone(  
        tp_tipo_telefone(31987654321), 
        tp_tipo_telefone(31912345678)
    ),
    tp_lista_alimentos(  
        tp_alimentacao(7894561237911, 'Pudim', TIMESTAMP '2024-09-16 12:30:00'),
        tp_alimentacao(7894561237912, 'Barrinhas de Cereais', TIMESTAMP '2024-09-16 12:45:00'),
        tp_alimentacao(7894561237913, 'Chips de Batata Doce', TIMESTAMP '2024-09-16 13:00:00'),
        tp_alimentacao(7894561237914, 'Biscoitos Integrais', TIMESTAMP '2024-09-16 13:15:00'),
        tp_alimentacao(7894561237915, 'Tortinhas de Grão-de-Bico', TIMESTAMP '2024-09-16 13:30:00')
    ), 
    11223344556,
    tp_lista_convidados(  
        tp_convidado(21, 'Mariana Silva'),    
        tp_convidado(22, 'Fernando Lima'),    
        tp_convidado(23, 'Juliana Santos'),
        tp_convidado(24, 'Carlos Alberto'), 
        tp_convidado(25, 'Ana Beatriz')
    )
);
INSERT INTO tb_pessoa VALUES (
    12,  
    'Thiago Gomes',  
    tp_endereco('Rua São Paulo', 'São Paulo', 'São Paulo', '202', 12345678),  
    varray_tipo_telefone(  
        tp_tipo_telefone(11987654321), 
        tp_tipo_telefone(11912345678)
    ),
    tp_lista_alimentos(  
        tp_alimentacao(7894561237916, 'Chips de Batata Doce', TIMESTAMP '2024-09-16 15:30:00'),
        tp_alimentacao(7894561237917, 'Pipoca', TIMESTAMP '2024-09-16 15:45:00'),
        tp_alimentacao(7894561237918, 'Iogurte', TIMESTAMP '2024-09-16 16:00:00'),
        tp_alimentacao(7894561237919, 'Smoothies em Garrafinhas', TIMESTAMP '2024-09-16 16:15:00'),
        tp_alimentacao(7894561237920, 'Biscoitos Integrais', TIMESTAMP '2024-09-16 16:30:00')
    ), 
    22334455667,
    tp_lista_convidados(  
        tp_convidado(26, 'Sofia Almeida'),    
        tp_convidado(27, 'Gustavo Mendes'),    
        tp_convidado(28, 'Luana Costa'), 
        tp_convidado(29, 'Pedro Henrique'), 
        tp_convidado(30, 'Clara Nascimento')
    )
);
INSERT INTO tb_pessoa VALUES (
    13,  
    'Fernanda Lima',  
    tp_endereco('Rua da Consolação', 'São Paulo', 'São Paulo', '303', 23456789),  
    varray_tipo_telefone(  
        tp_tipo_telefone(11998765432), 
        tp_tipo_telefone(11987654321)
    ),
    tp_lista_alimentos(  
        tp_alimentacao(7894561237922, 'Chips de Batata Doce', TIMESTAMP '2024-09-16 15:30:00'),
        tp_alimentacao(7894561237923, 'Pudim', TIMESTAMP '2024-09-16 15:45:00'),
        tp_alimentacao(7894561237924, 'Salgadinho', TIMESTAMP '2024-09-16 16:00:00'),
        tp_alimentacao(7894561237925, 'Iogurte', TIMESTAMP '2024-09-16 16:15:00'),
        tp_alimentacao(7894561237926, 'Barrinhas de Cereais', TIMESTAMP '2024-09-16 16:30:00'),
        tp_alimentacao(7894561237927, 'Pipoca', TIMESTAMP '2024-09-16 16:45:00')
    ), 
    33445566778,
    tp_lista_convidados(  
        tp_convidado(31, 'Ricardo Pereira'),    
        tp_convidado(32, 'Bruna Martins'),    
        tp_convidado(33, 'Felipe Souza'), 
        tp_convidado(34, 'Jessica Ribeiro'), 
        tp_convidado(35, 'Lucas Silva'),
        tp_convidado(36, 'Patrícia Almeida')
    )
);
INSERT INTO tb_pessoa VALUES (
    14,  
    'Bruno Martins',  
    tp_endereco('Rua Sete de Setembro', 'Curitiba', 'Paraná', '404', 34567890),  
    varray_tipo_telefone(  
        tp_tipo_telefone(41987654321), 
        tp_tipo_telefone(41912345678)
    ),
    tp_lista_alimentos(  
        tp_alimentacao(7894561237928, 'Chips de Batata Doce', TIMESTAMP '2024-09-16 17:00:00'),
        tp_alimentacao(7894561237929, 'Salgadinho', TIMESTAMP '2024-09-16 17:15:00'),
        tp_alimentacao(7894561237930, 'Pipoca', TIMESTAMP '2024-09-16 17:30:00'),
        tp_alimentacao(7894561237931, 'Iogurte', TIMESTAMP '2024-09-16 17:45:00'),
        tp_alimentacao(7894561237932, 'Smoothies em Garrafinhas', TIMESTAMP '2024-09-16 18:00:00')
    ), 
    44556677889,
    tp_lista_convidados(  
        tp_convidado(37, 'Nathália Lima'),    
        tp_convidado(38, 'Roberto Costa'),    
        tp_convidado(39, 'Gabriel Santos'), 
        tp_convidado(40, 'Camila Almeida'), 
        tp_convidado(41, 'André Ribeiro')
    )
);
INSERT INTO tb_pessoa VALUES (
    15,  
    'Gabriel Santos',  
    tp_endereco('Avenida das Américas', 'Rio de Janeiro', 'Rio de Janeiro', '505', 45678901),  
    varray_tipo_telefone(  
        tp_tipo_telefone(21987654321), 
        tp_tipo_telefone(21912345678)
    ),
    tp_lista_alimentos(  
        tp_alimentacao(7894561237933, 'Chips de Batata Doce', TIMESTAMP '2024-09-16 18:00:00'),
        tp_alimentacao(7894561237934, 'Pudim', TIMESTAMP '2024-09-16 18:15:00'),
        tp_alimentacao(7894561237935, 'Barrinhas de Cereais', TIMESTAMP '2024-09-16 18:30:00'),
        tp_alimentacao(7894561237936, 'Pipoca', TIMESTAMP '2024-09-16 18:45:00'),
        tp_alimentacao(7894561237937, 'Salgadinho', TIMESTAMP '2024-09-16 19:00:00'),
        tp_alimentacao(7894561237938, 'Iogurte', TIMESTAMP '2024-09-16 19:15:00')
    ), 
    55667788990,
    tp_lista_convidados(  
        tp_convidado(42, 'Laura Teixeira'),    
        tp_convidado(43, 'Hugo Soares'),    
        tp_convidado(44, 'Eliane Dias'), 
        tp_convidado(45, 'Vanessa Costa'), 
        tp_convidado(46, 'Renato Lima')
    )
);
INSERT INTO tb_pessoa VALUES (
    16,  
    'Nathália Lima',  
    tp_endereco('Rua Floriano Peixoto', 'Salvador', 'Bahia', '606', 56789012),  
    varray_tipo_telefone(  
        tp_tipo_telefone(71987654321), 
        tp_tipo_telefone(71912345678)
    ),
    tp_lista_alimentos(  
        tp_alimentacao(7894561237939, 'Chips de Batata Doce', TIMESTAMP '2024-09-16 19:30:00'), 
        tp_alimentacao(7894561237940, 'Pipoca', TIMESTAMP '2024-09-16 19:45:00'),
        tp_alimentacao(7894561237941, 'Refrigerante', TIMESTAMP '2024-09-16 20:00:00'),
        tp_alimentacao(7894561237942, 'Iogurte', TIMESTAMP '2024-09-16 20:15:00'),
        tp_alimentacao(7894561237943, 'Bolacha', TIMESTAMP '2024-09-16 20:30:00')
    ), 
    66778899001,
    tp_lista_convidados(  
        tp_convidado(47, 'Eduardo Almeida'),    
        tp_convidado(48, 'Karina Santos'),    
        tp_convidado(49, 'Marcos Paulo'), 
        tp_convidado(50, 'Tatiane Lopes'), 
        tp_convidado(51, 'Simone Gomes')
    )
);
INSERT INTO tb_pessoa VALUES (
    17,  
    'Roberto Costa',  
    tp_endereco('Avenida Paulista', 'São Paulo', 'São Paulo', '707', 67890123),  
    varray_tipo_telefone(  
        tp_tipo_telefone(11987654321), 
        tp_tipo_telefone(11912345678)
    ),
    tp_lista_alimentos(  
        tp_alimentacao(7894561237945, 'Sanduíches', TIMESTAMP '2024-09-16 21:00:00'), 
        tp_alimentacao(7894561237946, 'Biscoitos Integrais', TIMESTAMP '2024-09-16 21:15:00')
    ), 
    77889900112,
    tp_lista_convidados(  
        tp_convidado(52, 'Patricia Lopes'),    
        tp_convidado(53, 'Fábio Santos'),    
        tp_convidado(54, 'Gustavo Silva'), 
        tp_convidado(55, 'Natalia Martins'), 
        tp_convidado(56, 'Vitor Hugo')
    )
);
INSERT INTO tb_pessoa VALUES (
    18,  
    'Lucas Oliveira',  
    tp_endereco('Rua 15 de Novembro', 'Porto Alegre', 'Rio Grande do Sul', '808', 78901234),  
    varray_tipo_telefone(  
        tp_tipo_telefone(51987654321), 
        tp_tipo_telefone(51912345678)
    ),
    tp_lista_alimentos(  
        tp_alimentacao(7894561237950, 'Smoothies em Garrafinhas', TIMESTAMP '2024-09-16 22:30:00'), 
        tp_alimentacao(7894561237951, 'Barrinhas de Cereais', TIMESTAMP '2024-09-16 22:45:00'),
        tp_alimentacao(7894561237952, 'Salgadinho', TIMESTAMP '2024-09-16 23:00:00'),
        tp_alimentacao(7894561237953, 'Café', TIMESTAMP '2024-09-16 23:15:00'),
        tp_alimentacao(7894561237954, 'Energético', TIMESTAMP '2024-09-16 23:30:00')
    ), 
    88990011223,
    tp_lista_convidados(  
        tp_convidado(57, 'Camila Almeida'),    
        tp_convidado(58, 'Felipe Martins'),    
        tp_convidado(59, 'Luiz Fernando'), 
        tp_convidado(60, 'Tatiane Mendes'), 
        tp_convidado(61, 'Sérgio Gomes'),
        tp_convidado(62, 'Carla Dias')
    )
);
INSERT INTO tb_pessoa VALUES (
    19,  
    'Fernanda Silva',  
    tp_endereco('Rua das Flores', 'Belo Horizonte', 'Minas Gerais', '404', 34567890),  
    varray_tipo_telefone(  
        tp_tipo_telefone(31987654321), 
        tp_tipo_telefone(31912345678)
    ),
    tp_lista_alimentos(  
    ), 
    99887766554,
    tp_lista_convidados(  
    )
);
INSERT INTO tb_pessoa VALUES (
    20,  
    'Sérgio Gomes',  
    tp_endereco('Rua do Comércio', 'Recife', 'Pernambuco', '123', 23456789),  
    varray_tipo_telefone(  
        tp_tipo_telefone(81987654321), 
        tp_tipo_telefone(81912345678)
    ),
    tp_lista_alimentos(  
        tp_alimentacao(7894561237961, 'Chips de Batata Doce', TIMESTAMP '2024-09-17 00:10:00'), 
        tp_alimentacao(7894561237962, 'Pipoca', TIMESTAMP '2024-09-17 00:15:00'),
        tp_alimentacao(7894561237963, 'Refrigerante', TIMESTAMP '2024-09-17 00:20:00'),
        tp_alimentacao(7894561237964, 'Iogurte', TIMESTAMP '2024-09-17 00:25:00'),
        tp_alimentacao(7894561237965, 'Bolacha', TIMESTAMP '2024-09-17 00:30:00')
    ), 
    11223344556,
    tp_lista_convidados(  
        tp_convidado(68, 'Mariana Ferreira'),    
        tp_convidado(69, 'Carlos Eduardo'),    
        tp_convidado(70, 'Letícia Almeida'), 
        tp_convidado(71, 'Thiago Silva'), 
        tp_convidado(72, 'Flávia Santos')
    )
);

-- inserir empresa e endereço
INSERT INTO tb_empresa VALUES (
    101,  -- id_usuario
    'Empresa A',  -- nome
        tp_endereco('Avenida Paulista', 'São Paulo', 'São Paulo', '10', 11111111), -- endereco
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(1133334444), 
        tp_tipo_telefone(2133334444)  -- exemplo de segundo telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7891234567890, 'Café', TIMESTAMP '2024-09-15 08:00:00'), 
        tp_alimentacao(7891234567891, 'Chips de Batata Doce', TIMESTAMP '2024-09-15 08:15:00'),
        tp_alimentacao(7891234567892, 'Sanduíches', TIMESTAMP '2024-09-15 08:30:00'),
        tp_alimentacao(7891234567893, 'Pipoca', TIMESTAMP '2024-09-15 09:00:00'), 
        tp_alimentacao(7891234567894, 'Barrinhas de Cereais', TIMESTAMP '2024-09-15 09:15:00'),
        tp_alimentacao(7891234567891, 'Chips de Batata Doce', TIMESTAMP '2024-09-15 08:15:00'),
        tp_alimentacao(7891234567892, 'Sanduíches', TIMESTAMP '2024-09-15 08:30:00')
    ), 
    12345678000101  -- cnpj
);
INSERT INTO tb_empresa VALUES (
    102,  -- id_usuario
    'Empresa B',  -- nome
    tp_endereco('Rua 25 de Março', 'São Paulo', 'São Paulo', '20', 22222222),  -- endereco
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(1144445555), 
        tp_tipo_telefone(2144445555)  -- exemplo de segundo telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7891234567893, 'Pipoca', TIMESTAMP '2024-09-15 09:00:00'), 
        tp_alimentacao(7891234567894, 'Barrinhas de Cereais', TIMESTAMP '2024-09-15 09:15:00'),
        tp_alimentacao(7891234567891, 'Chips de Batata Doce', TIMESTAMP '2024-09-15 08:15:00'),
        tp_alimentacao(7891234567892, 'Sanduíches', TIMESTAMP '2024-09-15 08:30:00')
    ), 
    98765432000102  -- cnpj
);
INSERT INTO tb_empresa VALUES (
    103,  -- id_usuario
    'Empresa C',  -- nome
    tp_endereco('Rua Oscar Freire', 'São Paulo', 'São Paulo', '30', 33333333),  -- endereco
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(1155556666), 
        tp_tipo_telefone(2155556666)  -- exemplo de segundo telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7891234567896, 'Smoothies em Garrafinhas', TIMESTAMP '2024-09-15 10:15:00'),
        tp_alimentacao(7891234567892, 'Sanduíches', TIMESTAMP '2024-09-15 08:30:00'),
        tp_alimentacao(7891234567970, 'Refrigerante', TIMESTAMP '2024-09-15 12:15:00'),  -- Repetição de Refrigerante
        tp_alimentacao(7891234567971, 'Pudim', TIMESTAMP '2024-09-15 12:30:00'),
        tp_alimentacao(7891234567972, 'Pudim', TIMESTAMP '2024-09-15 12:45:00'),  -- Repetição de Pudim
        tp_alimentacao(7891234567973, 'Café', TIMESTAMP '2024-09-15 13:00:00')
    ), 
    87654321000103  -- cnpj
);
INSERT INTO tb_empresa VALUES (
    104,  -- id_usuario
    'Empresa D',  -- nome
    tp_endereco('Avenida Brasil', 'Rio de Janeiro', 'Rio de Janeiro', '40', 44444444),  -- endereco
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(1166667777), 
        tp_tipo_telefone(2166667777)  -- exemplo de segundo telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7891234567899, 'Salgadinho', TIMESTAMP '2024-09-15 11:00:00'), 
        tp_alimentacao(7891234567900, 'Pudim', TIMESTAMP '2024-09-15 11:15:00'),
        tp_alimentacao(7891234567901, 'Fatia de bolo', TIMESTAMP '2024-09-15 11:30:00'),
        tp_alimentacao(7891234567902, 'Energético', TIMESTAMP '2024-09-15 11:45:00'),
        tp_alimentacao(7891234567903, 'Bolacha', TIMESTAMP '2024-09-15 12:00:00'),
        tp_alimentacao(7891234567904, 'Café', TIMESTAMP '2024-09-15 12:15:00'), 
        tp_alimentacao(7891234567905, 'Refrigerante', TIMESTAMP '2024-09-15 12:30:00'), 
        tp_alimentacao(7891234567906, 'Barrinhas de Cereais', TIMESTAMP '2024-09-15 12:45:00'),
        tp_alimentacao(7891234567907, 'Café', TIMESTAMP '2024-09-15 13:00:00'),  -- Repetindo Café
        tp_alimentacao(7891234567908, 'Pipoca', TIMESTAMP '2024-09-15 13:15:00')  
    ), 
    76543210000104  -- cnpj
);
INSERT INTO tb_empresa VALUES (
    105,  -- id_usuario
    'Empresa E',  -- nome
    tp_endereco('Avenida Presidente Vargas', 'Rio de Janeiro', 'Rio de Janeiro', '50', 55555555),  -- endereco
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(1177778888), 
        tp_tipo_telefone(2177778888)  -- exemplo de segundo telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7891234567904, 'Café', TIMESTAMP '2024-09-15 12:00:00'),
        tp_alimentacao(7891234567905, 'Refrigerante', TIMESTAMP '2024-09-15 12:30:00'), 
        tp_alimentacao(7891234567906, 'Barrinhas de Cereais', TIMESTAMP '2024-09-15 12:45:00'),
        tp_alimentacao(7891234567907, 'Café', TIMESTAMP '2024-09-15 13:00:00'),  -- Repetindo Café
        tp_alimentacao(7891234567908, 'Café', TIMESTAMP '2024-09-15 13:15:00'),
        tp_alimentacao(7891234567916, 'Café', TIMESTAMP '2024-09-15 11:45:00'),
        tp_alimentacao(7891234567917, 'Smoothies em Garrafinhas', TIMESTAMP '2024-09-15 12:00:00'),
        tp_alimentacao(7891234567918, 'Fatia de bolo', TIMESTAMP '2024-09-15 12:15:00')
    ), 
    65432100000105  -- cnpj
);
INSERT INTO tb_empresa VALUES (
    106,  -- id_usuario
    'Empresa F',  -- nome
    tp_endereco('Rua da Consolação', 'São Paulo', 'São Paulo', '60', 66666666),  -- endereco
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(1188889999), 
        tp_tipo_telefone(2188889999)  -- exemplo de segundo telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7891234567909, 'Chips de Batata Doce', TIMESTAMP '2024-09-15 10:00:00'),
        tp_alimentacao(7891234567910, 'Sanduíches', TIMESTAMP '2024-09-15 10:15:00'),
        tp_alimentacao(7891234567911, 'Pipoca', TIMESTAMP '2024-09-15 10:30:00'),
        tp_alimentacao(7891234567912, 'Barrinhas de Cereais', TIMESTAMP '2024-09-15 10:45:00'),
        tp_alimentacao(7891234567913, 'Biscoitos Integrais', TIMESTAMP '2024-09-15 11:00:00'),
        tp_alimentacao(7891234567914, 'Refrigerante', TIMESTAMP '2024-09-15 11:15:00'),
        tp_alimentacao(7891234567915, 'Pudim', TIMESTAMP '2024-09-15 11:30:00'),
        tp_alimentacao(7891234567916, 'Café', TIMESTAMP '2024-09-15 11:45:00'),
        tp_alimentacao(7891234567917, 'Smoothies em Garrafinhas', TIMESTAMP '2024-09-15 12:00:00'),
        tp_alimentacao(7891234567918, 'Fatia de bolo', TIMESTAMP '2024-09-15 12:15:00')
    ), 
    54321000000106  -- cnpj
);
INSERT INTO tb_empresa VALUES (
    107,  -- id_usuario
    'Empresa G',  -- nome
    tp_endereco('Avenida Atlântica', 'Rio de Janeiro', 'Rio de Janeiro', '70', 77777777),  -- endereco
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(1199990000), 
        tp_tipo_telefone(2199990000)  -- exemplo de segundo telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7891234567920, 'Café', TIMESTAMP '2024-09-15 09:15:00'),
        tp_alimentacao(7891234567921, 'Bolacha', TIMESTAMP '2024-09-15 09:30:00'),
        tp_alimentacao(7891234567922, 'Iogurte', TIMESTAMP '2024-09-15 09:45:00'),
        tp_alimentacao(7891234567923, 'Pudim', TIMESTAMP '2024-09-15 10:00:00'),
        tp_alimentacao(7891234567924, 'Energético', TIMESTAMP '2024-09-15 10:15:00'),
        tp_alimentacao(7891234567925, 'Sanduíches', TIMESTAMP '2024-09-15 10:30:00')
    ), 
    43210900000107  -- cnpj
);
INSERT INTO tb_empresa VALUES (
    108,  -- id_usuario
    'Empresa H',  -- nome
    tp_endereco('Avenida Central', 'Distrito Federal', 'Brasília', '80', 88888888),  -- endereco
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(1110001111), 
        tp_tipo_telefone(2110001111)  -- exemplo de segundo telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7891234567926, 'Café', TIMESTAMP '2024-09-15 08:00:00'),
        tp_alimentacao(7891234567927, 'Café', TIMESTAMP '2024-09-15 08:15:00'),
        tp_alimentacao(7891234567928, 'Chips de Batata Doce', TIMESTAMP '2024-09-15 08:30:00'),
        tp_alimentacao(7891234567929, 'Biscoitos Integrais', TIMESTAMP '2024-09-15 08:45:00'),
        tp_alimentacao(7891234567930, 'Café', TIMESTAMP '2024-09-15 09:00:00'),  -- Repetição
        tp_alimentacao(7891234567931, 'Smoothies em Garrafinhas', TIMESTAMP '2024-09-15 09:15:00'),
        tp_alimentacao(7891234567932, 'Barrinhas de Cereais', TIMESTAMP '2024-09-15 09:30:00'),
        tp_alimentacao(7891234567933, 'Sanduíches', TIMESTAMP '2024-09-15 09:45:00'),
        tp_alimentacao(7891234567934, 'Café', TIMESTAMP '2024-09-15 10:00:00'),
        tp_alimentacao(7891234567935, 'Refrigerante', TIMESTAMP '2024-09-15 10:15:00'),
        tp_alimentacao(7891234567936, 'Fatia de bolo', TIMESTAMP '2024-09-15 10:30:00'),
        tp_alimentacao(7891234567937, 'Salgadinho', TIMESTAMP '2024-09-15 10:45:00'),
        tp_alimentacao(7891234567938, 'Pudim', TIMESTAMP '2024-09-15 11:00:00'),
        tp_alimentacao(7891234567939, 'Café', TIMESTAMP '2024-09-15 11:15:00'),
        tp_alimentacao(7891234567941, 'Café', TIMESTAMP '2024-09-15 11:45:00')
    ), 
    32109800000108  -- cnpj
);
INSERT INTO tb_empresa VALUES (
    109,  -- id_usuario
    'Empresa I',  -- nome
    tp_endereco('Rua da Liberdade', 'São Paulo', 'São Paulo', '90', 99999999),  -- endereco
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(1122223333), 
        tp_tipo_telefone(2122223333)  -- exemplo de segundo telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7891234567942, 'Café', TIMESTAMP '2024-09-15 09:00:00'), 
        tp_alimentacao(7891234567943, 'Biscoitos Integrais', TIMESTAMP '2024-09-15 09:15:00'),
        tp_alimentacao(7891234567944, 'Refrigerante', TIMESTAMP '2024-09-15 09:30:00'),
        tp_alimentacao(7891234567945, 'Refrigerante', TIMESTAMP '2024-09-15 09:45:00'),
        tp_alimentacao(7891234567946, 'Refrigerante', TIMESTAMP '2024-09-15 10:00:00'),
        tp_alimentacao(7891234567947, 'Café', TIMESTAMP '2024-09-15 10:15:00'),  -- Repetição
        tp_alimentacao(7891234567948, 'Refrigerante', TIMESTAMP '2024-09-15 10:30:00'),
        tp_alimentacao(7891234567949, 'Barrinhas de Cereais', TIMESTAMP '2024-09-15 10:45:00'),
        tp_alimentacao(7891234567951, 'Fatia de bolo', TIMESTAMP '2024-09-15 11:15:00')
    ), 
    21098700000109  -- cnpj
);

INSERT INTO tb_empresa VALUES (
    110,  -- id_usuario
    'Empresa J',  -- nome
    tp_endereco('Rua do Mercado','Minas Gerais', 'Belo Horizonte', '100', 12121212),  -- endereco
    varray_tipo_telefone(  -- múltiplos telefones
        tp_tipo_telefone(1133334444), 
        tp_tipo_telefone(2133334444)  -- exemplo de segundo telefone
    ),
    tp_lista_alimentos(  -- lista_alimentos (Nested Table)
        tp_alimentacao(7891234567955, 'Café', TIMESTAMP '2024-09-15 07:00:00'), 
        tp_alimentacao(7891234567956, 'Café', TIMESTAMP '2024-09-15 07:15:00'),
        tp_alimentacao(7891234567957, 'Café', TIMESTAMP '2024-09-15 07:30:00'),  -- Repetição de Café
        tp_alimentacao(7891234567958, 'Salgadinho', TIMESTAMP '2024-09-15 08:00:00'),
        tp_alimentacao(7891234567959, 'Salgadinho', TIMESTAMP '2024-09-15 08:15:00'),  -- Repetição de Salgadinho
        tp_alimentacao(7891234567960, 'Bolacha', TIMESTAMP '2024-09-15 08:30:00'),
        tp_alimentacao(7891234567961, 'Barrinhas de Cereais', TIMESTAMP '2024-09-15 09:00:00'),
        tp_alimentacao(7891234567962, 'Iogurte', TIMESTAMP '2024-09-15 09:15:00'),
        tp_alimentacao(7891234567963, 'Smoothies em Garrafinhas', TIMESTAMP '2024-09-15 09:30:00'),
        tp_alimentacao(7891234567964, 'Pipoca', TIMESTAMP '2024-09-15 10:00:00'),
        tp_alimentacao(7891234567965, 'Café', TIMESTAMP '2024-09-15 10:30:00'),
        tp_alimentacao(7891234567966, 'Energético', TIMESTAMP '2024-09-15 11:00:00'),
        tp_alimentacao(7891234567967, 'Energético', TIMESTAMP '2024-09-15 11:15:00'),  -- Repetição de Energético
        tp_alimentacao(7891234567968, 'Fatia de bolo', TIMESTAMP '2024-09-15 11:30:00'),
        tp_alimentacao(7891234567969, 'Refrigerante', TIMESTAMP '2024-09-15 12:00:00'),
        tp_alimentacao(7891234567970, 'Refrigerante', TIMESTAMP '2024-09-15 12:15:00'),  -- Repetição de Refrigerante
        tp_alimentacao(7891234567971, 'Pudim', TIMESTAMP '2024-09-15 12:30:00'),
        tp_alimentacao(7891234567972, 'Pudim', TIMESTAMP '2024-09-15 12:45:00'),  -- Repetição de Pudim
        tp_alimentacao(7891234567973, 'Café', TIMESTAMP '2024-09-15 13:00:00'),  -- Repetição adicional de Café
        tp_alimentacao(7891234567974, 'Salgadinho', TIMESTAMP '2024-09-15 13:15:00')  -- Repetição adicional de Salgadinho
    ), 
    10987600000110  -- cnpj
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
INSERT INTO tb_evento VALUES (
    6, -- id_evento
    TIMESTAMP '2025-02-10 10:00:00', -- data_hora_evento
    3, -- duracao (em horas)
    100 -- qtd_pessoas
);
INSERT INTO tb_evento VALUES (
    7, -- id_evento
    TIMESTAMP '2025-03-20 17:30:00', -- data_hora_evento
    4, -- duracao (em horas)
    80 -- qtd_pessoas
);
INSERT INTO tb_evento VALUES (
    8, -- id_evento
    TIMESTAMP '2025-04-15 08:00:00', -- data_hora_evento
    5, -- duracao (em horas)
    120 -- qtd_pessoas
);
INSERT INTO tb_evento VALUES (
    9, -- id_evento
    TIMESTAMP '2025-05-22 19:00:00', -- data_hora_evento
    2, -- duracao (em horas)
    45 -- qtd_pessoas
);
INSERT INTO tb_evento VALUES (
    10, -- id_evento
    TIMESTAMP '2025-06-30 12:00:00', -- data_hora_evento
    6, -- duracao (em horas)
    200 -- qtd_pessoas
);


-- inserir organiza
INSERT INTO tb_organiza VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 101), 
    (SELECT REF(ev) FROM tb_evento ev WHERE ev.id_evento = 1) 
);
INSERT INTO tb_organiza VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 102), 
    (SELECT REF(ev) FROM tb_evento ev WHERE ev.id_evento = 2) 
);
INSERT INTO tb_organiza VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 103), 
    (SELECT REF(ev) FROM tb_evento ev WHERE ev.id_evento = 3) 
);
INSERT INTO tb_organiza VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 104), 
    (SELECT REF(ev) FROM tb_evento ev WHERE ev.id_evento = 4) 
);
INSERT INTO tb_organiza VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105), 
    (SELECT REF(ev) FROM tb_evento ev WHERE ev.id_evento = 5) 
);
INSERT INTO tb_organiza VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 106), 
    (SELECT REF(ev) FROM tb_evento ev WHERE ev.id_evento = 6) 
);
INSERT INTO tb_organiza VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 107), 
    (SELECT REF(ev) FROM tb_evento ev WHERE ev.id_evento = 7) 
);
INSERT INTO tb_organiza VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 108), 
    (SELECT REF(ev) FROM tb_evento ev WHERE ev.id_evento = 8) 
);
INSERT INTO tb_organiza VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 109), 
    (SELECT REF(ev) FROM tb_evento ev WHERE ev.id_evento = 9) 
);

INSERT INTO tb_organiza VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 110), 
    (SELECT REF(ev) FROM tb_evento ev WHERE ev.id_evento = 10) 
);

-- inserir sessao
INSERT INTO tb_sessao VALUES (
    1,  -- id_sessao
    TIMESTAMP '2024-09-22 18:00:00',  -- data_e_hora
    tp_lista_convidados(  -- lista_convidados
        tp_convidado(1, 'Carlos Silva'), 
        tp_convidado(2, 'Maria Oliveira')
    )
);
INSERT INTO tb_sessao VALUES (
    2,  -- id_sessao
    TIMESTAMP '2024-09-23 20:00:00',  -- data_e_hora
    tp_lista_convidados(
        tp_convidado(3, 'Ana Costa'), 
        tp_convidado(4, 'Fernanda Souza')
    )
);
INSERT INTO tb_sessao VALUES (
    3,  -- id_sessao
    TIMESTAMP '2024-09-24 15:30:00',  -- data_e_hora
    tp_lista_convidados(
        tp_convidado(5, 'João Pereira'), 
        tp_convidado(6, 'Mariana Lima')
    )
);
INSERT INTO tb_sessao VALUES (
    4,  -- id_sessao
    TIMESTAMP '2024-09-25 19:00:00',  -- data_e_hora
    tp_lista_convidados(
        tp_convidado(7, 'Lucas Almeida'), 
        tp_convidado(8, 'Juliana Mendes')
    )
);
INSERT INTO tb_sessao VALUES (
    5,  -- id_sessao
    TIMESTAMP '2024-09-26 21:30:00',  -- data_e_hora
    tp_lista_convidados(
        tp_convidado(9, 'Ricardo Santos'), 
        tp_convidado(10, 'Patrícia Gomes')
    )
);

-- Inserindo espaços de trabalho
INSERT INTO tb_espaco_trabalho VALUES (1, 'Sala de Reunião', 10);
INSERT INTO tb_espaco_trabalho VALUES (2, 'Escritório Compartilhado', 20);
INSERT INTO tb_espaco_trabalho VALUES (3, 'Auditório', 150);
INSERT INTO tb_espaco_trabalho VALUES (4, 'Sala de Conferência', 30);
INSERT INTO tb_espaco_trabalho VALUES (5, 'Coworking', 15);
INSERT INTO tb_espaco_trabalho VALUES (6, 'Sala de Treinamento', 25);
INSERT INTO tb_espaco_trabalho VALUES (7, 'Estúdio de Gravação', 5);
INSERT INTO tb_espaco_trabalho VALUES (8, 'Sala de Brainstorming', 12);
INSERT INTO tb_espaco_trabalho VALUES (9, 'Laboratório', 10);
INSERT INTO tb_espaco_trabalho VALUES (10, 'Espaço ao Ar Livre', 30);




-- Inserindo reserva de pessoa 
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 1),  -- Referência à pessoa com ID 1
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 1),  -- Referência ao espaço de trabalho com ID 1
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 1),  -- Referência à sessão com ID 1
    5                                                          -- Quantidade de pessoas reservadas
);

INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 2),  -- Referência à pessoa com ID 2
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 2),  -- Referência ao espaço de trabalho com ID 2
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 2),  -- Referência à sessão com ID 2
    3                                                          -- Quantidade de pessoas reservadas
);

INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 3),  -- Referência à pessoa com ID 3
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 3),  -- Referência à sessão com ID 3
    10                                                         -- Quantidade de pessoas reservadas
);

INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 4),  -- Referência à pessoa com ID 4
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 4),  -- Referência ao espaço de trabalho com ID 4
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 4),  -- Referência à sessão com ID 4
    15                                                         -- Quantidade de pessoas reservadas
);

INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 5),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 6),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 7),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 8),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 9),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 10),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 11),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 3),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 12),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 3),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 13),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 3),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    120                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 14),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 3),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    130                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 6),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 6),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 6),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);
INSERT INTO tb_reserva_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 6),  -- Referência à pessoa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    30                                                         -- Quantidade de pessoas reservadas
);




-- insert reserva empresa
INSERT INTO tb_reserva_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 101),  -- Referência à empresa com ID 1
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 1),  -- Referência ao espaço de trabalho com ID 1
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 1),  -- Referência à sessão com ID 1
    20                                                        -- Quantidade de pessoas
);
INSERT INTO tb_reserva_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 102),  -- Referência à empresa com ID 2
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 2),  -- Referência ao espaço de trabalho com ID 2
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 2),  -- Referência à sessão com ID 2
    120                                                       -- Quantidade de pessoas
);
INSERT INTO tb_reserva_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 103),  -- Referência à empresa com ID 3
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 3),  -- Referência ao espaço de trabalho com ID 3
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 3),  -- Referência à sessão com ID 3
    25                                                        -- Quantidade de pessoas
);
INSERT INTO tb_reserva_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 104),  -- Referência à empresa com ID 4
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 4),  -- Referência ao espaço de trabalho com ID 4
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 4),  -- Referência à sessão com ID 4
    10                                                        -- Quantidade de pessoas
);
INSERT INTO tb_reserva_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105),  -- Referência à empresa com ID 5
    (SELECT REF(tp) FROM tb_espaco_trabalho tp WHERE tp.id_espaco = 5),  -- Referência ao espaço de trabalho com ID 5
    (SELECT REF(s) FROM tb_sessao s WHERE s.id_sessao = 5),  -- Referência à sessão com ID 5
    5                                                         -- Quantidade de pessoas
);



-- inserir plano de assinatura
INSERT INTO tb_plano_de_assinatura VALUES (
    1,                                  -- ID do plano
    'Básico',                           -- Nível do plano
    24,                                 -- Tempo de duração (meses)
    50.00,                             -- Preço do plano
    NULL                                -- Sem plano evoluído (primeiro nível)
);
INSERT INTO tb_plano_de_assinatura VALUES (
    2,                                  -- ID do plano
    'Intermediário',                    -- Nível do plano
    12,                                 -- Tempo de duração (meses)
    100.00,                             -- Preço do plano
    (SELECT REF(p) FROM tb_plano_de_assinatura p WHERE p.nivel = 'Básico')  -- Referência ao plano "Básico"
);
INSERT INTO tb_plano_de_assinatura VALUES (
    3,                                  -- ID do plano
    'Avançado',                         -- Nível do plano
    6,                                 -- Tempo de duração (meses)
    200.00,                             -- Preço do plano
    (SELECT REF(p) FROM tb_plano_de_assinatura p WHERE p.nivel = 'Intermediário')  -- Referência ao plano "Intermediário"
);
INSERT INTO tb_plano_de_assinatura VALUES (
    4,                                  -- ID do plano
    'Básico 2',                           -- Nível do plano
    12,                                 -- Tempo de duração (meses)
    100.00,                             -- Preço do plano
    NULL                                -- Sem plano evoluído (primeiro nível)
);
INSERT INTO tb_plano_de_assinatura VALUES (
    5,                                  -- ID do plano
    'Intermediário 2',                    -- Nível do plano
    6,                                 -- Tempo de duração (meses)
    200.00,                             -- Preço do plano
    (SELECT REF(p) FROM tb_plano_de_assinatura p WHERE p.nivel = 'Básico 2')  -- Referência ao plano "Básico"
);
INSERT INTO tb_plano_de_assinatura VALUES (
    6,                                  -- ID do plano
    'Avançado 2',                         -- Nível do plano
    3,                                 -- Tempo de duração (meses)
    300.00,                             -- Preço do plano
    (SELECT REF(p) FROM tb_plano_de_assinatura p WHERE p.nivel = 'Intermediário 2')  -- Referência ao plano "Intermediário"
);
INSERT INTO tb_plano_de_assinatura VALUES (
    7,                                  -- ID do plano
    'Básico 3',                           -- Nível do plano
    6,                                 -- Tempo de duração (meses)
    200.00,                             -- Preço do plano
    NULL                                -- Sem plano evoluído (primeiro nível)
);
INSERT INTO tb_plano_de_assinatura VALUES (
    8,                                  -- ID do plano
    'Intermediário 3',                    -- Nível do plano
    3,                                 -- Tempo de duração (meses)
    300.00,                             -- Preço do plano
    (SELECT REF(p) FROM tb_plano_de_assinatura p WHERE p.nivel = 'Básico 3')  -- Referência ao plano "Básico"
);
INSERT INTO tb_plano_de_assinatura VALUES (
    9,                                  -- ID do plano
    'Avançado 3',                         -- Nível do plano
    1,                                 -- Tempo de duração (meses)
    300.00,                             -- Preço do plano
    (SELECT REF(p) FROM tb_plano_de_assinatura p WHERE p.nivel = 'Intermediário 3')  -- Referência ao plano "Intermediário"
);




-- Inserção de pagamento 
INSERT INTO tb_pagamento VALUES (
    1,  -- ID do pagamento
    SYSTIMESTAMP,  -- Data e hora do pagamento
    tp_cartao_de_credito( 
        'João Silva',                 -- Nome do portador
        '12345678900',                -- CPF do portador
        '4111111111111111',           -- Número do cartão
        DATE '2025-12-25',            -- Data de vencimento
        '123'                         -- Código de segurança
    )
);
INSERT INTO tb_pagamento VALUES (
    2,  -- ID do pagamento
    SYSTIMESTAMP,  -- Data e hora do pagamento
    tp_cartao_de_credito( 
        'Maria Oliveira',             -- Nome do portador
        '98765432100',                -- CPF do portador
        '5111111111111111',           -- Número do cartão
        DATE '2026-01-10',            -- Data de vencimento
        '456'                         -- Código de segurança
    )
);
INSERT INTO tb_pagamento VALUES (
    3,  -- ID do pagamento
    SYSTIMESTAMP,  -- Data e hora do pagamento
    tp_cartao_de_credito( 
        'Carlos Pereira',             -- Nome do portador
        '11223344556',                -- CPF do portador
        '6111111111111111',           -- Número do cartão
        DATE '2025-11-15',            -- Data de vencimento
        '789'                         -- Código de segurança
    )
);
INSERT INTO tb_pagamento VALUES (
    4,  -- ID do pagamento
    SYSTIMESTAMP,  -- Data e hora do pagamento
    tp_cartao_de_credito( 
        'Ana Costa',                  -- Nome do portador
        '22334455667',                -- CPF do portador
        '7111111111111111',           -- Número do cartão
        DATE '2026-02-28',            -- Data de vencimento
        '234'                         -- Código de segurança
    )
);
INSERT INTO tb_pagamento VALUES (
    5,  -- ID do pagamento
    SYSTIMESTAMP,  -- Data e hora do pagamento
    tp_cartao_de_credito( 
        'Fernanda Souza',             -- Nome do portador
        '33445566778',                -- CPF do portador
        '8111111111111111',           -- Número do cartão
        DATE '2027-03-30',            -- Data de vencimento
        '567'                         -- Código de segurança
    )
);
INSERT INTO tb_pagamento VALUES (
    6,  -- ID do pagamento
    SYSTIMESTAMP,  -- Data e hora do pagamento
    tp_cartao_de_credito( 
        'Maria Oliveira',            -- Nome do portador
        '98765432100',              -- CPF do portador
        '5111111111111111',         -- Número do cartão
        DATE '2025-11-30',          -- Data de vencimento
        '456'                       -- Código de segurança
    )
);
INSERT INTO tb_pagamento VALUES (
    7,  -- ID do pagamento
    SYSTIMESTAMP,  -- Data e hora do pagamento
    tp_cartao_de_credito( 
        'Carlos Pereira',            -- Nome do portador
        '11223344556',              -- CPF do portador
        '6111111111111111',         -- Número do cartão
        DATE '2025-10-15',          -- Data de vencimento
        '789'                       -- Código de segurança
    )
);
INSERT INTO tb_pagamento VALUES (
    8,  -- ID do pagamento
    SYSTIMESTAMP,  -- Data e hora do pagamento
    tp_cartao_de_credito( 
        'Ana Costa',                 -- Nome do portador
        '22334455667',              -- CPF do portador
        '7111111111111111',         -- Número do cartão
        DATE '2025-09-20',          -- Data de vencimento
        '321'                       -- Código de segurança
    )
);
INSERT INTO tb_pagamento VALUES (
    9,  -- ID do pagamento
    SYSTIMESTAMP,  -- Data e hora do pagamento
    tp_cartao_de_credito( 
        'Fernanda Souza',            -- Nome do portador
        '33445566778',              -- CPF do portador
        '8111111111111111',         -- Número do cartão
        DATE '2025-08-05',          -- Data de vencimento
        '654'                       -- Código de segurança
    )
);
INSERT INTO tb_pagamento VALUES (
    10,  -- ID do pagamento
    SYSTIMESTAMP,  -- Data e hora do pagamento
    tp_cartao_de_credito( 
        'Lucas Silva',               -- Nome do portador
        '44556677889',              -- CPF do portador
        '9111111111111111',         -- Número do cartão
        DATE '2025-07-30',          -- Data de vencimento
        '987'                       -- Código de segurança
    )
);












-- inserindo compra pessoa
INSERT INTO tb_compra_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 1),   -- Referência para a pessoa com ID 1
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 1),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 1),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 2),   -- Referência para a pessoa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 1),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 2),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 3),   -- Referência para a pessoa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 2),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 3),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 4),   -- Referência para a pessoa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 3),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 5),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_pessoa VALUES (
    (SELECT REF(p) FROM tb_pessoa p WHERE p.id_usuario = 5),   -- Referência para a pessoa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 3),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 4),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);








-- Inserção para compra de empresa 1
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 101),  -- Referência para a empresa com ID 1
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 1),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 6),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);

-- Inserção para compra de empresa 2
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 102),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 2),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 7),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 103),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 3),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 8),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 104),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 1),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 9),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 2),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 10),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 103),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 3),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 8),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 104),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 1),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 9),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 2),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 10),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 103),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 3),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 8),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 104),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 1),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 9),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 2),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 10),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 2),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 10),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 2),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 10),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 2),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 10),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 2),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 10),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);
INSERT INTO tb_compra_empresa VALUES (
    (SELECT REF(e) FROM tb_empresa e WHERE e.id_usuario = 105),  -- Referência para a empresa com ID 2
    (SELECT REF(pa) FROM tb_plano_de_assinatura pa WHERE pa.id_plano = 2),  -- Referência para o plano de assinatura
    (SELECT REF(pg) FROM tb_pagamento pg WHERE pg.id_pagamento = 10),  -- Referência para o pagamento
    SYSTIMESTAMP  -- Data e hora da compra
);

