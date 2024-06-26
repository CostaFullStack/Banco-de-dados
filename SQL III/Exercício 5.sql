-- Questão 05) Dado um cenário com tabelas "Músicos" e "Bandas" com um relacionamento muitos-para-muitos, escreva uma consulta que liste o nome de cada músico e as bandas em que eles tocam.

-- Criando a "DATABASE" com nome "musica".
CREATE DATABASE musica;

-- Criando o "USE" para utilizar o "DATABASE" "musica".
USE musica;

-- Criando a tabela com nome "musicos".
CREATE TABLE musicos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    instrumento_principal VARCHAR(20) NOT NULL,
    genero_musical VARCHAR(40) NOT NULL,
    nacionalidade VARCHAR(100)
);

-- Criando a tabela com nome "bandas".
CREATE TABLE bandas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ano_formacao YEAR,
    id_musico INT,
    genero_musical VARCHAR(20) NOT NULL,
    nacionalidade VARCHAR(100),
    FOREIGN KEY (id_musico) REFERENCES musicos (id)
);

-- Adicionando 6 músicos a tabela "musicos".
INSERT INTO musicos
(nome, idade, instrumento_principal, genero_musical, nacionalidade)
	VALUES
		('John Lennon', 40, 'Guitarra', 'Rock', 'Britânico'),
		('Miles Davis', 65, 'Trompete', 'Jazz', 'Americano'),
		('Freddie Mercury', 38, 'Vocal', 'Rock', 'Britânico'),
		('Astrud Gilberto', 70, 'Vocal', 'Bossanova', 'Brasileira'),
		('Jimi Hendrix', 27, 'Guitarra', 'Rock', 'Americano'),
		('Yo-Yo Ma', 65, 'Cello', 'Clássico', 'Americano');

-- Adicionando 6 bandas a tabela "bandas".
INSERT INTO bandas
(nome, ano_formacao, id_musico, genero_musical, nacionalidade)
	VALUES
		('The Beatles', 1960, 1, 'Rock', 'Britânica'), -- Banda associada ao músico John Lennon
		('Miles Davis Quintet', 1955, 2, 'Jazz', 'Americana'), -- Banda associada ao músico Miles Davis
		('Queen', 1970, 3, 'Rock', 'Britânica'), -- Banda associada ao músico Freddie Mercury
		('Os Cariocas', 1942, 4, 'Bossanova', 'Brasileira'), -- Banda associada ao músico Astrud Gilberto
		('The Jimi Hendrix Experience', 1966, 5, 'Rock', 'Americana'), -- Banda associada ao músico Jimi Hendrix
		('Yo-Yo Ma & The Silk Road Ensemble', 2000, 6, 'Clássico', 'Americana'); -- Banda associada ao músico Yo-Yo Ma

-- Retornando os nomes dos músicos e os nomes de suas respectivas bandas.
SELECT
	musicos.nome AS nome_musico,
    bandas.nome AS nome_banda
FROM musicos
-- Utilizando "INNER JOIN" para retornar todos os registros do nome do músico da tabela "musicos" à esquerda e os registros do nome da banda da tabela "bandas" à direita. Caso não haja correspondência, os resultados dos nomes das bandas não serão retornados.
INNER JOIN bandas
ON musicos.id = bandas.id_musico;
