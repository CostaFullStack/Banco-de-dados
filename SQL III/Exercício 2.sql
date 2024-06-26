-- Questão 02) Suponha que você tenha uma tabela "vendedores" e uma tabela "vendas". Escreva uma consulta SQL que retorne o nome do vendedor e o valor da venda para todas as vendas e todos os vendedores, incluindo os vendedores que não fizeram nenhuma venda e as vendas não associadas a nenhum vendedor.

-- Utilizando "DATABASE" com nome "black_friday". 
CREATE DATABASE black_friday;

-- Utilizando "USE" para utilizar o "DATABASE" "black_friday".
USE black_friday;

-- Criando a tabela com nome "clientes".
CREATE TABLE vendedores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL
);

-- Criando a tabela com nome "vendas".
CREATE TABLE vendas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT,
    preco FLOAT,
    dia_venda DATETIME,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar a outra tabela.
    FOREIGN KEY (id_vendedor) REFERENCES vendedores (id)
);

-- Adicionando 7 clientes a tabela "vendedores".
INSERT INTO vendedores
(nome, cpf)
	VALUES
		('Carlos Ferreira', '12345678901'),
		('Mariana Costa', '98765432102'),
		('Rafael Almeida', '45678912303'),
		('Fernanda Souza', '32165498704'),
		('Bruno Oliveira', '78912345605'),
		('Paulo Mendes', '12312312312'),  -- Vendedor sem venda associada
		('Julia Martins', '45645645645');  -- Vendedor sem venda associada

-- Realizando 9 vendas a tabela "vendas".
INSERT INTO vendas
(id_vendedor, preco, dia_venda)
	VALUES
		(1, 150.00, '2024-06-20 09:00:00'), -- Venda associada ao vendedor Carlos Ferreira
		(2, 250.50, '2024-06-20 10:30:00'), -- Venda associada à vendedor Mariana Costa
		(3, 175.75, '2024-06-19 11:00:00'), -- Venda associada ao vendedor Rafael Almeida
		(4, 300.20, '2024-06-19 12:45:00'), -- Venda associada à vendedor Fernanda Souza
		(5, 225.10, '2024-06-18 14:00:00'), -- Venda associada ao vendedor Bruno Oliveira
		(1, 190.80, '2024-06-18 15:30:00'), -- Venda associada ao vendedor Carlos Ferreira
		(2, 350.00, '2024-06-18 16:45:00'), -- Venda associada à vendedor Mariana Costa
		(NULL, 500.00, '2024-06-20 17:00:00'), -- Venda sem associação a vendedor
		(NULL, 400.00, '2024-06-19 18:00:00'); -- Venda sem associação a vendedor
        
-- Retornando o nome dos vendedores, o preço dos produtos e a data da venda.
SELECT 
	vendedores.nome AS nome_vendedor, 
    vendas.preco AS preco_produto,
    vendas.dia_venda AS data_venda
FROM vendedores
-- Utilizando "LEFT JOIN" para retornar todos os registros da tabela "vendedores" à esquerda e os registros da tabela "vendas" à direita. Caso não haja correspondência, os resultados das vendas serão "NULL".

LEFT JOIN vendas
ON vendedores.id = vendas.id_vendedor;

-- Retornando o nome dos vendedores, o preço dos produtos e a data da venda.
SELECT
	vendedores.nome AS nome_vendedor,
    vendas.preco AS preco_produto,
    vendas.dia_venda AS data_venda
FROM vendas
-- Utilizando "RIGHT JOIN" para retornar todos os registros da tabela "vendas" à esquerda e os registros da tabela "vendedores" à direita. Caso não haja correspondência, os resultados dos vendedores serão "NULL".
RIGHT JOIN vendedores
ON vendedores.id = vendas.id_vendedor