SELECT * FROM cliente;

SELECT nome, cidade FROM cliente;

SELECT numero_conta, saldo FROM conta;

SELECT nome FROM cliente WHERE cidade = 'Macaé';

SELECT codigo, nome FROM cliente WHERE codigo BETWEEN 5 AND 15;

SELECT * FROM cliente 
WHERE cidade IN ('Niterói', 'Volta Redonda', 'Itaboraí');

SELECT nome FROM cliente WHERE nome LIKE 'F%';

SELECT nome || ' mora em ' || cidade || '.' AS "Frase" 
FROM cliente;

SELECT * FROM conta 
WHERE saldo > 9000 
ORDER BY saldo DESC;

SELECT * FROM cliente 
WHERE cidade = 'Nova Iguaçu' OR nome LIKE '%Silva%';

SELECT numero_conta, ROUND(saldo) AS saldo_arredondado 
FROM conta;

SELECT UPPER(nome) AS nome_maiusculo FROM cliente;

SELECT nome FROM cliente 
WHERE cidade NOT IN ('Teresópolis', 'Campos dos Goytacazes');
