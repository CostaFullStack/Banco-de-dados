-- Questão 04) Escreva uma consulta que recupere o nome de todos os alunos que tenham mais de 20 anos e que estejam matriculados em cursos de "Matemática". Use uma subconsulta para realizar essa tarefa.

-- Utilizando o comando "SELECT" para recuperar os dados da coluna "alunos"
SELECT nome 
FROM alunos 
-- Utilizando a cláusula "WHERE" para selecionar os maiores de 20 anos e "AND" para os matriculados em matemática.
WHERE idade > 20 AND nome_curso = 'Matemática'
