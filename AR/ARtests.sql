SET SQL_SAFE_UPDATES = 0;

delete from ar_cleanup_cliente;
delete from ar_cleanup_encomendas;
delete from ar_cleanup_expedidor;
delete from ar_cleanup_fornecedor;
delete from ar_cleanup_funcionario;
delete from ar_cleanup_produto;
delete from ar_cleanup_data;

select * from ar_cleanup_data;
select * from ar_cleanup_cliente; -- sem nulos
select * from ar_cleanup_expedidor; -- sem nulos
select * from ar_cleanup_produto; -- com atributos nulos (quantidadeUnidade)
select * from ar_cleanup_funcionario; -- sem nulos
select * from ar_cleanup_fornecedor; -- sem nulos
select * from ar_cleanup_encomendas; -- com atributos nulos (expedidor, dataPagamento, dataEnvio)
