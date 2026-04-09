//Q1 revenue per sales
SELECT sales_channel, SUM(amount) AS revenue
FROM clinic_sales
GROUP BY sales_channel;

//Q2  top 10 customers
SELECT uid, SUM(amount) AS total_spent
FROM clinic_sales
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

//Q3 month-wise  profit 
SELECT 
    MONTH(cs.datetime) AS month,
    SUM(cs.amount) AS revenue,
    SUM(e.amount) AS expense,
    (SUM(cs.amount) - SUM(e.amount)) AS profit
FROM clinic_sales cs, expenses e
WHERE MONTH(cs.datetime) = MONTH(e.datetime)
GROUP BY MONTH(cs.datetime);

//Q4 most profitable clinic per city
SELECT cid, SUM(amount) AS revenue
FROM clinic_sales
GROUP BY cid
ORDER BY revenue DESC
LIMIT 1;

//Q5 2nd least profitable clinic
SELECT cid, SUM(amount) AS revenue
FROM clinic_sales
GROUP BY cid
ORDER BY revenue ASC
LIMIT 1 OFFSET 1;