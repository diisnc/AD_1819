SET SQL_SAFE_UPDATES = 0;

-- -----------------------------------------------------------------------------------

-- TEST #1: O cliente com o id = 5 morava originalmente em Minneapolis, MN. 
-- 			  Mudou-se para cidade = 'New York' e estado = 'NY'
UPDATE customers
SET city = 'New York', state_province = 'NY'
WHERE id = 5; 


-- REVERT #1
UPDATE customers
SET city = 'Minneapolis', state_province = 'MN'
WHERE id = 5; 

select * from customers;




-- -----------------------------------------------------------------------------------

-- TEST #2: Nova encomenda: - O id é AI (vai ser 82 porque o último id na BD é 81)
-- 							- employee_id: 4  
-- 			  				- costumer_id: 3
-- 							- Order_date: '2018-04-25 17:05:10'
-- 							- Shipped_date: '2018-10-01 10:33:54'
-- 							- Expedidor q realizou o transporte: id = 2
-- 							- Ship_name: 'Soo Jung Lee'
-- 							- Ship_address: '789 29th Street'
-- 							- Ship_city: 'Denver'
-- 							- Ship_state_province: 'CO'
-- 							- Ship_zip_postal_code: '99999'
-- 							- Ship_country_region: 'USA'
-- 							- Shipping_fee: 7.0000
-- 							- Taxes: 0.0000
-- 							- Payment_type: 'Credit Card'
-- 							- Paid_date: '2018-04-25 18:10:01'
-- 							- Notes: null
-- 							- Tax_rate: 0
-- 							- Tax_status_id: null
-- 							- Status_id: 3
INSERT INTO orders (employee_id, customer_id, order_date, shipped_date, shipper_id, 
					   ship_name, ship_address, ship_city, ship_state_province, ship_zip_postal_code, 
                       ship_country_region, shipping_fee, taxes, payment_type, paid_date, notes, 
                       tax_rate, tax_status_id, status_id)
VALUES (4, 3, '2018-04-25 17:05:10', '2018-10-01 10:33:54', 2, 'Soo Jung Lee', '789 29th Street', 
	    'Denver', 'CO', '99999', 'USA', 7.0000, 0.0000, 'Credit Card', '2018-04-25 18:10:01', null,
        0, null, 3);


-- REVERT #2
DELETE FROM orders WHERE id = 82;

select * from orders;