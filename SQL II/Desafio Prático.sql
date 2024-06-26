-- Desafio prático) Você está criando um banco de dados para gerenciar vendas de produtos em uma loja online. Você precisa projetar o esquema do banco de dados e escrever consultas SQL para atender a várias necessidades da loja. 
-- Aqui estão os requisitos:
-- Crie um banco de dados chamado "loja_online" e as seguintes tabelas:
-- Produtos: Armazena informações sobre produtos, incluindo um ID, nome, preço e quantidade em estoque.
-- Clientes: Armazena informações sobre os clientes, incluindo um ID, nome, endereço de e-mail e histórico de compras.
-- Pedidos: Registra informações sobre os pedidos feitos pelos clientes, incluindo um ID, data do pedido, ID do cliente e status do pedido.
-- Itens do pedido: Registra os produtos incluídos em cada pedido, incluindo um ID, ID do pedido, ID do produto e quantidade. 
-- Imagine que você está trabalhando no desenvolvimento de um sistema de gerenciamento de vendas para uma loja. Você já possui algumas tabelas básicas criadas no banco de dados. Agora, você precisa criar consultas SQL para realizar algumas operações específicas. Considere as seguintes tabelas:
-- Tabela "Clientes": 
-- Colunas: id_cliente (chave primária), nome_cliente, email_cliente.
-- Tabela "Produtos":
-- Colunas: id_produto (chave primária), nome_produto, preco_produto.
-- Tabela "Vendas":
-- Colunas: id_venda (chave primária), id_cliente (chave estrangeira referenciando a tabela "Clientes"), data_venda.
-- a) Crie uma consulta SQL para selecionar todos os clientes cadastrados.
-- b) Escreva um código SQL para inserir um novo produto chamado "Notebook" com o preço de R$2.500,00 na tabela "Produtos".
-- c) Atualize o nome do cliente com o id_cliente igual a 1 para "Maria Silva".
-- d) Remova todos os registros da tabela "Vendas" que ocorreram antes de 01 de janeiro de 2023.

-- Criando o "DATABASE" com o nome "loja_online".
CREATE DATABASE loja_online;

-- Criando o "USE" para utilizar o "DATABASE" "loja_online".
USE loja_online;

-- Criando a tabela com nome "clientes".
CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR (100) NOT NULL,
    email_cliente VARCHAR (60),
    historico_compras TEXT NOT NULL
);

-- Criando a tabela com nome "produtos".
CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR (100) NOT NULL,
    preco_produto FLOAT NOT NULL,
    qtd_estoque INT NOT NULL
);

-- Criando a tabela com nome "pedidos".
CREATE TABLE pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME NOT NULL,
    id_cliente INT,
    status_pedido BOOL NOT NULL,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Criando a tabela com nome "itens_pedido".
CREATE TABLE itens_pedido(
	id_itens INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
	FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Criando a tabela com nome "vendas".
CREATE TABLE vendas(
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_venda DATETIME NOT NULL,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- Adicionando 5 clientes a tabela "clientes"
INSERT INTO clientes
(nome_cliente, email_cliente, historico_compras)
	VALUES
		('João Silva', 'joao.silva@email.com', 'Fez compras de eletrônicos nos últimos 6 meses.'),
		('Maria Souza', 'maria.souza@email.com', 'Cliente fiel, compra regularmente roupas e acessórios.'),
		('Pedro Oliveira', 'pedro.oliveira@email.com', 'Fez sua primeira compra esta semana.'),
		('Ana Santos', 'ana.santos@email.com', 'Histórico de compras diversificado: eletrônicos, livros e brinquedos.'),
		('Carlos Lima', 'carlos.lima@email.com', 'Compras frequentes de alimentos e bebidas.');

-- Adicionando 5 produtos a tabela "produtos".
INSERT INTO produtos
(nome_produto, preco_produto, qtd_estoque)
	VALUES
		('Camiseta básica', 29.99, 100),
		('Celular', 2599.99, 15),
		('Sapato social', 149.99, 50),
		('Fones de ouvido sem fio', 199.99, 30),
		('Cadeira de escritório', 499.99, 10);
        
-- Adicionando a data de venda de determinado cliente através do seu "id".
INSERT INTO vendas
(id_cliente, data_venda)
	VALUES
	    (1, '2024-06-15 10:30:00'), -- Venda associada ao cliente João Silva
        (4, '2022-06-15 11:45:00'), -- Venda associada à cliente Ana Santos
        (5, '2024-06-16 14:00:00'), -- Venda associada ao cliente Carlos Lima
        (2, '2021-06-17 09:15:00'), -- Venda associada à cliente Maria Souza
        (3, '2024-06-18 16:30:00'); -- Venda associada ao cliente Pedro Oliveira

-- Modificando o nome do cliente de "id" 1.
UPDATE clientes SET nome_cliente = 'Maria Silva' WHERE id_cliente = 1;

-- Adicionando um novo produto a tabela "produtos".
INSERT INTO produtos
(nome_produto, preco_produto, qtd_estoque)
	VALUES
		('Notebook', 2.500, 20);

-- Desativando o modo seguro para ser feita remoção exigida da data de venda.
SET SQL_SAFE_UPDATES = 0;

-- Deletando os registros de venda da tabela "vendas" < (menor) que a data "2023-01-01".
DELETE FROM vendas WHERE data_venda < '2023-01-01';

-- Reativando o modo seguro após a remoção.
SET SQL_SAFE_UPDATES = 1;

-- Selecionando todos os clientes cadastrados.
SELECT * FROM clientes;