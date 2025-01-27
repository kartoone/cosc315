use joindb;

SELECT "SELECT * FROM customers;" as query1;
SELECT * FROM customers;

SELECT "SELECT * FROM orders;" as query2;
SELECT * FROM orders;

SELECT "SELECT fname, lname, orders.id, order_date from customers inner join orders on customers.id = orders.customer_id;" as query3;
SELECT fname, lname, orders.id, order_date from customers inner join orders on customers.id = orders.customer_id;
SELECT "results above include only orders where there is a matching customer b/c of the inner join" as "query3 explained";

SELECT "SELECT fname, lname, orders.id, order_date from customers right join orders on customers.id = orders.customer_id;" as query4;
SELECT fname, lname, orders.id, order_date from customers right join orders on customers.id = orders.customer_id;
SELECT "results above include orders without a matching customer b/c of the right join" as "query4 explained";

SELECT "SELECT fname, lname, orders.id, order_date from customers left join orders on customers.id = orders.customer_id;" as query5;
SELECT fname, lname, orders.id, order_date from customers left join orders on customers.id = orders.customer_id;
SELECT "results above include customers who have NOT placed an order b/c of the left join" as "query5 explained";

SELECT "SELECT count(orders.id), customers.fname, customers.lname from customers left join orders on customers.id = orders.customer_id GROUP BY customers.id;" as "query6";
SELECT count(orders.id), customers.fname, customers.lname from customers left join orders on customers.id = orders.customer_id GROUP BY customers.id;
SELECT "results above are how many orders each customer placed along with the customers name" as "query6 explained";

SELECT "join query with subquery and having clause" as query7;
SELECT 
    customers.fname, 
    customers.lname, 
    COUNT(orders.id) AS ordercnt
FROM 
    customers
LEFT JOIN 
    orders 
ON 
    customers.id = orders.customer_id
GROUP BY 
    customers.id, customers.fname, customers.lname
HAVING 
    COUNT(orders.id) = (
        SELECT 
            MAX(order_count)
        FROM (
            SELECT 
                COUNT(orders.id) AS order_count
            FROM 
                customers
            LEFT JOIN 
                orders 
            ON 
                customers.id = orders.customer_id
            GROUP BY 
                customers.id
        ) as counts
    )
ORDER BY 
    customers.fname, customers.lname;
SELECT "need a subquery to determine the max and then use HAVING to filter on the GROUP BY" as "query7 explained";


