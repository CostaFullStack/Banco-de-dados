-- Questão 02) Usando o comando TRUNCATE TABLE, exclua todos os dados da tabela "matriculas" sem excluir a estrutura da tabela.

-- Utilizando "DATABASE" com nome "questao_dois".
CREATE DATABASE questao_dois;

-- Utilizando "USE" para utilizar o "DATABASE" "questao_dois".
USE questao_dois;

-- Criando a tabela com nome "alunos".
CREATE TABLE alunos(
	id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT
);

-- Criando a tabela com nome "cursos".
CREATE TABLE cursos(
	id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    carga_horaria INT  
);

-- Criando a tabela com nome "matriculas".
CREATE TABLE matriculas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATETIME,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos (id_curso)
);

-- Excluindo todos os dados da tabela "matriculas".
-- Ao executar esse comando, a tabela será truncada ou seja, os dados serão excluídos, mas a estrutura permanecerá na memória para operações posteriores.
TRUNCATE TABLE matriculas;