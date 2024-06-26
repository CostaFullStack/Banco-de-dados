-- Questão 02) Crie uma tabela "produtos" com as colunas "id_produto", "nome_produto" e "preco". Adicione uma constraint de verificação para garantir que o preço do produto seja maior que zero.

-- Criando a tabela com nome "produtos".
CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco FLOAT NOT NULL,
    -- Utilizando a restrição de verificação "CHECK" na coluna "preco".
    CHECK (preco > 0)
);