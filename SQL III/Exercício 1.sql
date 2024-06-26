-- Questão 01) Suponha que você tenha uma tabela "clientes" e uma tabela "pedidos". Escreva uma consulta SQL que retorne o nome do cliente e o número do pedido para todos os clientes, incluindo aqueles que não fizeram nenhum pedido.
-- Utilizando as mesmas tabelas de "clientes" e "pedidos", escreva uma consulta SQL que retorne o nome do cliente e o número do pedido para todos os pedidos, incluindo os pedidos que não estão associados a nenhum cliente.

-- Utilizando "DATABASE" com nome "loja". 
CREATE DATABASE loja;

-- Utilizando "USE" para utilizar o "DATABASE" "loja".
USE loja;

-- Criando a tabela com nome "clientes".
CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    email VARCHAR (100) UNIQUE NOT NULL
);

-- Criando a tabela com nome "pedidos".
CREATE TABLE pedidos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATETIME NOT NULL,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar a outra tabela.
    FOREIGN KEY (id_cliente) REFERENCES clientes (id) 
);

-- Adicionando 5 clientes a tabela "clientes"
INSERT INTO clientes
(nome, email)
	VALUES 
		('João da Silva', 'joao.silva@email.com'),
		('Ana Santos', 'ana.santos@email.com'),
		('Pedro Oliveira', 'pedro.oliveira@email.com'),
		('Carla Lima', 'carla.lima@email.com'), -- Cliente sem pedido associado
		('Lucas Pereira', 'lucas.pereira@email.com'); -- Cliente sem pedido associado

-- Realizando 5 pedidos a tabela "pedidos"        
INSERT INTO pedidos
(id, id_cliente, data_pedido)
	VALUES
		(1, NULL, '2024-06-20 10:30:00'), -- Pedido sem associação a cliente
		(2, 1, '2024-06-20 11:00:00'), -- Pedido associado ao cliente João da Silva
		(3, NULL, '2024-06-19 14:45:00'), -- Pedido sem associação a cliente
		(4, 2, '2024-06-18 09:15:00'), -- Pedido associado à cliente Ana Santos
		(5, 3, '2024-06-18 16:30:00'); -- Pedido associado ao cliente Pedro Oliveira

-- Retornando o nome dos clientes, o número dos pedidos, o email dos clientes e a data dos pedidos. 
SELECT
clientes.nome AS nome_cliente,
pedidos.id AS numero_do_pedido,
clientes.email AS email_cliente,
pedidos.data_pedido
FROM clientes
-- Utilizando "LEFT JOIN" para retornar todos os registros da tabela "clientes" à esquerda e os registros da tabela "pedidos" à direita. Caso não haja correspondência, os resultados dos pedidos serão "NULL".

LEFT JOIN pedidos
ON clientes.id = pedidos.id_cliente;

-- Retornando o nome dos clientes, o número dos pedidos e a data dos pedidos. 
SELECT 
clientes.nome AS nome_cliente,
pedidos.id AS numero_do_pedido,
pedidos.data_pedido
FROM pedidos
-- Utilizando "RIGHT JOIN" para retornar todos os registros da tabela "pedidos" à esquerda e os registros da tabela "clientes" à direita. Caso não haja correspondência, os resultados dos pedidos serão "NULL".
RIGHT JOIN clientes 
ON pedidos.id_cliente = clientes.id;
