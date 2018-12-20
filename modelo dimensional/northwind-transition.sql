INSERT INTO northwind_dw.dim_cliente (idCliente,nome,empresa,cidade,estado)
	SELECT id, CONCAT(first_name," ",last_name), company, city, state_province FROM northwind.customers;

INSERT INTO northwind_dw.dim_expedidor (idExpedidor,empresa)
	SELECT id, company FROM northwind.shippers;
    
INSERT INTO northwind_dw.dim_funcionario (idFuncionario,nome,cargo,cidade)
	SELECT id, CONCAT(first_name," ",last_name), job_title, city FROM northwind.employees;

INSERT INTO northwind_dw.dim_fornecedor (idFornecedor,empresa)
	SELECT id, company FROM northwind.suppliers;
    
INSERT INTO northwind_dw.dim_produto (idProduto,nome,quantidadeUnidade,categoria)
	SELECT id, product_name, quantity_per_unit, category FROM northwind.products;
    
INSERT INTO northwind_dw.dim_data (data,diaSemana,dia,mes,ano,trimestre,semestre)
	SELECT order_date, WEEKDAY(order_date), DAY(order_date), MONTH(order_date), YEAR(order_date), QUARTER(order_date), FLOOR((QUARTER(order_date)/3)+1) FROM northwind.orders WHERE order_date IS NOT NULL
	UNION 
	SELECT shipped_date, WEEKDAY(shipped_date), DAY(shipped_date), MONTH(shipped_date), YEAR(shipped_date), QUARTER(shipped_date), FLOOR((QUARTER(shipped_date)/3)+1) FROM northwind.orders WHERE shipped_date IS NOT NULL
	UNION 
	SELECT paid_date, WEEKDAY(paid_date), DAY(paid_date), MONTH(paid_date), YEAR(paid_date), QUARTER(paid_date), FLOOR((QUARTER(paid_date)/3)+1) FROM northwind.orders WHERE paid_date IS NOT NULL;

SELECT quantity, (unit_price*quantity)-(unit_price*quantity*discount), unit_price, shipping_fee, discount FROM northwind.orders, northwind.order_details
	WHERE northwind.order_details.order_id=northwind.orders.id;