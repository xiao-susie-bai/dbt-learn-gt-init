
with orders as (
	select * from {{ ref('stg_jaffle_shop__orders') }}
), 

payments as (
	select * from {{ ref('stg_stripe__payments') }}
), 

order_payments as (
	SELECT order_id, 
	       sum(CASE WHEN status='success' THEN amount END) as amount
	FROM payments 
	GROUP BY 1
), 

final as (
	select orders.order_id, 
	       orders.customer_id,  
	       orders.order_date,    
	       COALESCE(order_payments.amount, 0) as amount
	from orders 
	  left join order_payments 
	    using (order_id)
)

select *
from final
