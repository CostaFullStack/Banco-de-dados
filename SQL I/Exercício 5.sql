# Questão 05) Crie um banco de dados chamado "concessionaria" e implemente as seguintes tabelas:
# Tabela "clientes" com as seguintes colunas:
# id, nome, cpf, endereço, data de nascimento.
# Tabela "carros" com as seguintes colunas:
# id, marca, modelo, ano lançamento, preço, ar-condicionado.
# Tabela "compras" com as seguintes colunas:
# id, id do cliente, id do carro, data de compra.

-- Utilizando "DATABASE" com nome "concessionaria".
CREATE DATABASE concessionaria;

-- Utilizando "USE" para utilizar o "DATABASE" "concessionaria".
USE concessionaria;

-- Criando a tabela "clientes".
CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE,
    endereco VARCHAR(30) NOT NULL,
    data_nasc DATE
);

-- Criando a tabela "carros".
CREATE TABLE carros(
	id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_lanc YEAR NOT NULL,
    preco FLOAT NOT NULL,
    ar_cond BOOL NOT NULL
);

-- Criando a tabela "compras".
CREATE TABLE compras(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_carro INT,
    data_compra DATETIME,
	-- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_carro) REFERENCES carros(id)
);
