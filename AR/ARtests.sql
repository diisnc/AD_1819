SET SQL_SAFE_UPDATES = 0;

delete from ar_cleanup_cliente;
delete from ar_cleanup_encomendas;
delete from ar_cleanup_expedidor;
delete from ar_cleanup_fornecedor;
delete from ar_cleanup_funcionario;
delete from ar_cleanup_produto;


select * from ar_cleanup_data;
select * from ar_cleanup_cliente;
select * from ar_cleanup_expedidor;
select * from ar_cleanup_produto;
select * from ar_cleanup_funcionario;
select * from ar_cleanup_fornecedor;
select * from ar_cleanup_encomendas;