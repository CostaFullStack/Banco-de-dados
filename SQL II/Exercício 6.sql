# Questão 06) Faça um banco chamado "biblioteca" e implemente as seguintes tabelas:
# Tabela "autores" com os campos: id, nome, idade, nacionalidade
# Tabela "livros" com os campos: id, titulo, genero, ano de lançamento, id do autor, quantidade de paginas
# Tabela "clientes" com os campos: id, nome, cpf
# Tabela "emprestimo" com os campos: id, id do cliente, id do livro, data de emprestimo
# Insira 10 itens em cada tabela, delete 1 item de cada tabela, atualize o titulo e gênero de 2 livros e apenas o nome de um autor. Visualize todos os livros, autores, clientes e empréstimos.

-- Criando a "DATABASE" com nome "biblioteca_exercicio".
CREATE DATABASE biblioteca_exercicio;

-- Criando o "USE" para utilizar o "DATABASE" "biblioteca_exercicio".
USE biblioteca_exercicio;

-- Criando a tabela com nome "autores".
CREATE TABLE autores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    idade INT,
    nacionalidade VARCHAR(255)
);

-- Criando a tabela com nome "livros".
CREATE TABLE livros(
	id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    genero VARCHAR(255) NOT NULL,
    ano_lanc INT,
    id_autor INT,
    qtde_paginas INT,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar a outra tabela.
	FOREIGN KEY (id_autor) REFERENCES autores (id)
);

-- Criando a tabela com nome "clientes".
CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE
);

-- Criando a tabela com nome "emprestimos".
CREATE TABLE emprestimos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
	id_livro INT,
    data_emprestimo DATE NOT NULL,
	-- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    FOREIGN KEY (id_livro) REFERENCES livros (id)
);

-- Adicionando 10 clientes a tabela "autores".
INSERT INTO autores (nome, idade, nacionalidade) VALUES
('J.K. Rowling', 56, 'Britânica'),
('Stephen King', 75, 'Americano'),
('Agatha Christie', 85, 'Britânica'),
('Gabriel García Márquez', 87, 'Colombiano'),
('Haruki Murakami', 74, 'Japonês'),
('Jane Austen', 41, 'Britânica'),
('Tolkien', NULL, 'Britânica'),
('George Orwell', 46, 'Britânica'),
('Terry Pratchett', 66, 'Britânica'),
('Hermann Hesse', 85, 'Alemão');

-- Adicionando 10 livros a tabela "livros".
INSERT INTO livros (titulo, genero, ano_lanc, id_autor, qtde_paginas) VALUES
('O Assassinato no Expresso Oriente', 'Crime', 1934, 3, 256),
('Cem Anos de Solidão', 'Realismo Mágico', 1967, 4, 417),
('Norwegian Wood', 'Ficção', 1987, 5, 296),
('Orgulho e Preconceito', 'Romance', 1813, 6, 279),
('O Senhor dos Anéis', 'Fantasia', 1954, 7, 1137),
('O Senhor dos Anéis: As Duas Torres', 'Fantasia', 1954, 7, 926),
('1984', 'Ficção Distópica', 1949, 8, 328),
('1984: New World', 'Ficção Distópica', 1949, 8, 412),
('Bons Augúrios', 'Fantasia Cômica', NULL, 9, 366),
('O Lobo da Estepe', 'Romance', 1927, 10, 237);

-- Adicionando 10 clientes a tabela "clientes".
INSERT INTO clientes (nome, cpf) VALUES
('Maria Silva', '12345678901'),
('João Santos', '23456789012'),
('Ana Souza', '34567890123'),
('Pedro Oliveira', '45678901234'),
('Mariana Costa', '56789012345'),
('Rafael Pereira', '67890123456'),
('Carolina Almeida', '78901234567'),
('Paulo Rodrigues', '89012345678'),
('Juliana Fernandes', '90123456789'),
('Lucas Carvalho', '01234567890');

-- Realizando 10 empréstimos a tabela "clientes".
INSERT INTO emprestimos (id_cliente, id_livro, data_emprestimo) VALUES
(1, 1, '2023-01-15'),
(3, 3, '2023-03-12'),
(6, 6, '2023-06-08'),
(7, 7, '2023-07-17'),
(7, 8, '2023-07-25'),
(9, 9, '2023-09-14'),
(10, 10, '2023-10-30');

-- Deletando 1 item de cada tabela.
DELETE FROM emprestimos WHERE id = 2;
DELETE FROM livros WHERE id = 5;
DELETE FROM clientes WHERE id = 8;
-- Deletando o "id_autor" da tabela "livros" que faz referência ao "id" 1 para realizar a exclusão do autor de id 1.
DELETE FROM livros WHERE id_autor = 1;
DELETE FROM autores WHERE id = 1;

-- Modificando o título e o gênero de 2 livros.
UPDATE livros SET
	titulo = "O Senhor dos Aneis O retorno do Rei",
	genero = "Fantasia"
WHERE id = 6;

UPDATE livros SET
	titulo = "1985",
	genero = "Crime"
WHERE id = 7;

-- Modificando o nome de 1 autor.
UPDATE autores SET
	nome = "Matheus Costa"
WHERE id = 5;

-- Selecionando todos os livros, autores, clientes e emprestimos realizados.
SELECT * FROM livros;
SELECT * FROM autores;
SELECT * FROM clientes;
SELECT * FROM emprestimos;

