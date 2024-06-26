-- Questão 01) Crie uma tabela "pedidos" com as colunas "id_pedido", "id_cliente" e "data_pedido". Adicione uma constraint de chave estrangeira na coluna "id_cliente" para garantir que um pedido só possa ser feito por um cliente existente na tabela "clientes".

-- Criando a tabela com nome "clientes".
CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    idade INT,
    email VARCHAR(60) NOT NULL
);

-- Criando a tabela com nome "pedidos".
CREATE TABLE pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATETIME,
	-- Utilizando "FOREIGN KEY" para definir a chave estrangeira e "REFERENCES" para referenciar as outras tabelas.
    FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);