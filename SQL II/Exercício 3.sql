# Questão 03) Adicione uma constraint de restrição única na coluna "email" da tabela "clientes" para garantir que nenhum cliente possa ter o mesmo endereço de e-mail.

-- Criando a tabela com nome "clientes".
CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    idade INT,
	# Utilizando a restrição única "UNIQUE" na coluna "email".
    email VARCHAR(60) UNIQUE NOT NULL
);

-- Criando a tabela com nome "pedidos".
CREATE TABLE pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATETIME,
	-- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);