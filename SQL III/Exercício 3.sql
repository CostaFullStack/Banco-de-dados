-- Questão 03) Suponha que você tenha tabelas "Pessoas" e "Documentos de Identidade" com um relacionamento um-para-um. Escreva uma consulta para recuperar o nome de cada pessoa e o número do documento de identidade, se estiverem  disponíveis.

-- Utilizando "DATABASE" com nome "documentos". 
CREATE DATABASE documentos;

-- Utilizando "USE" para utilizar o "DATABASE" "documentos".
USE documentos;

-- Criando a tabela com nome "pessoas".
CREATE TABLE pessoas(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nasc DATE
);

-- Criando a tabela com nome "documentos_identidade".
CREATE TABLE documentos_identidade(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nmr_documento INT NOT NULL,
    tipo_documento VARCHAR(30) NOT NULL,
    id_pessoa INT,
    -- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar a outra tabela.
    FOREIGN KEY (id_pessoa) REFERENCES pessoas (id)
);

-- Adicionando 4 pessoas a tabela "pessoas".
INSERT INTO pessoas
(nome, data_nasc)
	VALUES
		('João Silva', '1990-05-15'),
		('Maria Santos', '1985-09-20'),
		('Pedro Oliveira', '1995-03-10'),
		('Ana Souza', '1988-07-25');

-- Adicionando 3 números de documentos a tabela "documentos_identidade".
INSERT INTO documentos_identidade
(nmr_documento, tipo_documento, id_pessoa)
	VALUES
		('123456789', 'RG', 1), -- Documento associado à pessoa João Silva
		('987654321', 'CPF', 2), -- Documento associado à pessoa Maria Santos
		('555666777', 'RG', 4); -- Documento associado à pessoa Ana Souza

-- Retornando os nomes e os documentos da respectiva pessoa. 
SELECT 
	pessoas.nome AS nome_pessoa,
    documentos_identidade.nmr_documento AS numero_documento
FROM pessoas
-- Utilizando "LEFT JOIN" para retornar todos os registros da tabela "pessoas" à esquerda e os registros da tabela "documentos_identidade" à direita. Caso não haja correspondência, os resultados das pessoas serão "NULL".
LEFT JOIN documentos_identidade 
ON pessoas.id = documentos_identidade.id_pessoa;
    
	
        
        