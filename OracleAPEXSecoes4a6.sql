SELECT UPPER(nome) FROM cliente;


SELECT INITCAP(nome) FROM cliente;


SELECT SUBSTR(nome, 1, 3) FROM cliente;


SELECT nome, LENGTH(nome) FROM cliente;


SELECT numero_conta, ROUND(saldo) FROM conta;


SELECT numero_conta, TRUNC(saldo) FROM conta;


SELECT numero_conta, MOD(saldo, 1000) FROM conta;


SELECT SYSDATE FROM dual;


SELECT SYSDATE, SYSDATE + 30 AS "Data de vencimento simulada" FROM dual;


SELECT numero_conta, data_abertura, SYSDATE - data_abertura AS dias_aberta FROM conta;


SELECT numero_conta, TO_CHAR(saldo, 'L999G990D99') AS saldo_formatado FROM conta;


SELECT numero_conta, TO_CHAR(data_abertura, 'dd/mm/yyyy') FROM conta;


SELECT numero_conta, NVL(saldo, 0) FROM conta;


SELECT nome, NVL(cidade, 'Sem cidade') FROM cliente;


SELECT nome, cidade,
       CASE 
           WHEN cidade = 'Niterói' THEN 'Região Metropolitana'
           WHEN cidade = 'Resende' THEN 'Interior'
           ELSE 'Outra Região'
       END AS classificacao_regional
FROM cliente;


SELECT c.nome, co.numero_conta, co.saldo
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente;


SELECT c.nome, a.nome_agencia
FROM cliente c
JOIN conta co ON c.id_cliente = co.id_cliente
JOIN agencia a ON co.id_agencia = a.id_agencia;


SELECT a.nome_agencia, c.nome
FROM agencia a
LEFT JOIN conta co ON a.id_agencia = co.id_agencia
LEFT JOIN cliente c ON co.id_cliente = c.id_cliente;
