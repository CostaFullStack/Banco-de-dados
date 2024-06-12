# Questão 03) Usando o comando DROP DATABASE, exclua o banco de dados "escola". Certifique-se de que você tenha feito um backup dos dados, pois essa ação apagará todo o banco de dados.

# Utilizando "DATABASE" com nome "questao_tres".
CREATE DATABASE questao_tres;
# Utilizando "USE" para utilizar o database "questao_tres".
USE questao_tres;
# Criando a tabela 'alunos".
CREATE TABLE alunos(
	id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    idade INT
);
# Criando a tabela "cursos".
CREATE TABLE cursos(
	id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    carga_horaria INT
    
);
# Criando a tabela "matriculas".
CREATE TABLE matriculas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATETIME,
    # Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos (id_curso)
);

# Excluindo o banco de dados "questao_tres"
# A instrução "DROP" destróí os objetos como um banco de dados, tabela, índice ou visão. Nesse caso, iremos destruir o banco de dados.
DROP DATABASE questao_tres;


