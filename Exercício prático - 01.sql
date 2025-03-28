SELECT a.aluno_id, a.nome
FROM aluno a
JOIN matricula m ON a.aluno_id = m.aluno_id
WHERE m.curso_id = 101;




SELECT titulo, carga_horaria
FROM curso
WHERE carga_horaria > 40;




SELECT a.nome
FROM aluno a
JOIN matricula m ON a.aluno_id = m.aluno_id
WHERE m.nota IS NULL;




SELECT a.nome, c.titulo, m.data_matricula
FROM matricula m
JOIN aluno a ON m.aluno_id = a.aluno_id
JOIN curso c ON m.curso_id = c.curso_id
WHERE m.data_matricula > TO_DATE('2024-01-01', 'YYYY-MM-DD');




SELECT titulo, carga_horaria
FROM curso
WHERE carga_horaria BETWEEN 30 AND 60;




SELECT nome, email
FROM aluno
WHERE email LIKE '%@gmail.com';




SELECT a.nome, c.titulo, m.data_matricula
FROM aluno a, curso c, matricula m
WHERE a.aluno_id = m.aluno_id AND c.curso_id = m.curso_id;




SELECT a.nome, c.titulo, m.nota
FROM aluno a
JOIN matricula m ON a.aluno_id = m.aluno_id
JOIN curso c ON m.curso_id = c.curso_id;




SELECT c.titulo
FROM curso c
JOIN matricula m ON c.curso_id = m.curso_id
JOIN aluno a ON m.aluno_id = a.aluno_id
WHERE a.nome = 'João Silva';




SELECT c.titulo
FROM curso c
JOIN matricula m ON c.curso_id = m.curso_id
GROUP BY c.titulo
HAVING COUNT(m.aluno_id) > 1;




SELECT a.nome
FROM aluno a
LEFT JOIN matricula m ON a.aluno_id = m.aluno_id
WHERE m.aluno_id IS NULL;




SELECT c.titulo
FROM curso c
LEFT JOIN matricula m ON c.curso_id = m.curso_id
WHERE m.curso_id IS NULL;




SELECT a.nome, COUNT(m.curso_id) AS quantidade_cursos
FROM aluno a
LEFT JOIN matricula m ON a.aluno_id = m.aluno_id
GROUP BY a.nome;




SELECT AVG(nota) AS media_geral
FROM matricula
WHERE nota IS NOT NULL;




SELECT 
    c.titulo,
    avg_notas.media_curso
FROM curso c
JOIN (
    SELECT 
        curso_id,
        AVG(nota) AS media_curso
    FROM matricula
    WHERE nota IS NOT NULL
    GROUP BY curso_id
) avg_notas ON c.curso_id = avg_notas.curso_id;




SELECT MAX(nota) AS maior_nota
FROM matricula;




SELECT a.nome, m.nota
FROM aluno a
JOIN matricula m ON a.aluno_id = m.aluno_id
WHERE m.nota = (SELECT MIN(nota) FROM matricula WHERE nota IS NOT NULL);




SELECT c.titulo, COUNT(m.aluno_id) AS total_matriculas
FROM curso c
LEFT JOIN matricula m ON c.curso_id = m.curso_id
GROUP BY c.titulo;




SELECT a.nome, AVG(m.nota) AS media_nota
FROM aluno a
JOIN matricula m ON a.aluno_id = m.aluno_id
GROUP BY a.nome
HAVING AVG(m.nota) >= 8.0;



SELECT c.titulo, 
       AVG(m.nota) AS media_nota, 
       MIN(m.nota) AS menor_nota, 
       MAX(m.nota) AS maior_nota
FROM curso c
JOIN matricula m ON c.curso_id = m.curso_id
WHERE m.nota IS NOT NULL
GROUP BY c.titulo;
