-- Questão 5) Crie um banco de dados chamado "concessionaria" e implemente as seguintes tabelas:
-- Tabela "clientes" com as seguintes colunas:
-- id, nome, cpf, endereço, data de nascimento.
-- Tabela "carros" com as seguintes colunas:
-- id, marca, modelo, ano lançamento, preço, ar-condicionado.
-- Tabela "compras" com as seguintes colunas:
-- id, id do cliente, id do carro, data de compra. 
-- Faça a iserção de 10 clientes, 15 carros e realize 6 vendas no bando da "concessionaria". Atualize o nome e cpf do 6º cliente, atualize o ano de lançamento dos carros 12, 8, 4 e delete os carros 14 e 15 e os clientes 2 e 4.
-- Selecione todos os clientes, todos os carros e todas as vendas.

-- Criando a "DATABASE" com nome "concessionaria".
CREATE DATABASE concessionaria;

-- Criando o "USE" para utilizar o "DATABASE" "concessionaria". 
USE concessionaria;

-- Criando a tabela com nome "clientes".
CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    endereco VARCHAR(30),
    data_nasc DATE
);

-- Criando a tabelas com nome "carros".
CREATE TABLE carros(
	id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_lanc YEAR NOT NULL,
    preco FLOAT NOT NULL,
    ar_condic BOOL NOT NULL
);

-- Criando a tabela com nome "compras".
CREATE TABLE compras(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_carro INT,
    data_compra DATE,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    FOREIGN KEY (id_carro) REFERENCES carros (id)
);

-- Adicionando 10 clientes a tabela "clientes".
INSERT INTO clientes
(nome, cpf, endereco, data_nasc)
	VALUES
		('João Silva', '12345678900', 'Rua A, 123', '1985-01-15'),
		('Maria Souza', '23456789011', 'Avenida B, 456', '1990-02-20'),
		('Carlos Lima', '34567890122', 'Travessa C, 789', '1982-03-25'),
		('Ana Pereira', '45678901233', 'Alameda D, 101', '1995-04-30'),
		('Pedro Oliveira', '56789012344', 'Beco E, 202', '1988-05-05'),
		('Fernanda Santos', '67890123455', 'Rua F, 303', '1992-06-10'),
		('Bruno Costa', '78901234566', 'Avenida G, 404', '1980-07-15'),
		('Carla Martins', '89012345677', 'Travessa H, 505', '1994-08-20'),
		('Rafael Almeida', '90123456788', 'Alameda I, 606', '1987-09-25'),
		('Juliana Fernandes', '01234567899', 'Beco J, 707', '1991-10-30');

-- Adicionando 15 carros a tabela "carros".
INSERT INTO carros
(marca, modelo, ano_lanc, preco, ar_condic)
	VALUES
		('Toyota', 'Corolla', 2020, 80000, TRUE), 
		('Honda', 'Civic', 2019, 85000, TRUE),
		('Ford', 'Focus', 2018, 75000, FALSE),
		('Chevrolet', 'Cruze', 2021, 90000, TRUE),
		('Volkswagen', 'Jetta', 2020, 87000, TRUE),
		('Hyundai', 'Elantra', 2019, 83000, FALSE),
		('Nissan', 'Sentra', 2018, 78000, TRUE),
		('Kia', 'Cerato', 2021, 91000, TRUE),
		('Peugeot', '308', 2020, 86000, FALSE),
		('Renault', 'Megane', 2019, 82000, TRUE),
		('Fiat', 'Argo', 2021, 75000, TRUE),
		('Jeep', 'Compass', 2020, 95000, TRUE),
		('Mazda', '3', 2019, 88000, FALSE),
		('Subaru', 'Impreza', 2018, 79000, TRUE),
		('Mitsubishi', 'Lancer', 2021, 92000, TRUE);

-- Realizando 6 vendas na tabela "compras".
INSERT INTO compras
(id_cliente, id_carro, data_compra)
	VALUES
		(3, 2, '2024-06-08'), -- Compra associada ao cliente Carlos Lima (Honda Civic)
		(1, 5, '2024-06-10'), -- Compra associada ao cliente João Silva (Volkswagen Jetta)
		(4, 1, '2024-06-11'), -- Compra associada à cliente Ana Pereira (Toyota Corolla)
		(2, 3, '2024-06-12'), -- Compra associada à cliente Maria Souza (Ford Focus)
		(5, 4, '2024-06-13'), -- Compra associada ao cliente Pedro Oliveira (Chevrolet Cruze)
		(6, 7, '2024-06-14'); -- Compra associada à cliente Fernanda Santos (Nissan Sentra)

-- Modificando o nome e o cpf do cliente de "id" 6.
UPDATE clientes SET nome = 'Matheus Costa Gomes', cpf = '04275457307' WHERE id = 6;

-- Modificando o ano de lançamento dos carros de "id" 12, 8 e 4.
UPDATE carros SET ano_lanc = 2023 WHERE id = 12;
UPDATE carros SET ano_lanc = 2021 WHERE id = 8;
UPDATE carros SET ano_lanc = 2024 WHERE id = 4;

-- Deletando os carros de "id" 14 e 15.
DELETE FROM carros WHERE id = 14 AND id = 15;

-- Deletando os clientes de "id" 2 e 4.
DELETE FROM clientes WHERE id = 2 AND id = 4;

-- Selecionando todos os clientes, carros e compras cadastradas e realizadas.
SELECT * FROM clientes;
SELECT * FROM carros;
SELECT * FROM compras;