# Questão 01) Crie um banco de dados chamado"escola" e as seguintes tabelas:
#Tabela "alunos" com colunas: id_aluno, nome, idade.
#Tabela "cursos" com colunas: id_curso, nome_curso, carga_horaria. 
#Tabela "matriculas" com colunas: id_matricula , id_aluno, id_curso, data_matricula.

-- Utilizando "DATABASE" com nome "questao_um".
CREATE DATABASE questao_um;

-- Utilizando "USE" para utilizar o "DATABASE" "questao_um".
USE questao_um;

-- Criando a tabela alunos.
CREATE TABLE alunos(
	id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT
);

-- Criando a tabela cursos.
CREATE TABLE cursos(
	id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    carga_horaria INT
    
);

-- Criando a tabela matrículas.
CREATE TABLE matriculas(
	id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATETIME,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos (id_curso)
);
