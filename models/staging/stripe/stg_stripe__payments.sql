
select id AS customer_id, 
       orderid AS order_id, 
       paymentmethod as payment_method, 
       status, 
       -- *! (from looking at the data,) amount is stored in cents, convert it into dollars
       amount / 100 as amount, 
       created as created_at
       
FROM {{ source('stripe', 'payment') }}
