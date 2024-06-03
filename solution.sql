USE BANK;
SHOW TABLES;
-- CONSULTA 1 : Obtén los valores de id de los primeros 5 clientes del district_id con un valor igual a 1.
SELECT CLIENT_ID
FROM CLIENT
WHERE DISTRICT_ID= 1
ORDER BY CLIENT_ID
LIMIT 5;

-- CONSULTA 2 : En la tabla client, obtén el valor de id del último cliente donde el district_id sea igual a 72.
SELECT CLIENT_ID 
FROM CLIENT
WHERE DISTRICT_ID= 72
ORDER BY CLIENT_ID DESC
LIMIT 1;


-- CONSULTA 3:Obtén las 3 cantidades más bajas en la tabla loan.
SELECT AMOUNT
FROM LOAN
ORDER BY AMOUNT ASC
LIMIT 3;

-- CONSULTA 4: ¿Cuáles son los valores posibles para status, ordenados alfabéticamente en orden ascendente en la tabla loan?
-- Añadimos el "distict" para dar una lista con valores unicos
SELECT DISTINCT STATUS
FROM LOAN
ORDER BY STATUS ASC;

-- CONSULTA 5: ¿Cuál es el loan_id del pago más alto recibido en la tabla loan?
SELECT loan_id
FROM LOAN
ORDER BY PAYMENTS DESC
LIMIT 1;

-- CONSULTA 6 :¿Cuál es el monto del préstamo de los 5 account_id más bajos en la tabla loan? Muestra el account_id y el monto correspondiente.
SELECT ACCOUNT_ID,AMOUNT
FROM LOAN 
ORDER BY ACCOUNT_ID ASC
-- es accendiente porque te coge los 5 más pequeños, ya que la tabla esta ordenada de mayor a menor.
LIMIT 5;

-- CONSULTA 7: ¿Cuáles son los account_id con el monto de préstamo más bajo que tienen una duration de préstamo de 60 en la tabla loan?
SELECT ACCOUNT_ID
FROM LOAN 
WHERE DURATION=60
ORDER BY AMOUNT ASC
LIMIT 5;

-- CONSULTA 8:¿Cuáles son los valores únicos de k_symbol en la tabla order?
SELECT DISTINCT K_SYMBOL
FROM `ORDER`;
 
 -- CONSULTA 9:En la tabla order, ¿cuáles son los order_id del cliente con el account_id 34?
 SELECT ORDER_ID
 FROM `ORDER`
 WHERE ACCOUNT_ID=34;
 
 -- CONSULTA 10:En la tabla order, ¿qué account_id fueron responsables de las órdenes entre order_id 29540 y order_id 29560 (inclusive)?
SELECT DISTINCT ACCOUNT_ID
FROM `ORDER`
WHERE ORDER_ID BETWEEN 29540 AND 29560
ORDER BY ACCOUNT_ID
LIMIT 4;

-- CONSULTA 11: En la tabla order, ¿cuáles son los montos individuales que fueron enviados a (account_to) id 30067122?
SELECT DISTINCT AMOUNT
FROM `ORDER`
WHERE ACCOUNT_TO = 30067122;

-- CONSULTA 12:En la tabla trans, muestra el trans_id, date, type y amount de las 10 primeras transacciones del account_id 793 en orden cronológico, de las más recientes a las más antiguas.
SELECT trans_id,date,type,amount
FROM trans
WHERE ACCOUNT_ID=793
ORDER BY DATE DESC
LIMIT 10;

-- CONSULTA 13: En la tabla client, de todos los distritos con un district_id menor que 10, ¿cuántos clientes hay de cada district_id? Muestra los resultados ordenados por district_id en orden ascendente.
SELECT district_id,COUNT(district_id)
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id ASC
;

-- CONSULTA 14: En la tabla card, ¿cuántas tarjetas existen para cada type? Ordena el resultado comenzando con el type más frecuente.
SELECT type,COUNT(type)
FROM card
GROUP BY type
ORDER BY COUNT(type) DESC
;

-- CONSULTA 15: Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
SELECT account_id,SUM(amount)
FROM loan
GROUP BY account_id
ORDER BY SUM(amount) DESC
LIMIT 10
;

-- CONSULTA 16:In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
-- Posem el * perque ens conti el número de loans que hi ha en aquella data en concret.
SELECT DATE,COUNT(*) AS NUMBER_OF_LOANS
FROM LOAN
WHERE DATE < '930907'
GROUP BY date
ORDER BY DATE DESC
;

-- CONSULTA 17: In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
SELECT 
    date,
    duration,
    COUNT(*) AS number_of_loans
FROM 
    loan
WHERE 
    date BETWEEN '12-01' AND '12-31'
GROUP BY 
    date, duration
ORDER BY 
    date ASC, duration ASC;
;

-- CONSULTA 18: In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.
SELECT 
    account_id,
    type,
    SUM(amount) AS total_amount
FROM 
    trans
WHERE 
    account_id = 396
GROUP BY 
    account_id, type
ORDER BY 
    type ASC;















