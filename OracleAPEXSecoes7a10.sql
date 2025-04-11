SELECT c.nome, co.numero_conta
FROM cliente c, conta co
WHERE c.id_cliente = co.id_cliente;


SELECT c.nome, a.nome_agencia
FROM cliente c, agencia a;


SELECT c.nome, a.cidade
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
JOIN agencia a ON co.id_agencia = a.id_agencia;


SELECT SUM(saldo) AS saldo_total
FROM conta;


SELECT MAX(saldo) AS maior_saldo, AVG(saldo) AS media_saldo
FROM conta;


SELECT COUNT(*) AS total_contas
FROM conta;


SELECT COUNT(DISTINCT cidade) AS cidades_distintas
FROM cliente;


SELECT numero_conta, NVL(saldo, 0) AS saldo
FROM conta;


SELECT c.cidade, AVG(co.saldo) AS media_saldo
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
GROUP BY c.cidade;


SELECT c.cidade, COUNT(*) AS total_contas
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
GROUP BY c.cidade
HAVING COUNT(*) > 3;


SELECT a.cidade, SUM(co.saldo) AS total_saldo
FROM agencia a
JOIN conta co ON a.id_agencia = co.id_agencia
GROUP BY ROLLUP(a.cidade);


SELECT cidade FROM cliente
UNION
SELECT cidade FROM agencia;


SELECT c.nome
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
WHERE co.saldo > (SELECT AVG(saldo) FROM conta);


SELECT c.nome
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
WHERE co.saldo = (SELECT MAX(saldo) FROM conta);


SELECT cidade
FROM cliente
GROUP BY cidade
HAVING COUNT(*) > (SELECT AVG(COUNT(*)) FROM cliente GROUP BY cidade);


SELECT c.nome
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
WHERE co.saldo IN (SELECT saldo FROM (SELECT saldo FROM conta ORDER BY saldo DESC) WHERE ROWNUM <= 10);


SELECT c.nome
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
WHERE co.saldo < ALL (SELECT saldo FROM conta WHERE id_cliente IN 
                     (SELECT id_cliente FROM cliente WHERE cidade = 'Niterói'));


SELECT c.nome
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
WHERE co.saldo BETWEEN (SELECT MIN(saldo) FROM conta WHERE id_cliente IN 
                      (SELECT id_cliente FROM cliente WHERE cidade = 'Volta Redonda'))
                      AND
                      (SELECT MAX(saldo) FROM conta WHERE id_cliente IN 
                      (SELECT id_cliente FROM cliente WHERE cidade = 'Volta Redonda'));


SELECT c.nome
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
WHERE co.saldo > (SELECT AVG(saldo) FROM conta WHERE id_agencia = co.id_agencia);


SELECT c.nome, c.cidade
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
WHERE co.saldo < (SELECT AVG(saldo) FROM conta WHERE id_cliente IN 
                 (SELECT id_cliente FROM cliente WHERE cidade = c.cidade));


SELECT nome
FROM cliente c
WHERE EXISTS (SELECT 1 FROM conta WHERE id_cliente = c.id_cliente);


SELECT nome
FROM cliente c
WHERE NOT EXISTS (SELECT 1 FROM conta WHERE id_cliente = c.id_cliente);


WITH media_cidade AS (
    SELECT c.cidade, AVG(co.saldo) AS media
    FROM cliente c
    JOIN conta co ON c.id_cliente = co.id_cliente
    GROUP BY c.cidade
)
SELECT c.nome, c.cidade, co.saldo, mc.media
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
JOIN media_cidade mc ON c.cidade = mc.cidade
WHERE co.saldo > mc.media;
