-- Desafio prático) Suponha que você esteja gerenciando um banco de dados para uma biblioteca. O banco de dados contém as seguintes tabelas: 
-- Tabela "Livros" com as seguintes colunas:
-- livro_id (Chave Primária), título, autor_id (Chave Estrangeira relacionando-se à tabela "Autores"), ano_publicação e gênero.
-- Tabela "Autores" com as seguintes colunas:
-- autor_id (Chave Primária) e nome_autor.
-- Tabela "Empréstimos" com as seguintes colunas:
-- emprestimo_id (Chave Primária), livro_id (Chave Estrangeira relacionando-se à tabela "Livros"), data_emprestimo e data_devolução.
-- Seu desafio é escrever uma consulta SQL que retorna o nome de cada autor, o título do livro emprestado e a data de empréstimo. No entanto, você precisa considerar apenas os autores cujos livros foram emprestados. 
-- Além disso, a consulta deve listar os autores em ordem alfabética e os livros em ordem de data de empréstimo crescente.

-- Criando a "DATABASE" com nome "biblioteca_desafio".
CREATE DATABASE biblioteca_desafio;

-- Criando o "USE" para utilizar o "DATABASE" "biblioteca_desafio".
USE biblioteca_desafio;

-- Criando a tabela com nome "autores".
CREATE TABLE autores(
    autor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL
);

-- Criando a tabela com nome "livros".
CREATE TABLE livros(
    livro_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor_id INT,
    ano_publicacao INT,
    genero VARCHAR(100),
    FOREIGN KEY (autor_id) REFERENCES autores (autor_id)
);

-- Criando a tabela com nome "emprestimos".
CREATE TABLE emprestimos(
    emprestimo_id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES livros (livro_id)
);

-- Adicionando 10 autores a tabela "autores".
INSERT INTO autores (nome_autor) VALUES
    ('J.K. Rowling'),
    ('George Orwell'),
    ('Jane Austen'),
    ('J.R.R. Tolkien'),
    ('Agatha Christie'),
    ('Stephen King'),
    ('Gabriel García Márquez'),
    ('Haruki Murakami'),
    ('Mark Twain'),
    ('Ernest Hemingway');

-- Adicionando 10 livros a tabela "livros".
INSERT INTO livros (titulo, autor_id, ano_publicacao, genero) VALUES
    ('O Iluminado', 6, 1977, 'Horror'), -- Livro associado ao autor Stephen King
    ('Orgulho e Preconceito', 3, 1813, 'Romance'), -- Livro associado à autora Jane Austen
    ('Kafka à Beira-Mar', 8, 2002, 'Ficção'), -- Livro associado ao autor Haruki Murakami
    ('Assassinato no Expresso Oriente', 5, 1934, 'Crime'), -- Livro associado à autora Agatha Christie
    ('1984', 2, 1949, 'Distopia'), -- Livro associado ao autor George Orwell
    ('O Senhor dos Anéis: A Sociedade do Anel', 4, 1954, 'Fantasia'), -- Livro associado ao autor J.R.R Tolkien
    ('Harry Potter e a Pedra Filosofal', 1, 1997, 'Fantasia'), -- Livro associado à autora J.K. Rowling
    ('Cem Anos de Solidão', 7, 1967, 'Realismo Mágico'), -- Livro associado ao Gabriel García Márquez
    ('As Aventuras de Tom Sawyer', 9, 1876, 'Aventura'), -- Livro associado ao autor Mark Twain
    ('O Velho e o Mar', 10, 1952, 'Ficção'); -- Livro associado ao autor Ernest Hemingway

-- Adicionando 9 livros a tabela "emprestimos"
INSERT INTO emprestimos (livro_id, data_emprestimo) VALUES
    (1, '2024-06-01'), -- Empréstimo associado ao livro O Iluminado
    (3, '2024-06-03'), -- Empréstimo associado ao livro Kafka à Beira-Mar
    (5, '2024-06-05'), -- Empréstimo associado ao livro 1984
    (7, '2024-06-07'), -- Empréstimo associado ao livro Harry Potter e a Pedra Filosofal
    (2, '2024-06-09'), -- Empréstimo associado ao livro Orgulho e Preconceito
    (4, '2024-06-11'), -- Empréstimo associado ao livro Assassinato no Expresso Oriente
    (9, '2024-06-13'); -- Empréstimo associado ao livro As Aventuras de Tom Sawyer

-- Retornando os nomes, os títulos dos livros de seus respectivos autores e a data de empréstimo.
SELECT 
    autores.nome_autor,
    livros.titulo,
    emprestimos.data_emprestimo
FROM autores
-- Utilizando "INNER JOIN" para retornar os registros do nome dos autores da tabela "autores" à esquerda e os registros do título dos livros da tabela "livros" à direita. Caso não haja correspondência, os resultados dos títulos e nome dos autores dos livros não serão retornados.
INNER JOIN livros ON autores.autor_id = livros.autor_id
-- Utilizando "INNER JOIN" para retornar os registros dos livros da tabela "livros" dos autores que tiveram seus livros emprestados. Caso não haja correspondência, ou seja, caso os resultados dos títulos e nome dos autores dos livros que não tiveram empréstimos realizados, não serão retornados.
INNER JOIN emprestimos ON livros.livro_id = emprestimos.livro_id
-- Utilizando o "ORDER BY" para retornar o nome dos autores em ordem alfabética e a data de empréstimo em ordem crescente.
ORDER BY
    autores.nome_autor ASC,
    emprestimos.data_emprestimo ASC;
