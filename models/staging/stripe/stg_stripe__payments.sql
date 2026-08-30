
select id AS customer_id, 
       orderid AS order_id, 
       amount
FROM raw.stripe.payment
