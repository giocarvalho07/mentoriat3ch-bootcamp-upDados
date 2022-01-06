CREATE TABLE categoria (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR
(50) NOT null
);

INSERT INTO categoria
    (nome)
VALUES
    ('Televisores');

INSERT INTO categoria
    (nome)
VALUES
    ('smartphones');

INSERT INTO categoria
    (nome)
VALUES
    ('supermercado');

INSERT INTO categoria
    (nome)
VALUES
    ('refrigeradores');




UPDATE categoria
set nome = 'SUPERMERCADOS'
WHERE id = 4;



SELECT *
FROM categoria;

SELECT *
FROM categoria
WHERE nome = 'televisores';





CREATE TABLE produto (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR
(50) NOT NULL,
	descricao VARCHAR
(150),
	preco DOUBLE
(6,2) NOT NULL,
	id_categoria INT,
	FOREIGN KEY
(id_categoria) REFERENCES categoria
(id) 
);


INSERT INTO produto
    (nome, descricao, preco, id_categoria)
VALUES
    ('Sansung Galaxy J5 pro',
        'Smartphone lançado em 2018 pela Sansung, intermediário', 799.99, 2);

INSERT INTO produto
    (nome, descricao, preco, id_categoria)
VALUES
    ('Brastemp frost free',
        'Refrigerador Brastemp 2 portas', 1259.59, 4);


INSERT INTO produto
    (nome, descricao, preco, id_categoria)
VALUES
    ('Picanha suína',
        'Picanha suína 900 gramas Friboi', 89.14, 3);

INSERT INTO produto
    (nome, descricao, preco, id_categoria)
VALUES
    ('Vodka Smirnnof',
        'Vodka Smirnnof 1L ', 47.99, 3);

INSERT INTO produto
    (nome, descricao, preco, id_categoria)
VALUES
    ('SmartTv 4k 24 polegadas',
        'SmartTv 4k 24 polegadas Sansung amoled', 1159.59, 1);


SELECT *
FROM produto;

SELECT *
FROM produto
WHERE preco <= 100
    AND id_categoria = 3;





CREATE TABLE forma_pagamento(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR
(50) NOT NULL
);


INSERT INTO forma_pagamento
    (nome)
VALUES
    ('boleto');

INSERT INTO forma_pagamento
    (nome)
VALUES
    ('cartão de crédito');

INSERT INTO forma_pagamento
    (nome)
VALUES
    ('pix');

INSERT INTO forma_pagamento
    (nome)
VALUES
    ('cartão de débito');



SELECT *
FROM forma_pagamento;



CREATE TABLE pedido(
	id INT PRIMARY KEY AUTO_INCREMENT,
	data_pedido DATETIME NOT NULL,
	status_pedido VARCHAR
(20) NOT NULL,
	data_entrega DATETIME NOT NULL,
	id_forma_pagamento INT,
	FOREIGN KEY
(id_forma_pagamento) REFERENCES id_forma_pagamento
(id)
);

INSERT INTO pedido
    (data_pedido, status_pedido, data_entrega, id_forma_pagamento)
VALUES
    ('2020-11-13 00:10:00', 'analise', '2020-11-19 00:10:00', 3);

INSERT INTO pedido
    (data_pedido, status_pedido, data_entrega, id_forma_pagamento)
VALUES
    ('2020-11-14 00:50:25', 'analise', '2020-11-20 08:30:00', 1);

INSERT INTO pedido
    (data_pedido, status_pedido, data_entrega, id_forma_pagamento)
VALUES
    ('2020-11-20 17:40:20', 'pagamento efetuado', '2020-11-25 20:10:00', 2);



SELECT *
FROM pedido;


SELECT *
FROM pedido
WHERE data_pedido >= '2020-12-01 00:00:00';

SELECT *
FROM pedido
WHERE status_pedido = 'analise';

CREATE TABLE itemPedido(
	id INT PRIMARY KEY AUTO_INCREMENT,
	quantidade INT NOT NULL,
	id_pedido INT, 
	id_produto INT,
	FOREIGN KEY
(id_pedido) REFERENCES pedido
(id),
	FOREIGN KEY
(id_produto) REFERENCES produto
(id)
);

INSERT INTO item_pedido
    (quantidade, id_pedido, id_produto)
VALUES
    (5, 1, 2);

INSERT INTO itemPedido
    (quantidade, id_pedido, id_produto)
VALUES
    (1, 3, 1);

INSERT INTO itemPedido
    (quantidade, id_pedido, id_produto)
VALUES
    (2, 4, 3);



SELECT *
FROM itemPedido;

SELECT *
FROM itempedido
WHERE quantidade >= 1
    AND id_produto = 2;