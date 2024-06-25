# Questão 04) Crie um banco de dados chamado "biblioteca" e implemente as seguintes tabelas:
# Tabela "autores" com as seguintes colunas:
# id, nome, data de nascimento e nacionalidade.
# Tabela "livros" com as seguintes colunas:
# id, título, gênero, ano de lançamento, quantidade de páginas e id do autor.

-- Utilizando "DATABASE" com nome "biblioteca".
CREATE DATABASE biblioteca;

-- Utilizando "USE" para utilizar o "DATABASE" "biblioteca".
USE biblioteca;

-- Criando a tabela "autores".
CREATE TABLE autores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_nasc DATE,
    nacionalidade VARCHAR(50)
);

-- Criando a tabela "livros".
CREATE TABLE livros(
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(30) NOT NULL,
    ano_lanc YEAR,
    qtd_paginas INT,
    id_autor INT,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY(id_autor) REFERENCES autores(id)
    
);