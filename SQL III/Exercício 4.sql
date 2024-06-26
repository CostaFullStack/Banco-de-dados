-- Questão 04) Suponha que você tenha tabelas "Autores" e "Livros" com um relacionamento um-para-muitos. Escreva uma consulta que retorne o nome de cada autor e os títulos dos livros que eles escreveram.

-- Criando a "DATABASE" com nome "biblioteca_muitos".
CREATE DATABASE biblioteca_muitos;

-- Criando o "USE" para utilizar o "DATABASE" "biblioteca_muitos".
USE biblioteca_muitos;

-- Criando a tabela com nome "autores".
CREATE TABLE autores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    nacionalidade VARCHAR(100)
);

-- Criando a tabela com nome "livros".
CREATE TABLE livros(
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    ano_lanc INT,
    id_autor INT,
    qtde_paginas INT,
	-- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar a outra tabela.
    FOREIGN KEY (id_autor) REFERENCES autores (id)
);

-- Adicionando 5 livros a tabela "autores".
INSERT INTO autores
(nome,idade,nacionalidade)
	VALUES
		('Gabriel Garcia Marquez', 87, 'Colombiano'),
		('Haruki Murakami', 74, 'Japonês'),
		('Jorge Luis Borges', 86, 'Argentino'),
		('Virginia Woolf', 59, 'Britânica'),
		('Albert Camus', 46, 'Francês');

-- Adicionando 5 livros a tabela "livros".
INSERT INTO livros
(titulo, genero, ano_lanc, id_autor, qtde_paginas)
	VALUES
		('Cem Anos de Solidão', 'Realismo Mágico', 1967, 1, 417), -- Livro associado ao autor Gabriel Garcia Marquez
		('Norwegian Wood', 'Ficção', 1987, 2, 296), -- Livro associado ao autor Haruki Murakami
		('Ficções', 'Ficção Fantástica', 1944, 3, 194), -- Livro associado ao autor Jorge Luis Borges
		('Mrs. Dalloway', 'Ficção Modernista', 1925, 4, 194), -- Livro associado à autora Virginia Woolf
		('O Estrangeiro', 'Romance Filosófico', 1942, 5, 123); -- Livro associado ao autor Albert Camus
        
-- Retornando os nomes e os títulos dos livros de seus respectivos autores. 
SELECT
	autores.nome AS nome_autor,
    livros.titulo AS titulo_livro
FROM autores
-- Utilizando "INNER JOIN" para retornar todos os registros da tabela "autores" à esquerda e os registros da tabela "livros" à direita. Caso não haja correspondência, os resultados dos títulos dos livros não serão retornados.
INNER JOIN livros
ON autores.id = livros.id_autor;
    
    
