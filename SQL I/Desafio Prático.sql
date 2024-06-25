# Desafio prático) Crie um banco de dados para um sistema de uma escola, esse banco de dados ficará responsável por persistir os dados sobre alunos, professores, turmas e disciplinas. Para os alunos é importante que contenha um número de:
# matrícula, o nome, a idade, e o endereço.
#Para os professores, deverá conter um número de matrícula, nome, especialidade e endereço.
#Para a turma deverá conter um identificador, horário de início e dia de semana.
#Para disciplina é importante que contenha um identificador, nome e quantidade de aulas.

-- Utilizando "DATABASE" com nome "sistema_escola".
CREATE DATABASE sistema_escola;

-- Utilizando "USE" para utilizar o database "questao_tres".
USE sistema_escola;

-- Criando a tabela "professores".
CREATE TABLE professores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(25) NOT NULL,
    endereco VARCHAR(30)
);

-- Criando a tabela "turmas".
CREATE TABLE turmas(	
	id INT AUTO_INCREMENT PRIMARY KEY,
    horario DATETIME,
    dia_semana VARCHAR(15)
);

-- Criando a tabela "disciplinas".
CREATE TABLE disciplinas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    qtd_aulas INT
);

-- Criando a tabela "alunos".
CREATE TABLE alunos(
	-- "id" é o número de matrícula da tabela alunos.
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    endereco VARCHAR(30) NOT NULL,
    id_professor INT,
    id_turma INT,
    id_disciplina INT,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_professor) REFERENCES professores(id),
    FOREIGN KEY (id_turma) REFERENCES turmas(id),
    FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id)
);
