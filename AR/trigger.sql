DROP TRIGGER IF EXISTS nullTreatmentProd;
DELIMITER //

CREATE TRIGGER nullTreatmentProd
BEFORE INSERT ON arearet.ar_cleanup_produto FOR EACH ROW
BEGIN

    IF(NEW.quantidadeUnidade IS NULL)
	THEN SET NEW.quantidadeUnidade = 'desconhecido';
    END IF;
    
END;
//

DELIMITER ;


-- ------------------------------------------------------------
-- Número 0 fica reservado para código de erro
-- Não há datas nem expedidores que possam tomar o valor 0
-- (Expedidor chaves começam a 1 e datas são inteiros no formato 20060101)
DROP TRIGGER IF EXISTS nullTreatmentOrders;
DELIMITER //

CREATE TRIGGER nullTreatmentOrders
BEFORE INSERT ON arearet.ar_cleanup_encomendas FOR EACH ROW
BEGIN

    IF(NEW.dataPagamento IS NULL)
	THEN SET NEW.dataPagamento = 0;
    END IF;

    IF(NEW.dataEnvio IS NULL)
	THEN SET NEW.dataEnvio = 0;
    END IF;
    
    IF(NEW.expedidor IS NULL)
	THEN SET NEW.expedidor = 0;
    END IF;
/*
	CASE
    
    WHEN(NEW.dataPagamento IS NULL)
	THEN SET NEW.dataPagamento = 0;
    
	WHEN(NEW.dataEnvio IS NULL)
	THEN SET NEW.dataEnvio = 0;

	WHEN(NEW.expedidor IS NULL)
	THEN SET NEW.expedidor = 0;
    
    END CASE;
*/
END;
//

-- ------------------------------------------------------------
-- INSERT INTO ar_cleanup_data VALUES (0, 'desconhecido', 'desconhecido', 'desconhecido', 'desconhecido', 'desconhecido', 'desconhecido', 'desconhecido');

-- INSERT INTO ar_cleanup_expedidor VALUES (0,'desconhecido'); 

