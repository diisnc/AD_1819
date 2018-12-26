SET SQL_SAFE_UPDATES = 0;

delete from dim_cliente;
delete from dim_data;
delete from dim_expedidor;
delete from dim_fornecedor;
delete from dim_funcionario;
delete from dim_produto;
delete from tf_encomendas;


select * from dim_cliente;
select * from dim_data;
select * from dim_expedidor;
select * from dim_fornecedor;
select * from dim_funcionario;
select * from dim_produto;
select * from tf_encomendas;