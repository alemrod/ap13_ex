-- CREATE TABLE tb_aluno(
-- 	cod_id SERIAL PRIMARY KEY,
-- 	Age INT,
-- 	Gender INT,
-- 	Salary INT,
-- 	Prep_exam INT,
-- 	notes INT,
-- 	grade INT
-- );

-- 1.4 Escreva os seguintes stored procedures (incluindo um bloco anônimo de teste para cada
--um):
-- 1.4.1 Exibe o número de estudantes maiores de idade.
-- 1.4.2 Exibe o percentual de estudantes de cada sexo.
-- 1.4.3 Recebe um sexo como parâmetro em modo IN e utiliza oito parâmetros em modo OUT
-- para dizer qual o percentual de cada nota (variável grade) obtida por estudantes daquele
-- sexo.

--1.4
-- CREATE OR REPLACE PROCEDURE sp_maior_de_idade(
-- 	 OUT cont INT
-- ) LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	SELECT COUNT(*)
-- 	INTO cont
-- 	FROM tb_aluno
-- 	WHERE Age > 1;
-- END;
-- $$

-- DO $$
-- DECLARE
-- cont INT;
-- BEGIN
-- 	CALL sp_maior_de_idade(cont);
-- 	RAISE NOTICE 'o número de alunos maiores de idade são : %', cont;
-- END;
-- $$

-- DROP PROCEDURE sp_cont_genero;

-- --1.4
-- CREATE OR REPLACE PROCEDURE sp_cont_genero(
-- 	OUT masc DECIMAL(10,2),
-- 	OUT fem  DECIMAL(10,2)
-- ) LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	SELECT COUNT(*)
-- 	INTO cont
-- 	INTO masc
-- 	FROM tb_aluno
-- 	WHERE Age > 1;
-- END;
-- 	WHERE Gender = 2;
-- 	SELECT COUNT(*)
-- 	INTO fem
-- 	FROM tb_aluno
-- 	WHERE Gender = 1;
-- 	masc := (masc / 146) * 100;
-- 	fem := (fem / 146) * 100;
-- 	END; 
-- $$

	
-- DO $$
-- DECLARE
-- cont INT;
-- 	 masc DECIMAL(10,2);
-- 	 fem  DECIMAL(10,2);
-- BEGIN
-- 	CALL sp_maior_de_idade(cont);
-- 	RAISE NOTICE 'o número de alunos maiores de idade são : %', cont;
-- 	CALL sp_cont_genero(fem, masc);
-- 	RAISE NOTICE 'o percentual femenino é % e o masculino %', fem, masc;
-- END;
-- $$
-- -- 1.4 Recebe um sexo como parâmetro em modo IN e utiliza oito parâmetros em modo OUT
-- -- para dizer qual o percentual de cada nota (variável grade) obtida por estudantes daquele
-- -- sexo.
-- -- 0: Fail, 1: DD, 2: DC, 3: CC, 4: CB, 5: BB, 6: BA, 7: AA)

-- CREATE OR REPLACE PROCEDURE sp_nota(
--     IN genero INT,
--     OUT Fail NUMERIC(10,2),
--     OUT DD NUMERIC(10,2),
--     OUT DC NUMERIC(10,2),
--     OUT CC NUMERIC(10,2),
--     OUT CB NUMERIC(10,2),
--     OUT BB NUMERIC(10,2),
--     OUT BA NUMERIC(10,2),
--     OUT AA NUMERIC(10,2)
-- ) LANGUAGE plpgsql
-- AS $$
-- DECLARE
-- BEGIN	
--         SELECT COUNT(*)
-- 		INTO Fail
-- 		FROM tb_aluno
-- 	    WHERE grade = 0 and Gender = genero;
-- 		Fail := (Fail / 146) * 100; 
-- 		SELECT COUNT (*) 
-- 		INTO DD
-- 		FROM tb_aluno
-- 		WHERE grade = 1 and tb_aluno.Gender = genero;
-- 			DD := (DD /146) * 100;
-- 		SELECT COUNT (*) 
-- 		INTO DC
-- 		FROM tb_aluno
-- 		WHERE grade = 2 and tb_aluno.Gender = genero;
-- 			DC := (DC / 146) * 100;
-- 		SELECT COUNT (*) 
-- 		INTO CC
-- 		FROM tb_aluno
-- 		WHERE grade = 3 and tb_aluno.Gender = genero;
-- 			CC := (CC /146) * 100;
-- 		SELECT COUNT (*) 
-- 		INTO CB
-- 		FROM tb_aluno
-- 		WHERE grade = 4 and tb_aluno.Gender = genero;
-- 			CB := (CB /146) * 100;
-- 		SELECT COUNT (*) 
-- 		INTO BB
-- 		FROM tb_aluno
-- 		WHERE grade = 5 and tb_aluno.Gender = genero;
-- 			BB := (BB / 146) * 100;
-- 		SELECT COUNT (*) 
-- 		INTO BA
-- 		FROM tb_aluno
-- 		WHERE grade = 6 and tb_aluno.Gender = genero;
-- 			BA := (BA /146) * 100;
-- 		SELECT COUNT (*) 
-- 		INTO AA
-- 		FROM tb_aluno
-- 		WHERE grade = 7 and tb_aluno.Gender = genero;
-- 			AA := (AA / 146) * 100;
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	genero INT;
--     Fail NUMERIC(10,2);
--     DD NUMERIC(10,2);
--     DC NUMERIC(10,2);
--     CC NUMERIC(10,2);
--     CB NUMERIC(10,2);
--     BB NUMERIC(10,2);
--     BA NUMERIC(10,2);
--     AA NUMERIC(10,2);
-- BEGIN
--     CALL sp_nota(1, Fail, DD, DC, CC, CB, BB, BA, AA);
-- 	IF genero = 1 THEN
--     	RAISE NOTICE 'Percentual de notas para alunos do sexo masculino:';
--     	RAISE NOTICE 'Fail: %', Fail;
--     	RAISE NOTICE 'DD: %', DD;
--     	RAISE NOTICE 'DC: %', DC;
--     	RAISE NOTICE 'CC: %', CC;
--     	RAISE NOTICE 'CB: %', CB;
--     	RAISE NOTICE 'BB: %', BB;
--     	RAISE NOTICE 'BA: %', BA;
--     	RAISE NOTICE 'AA: %', AA;
-- 	ELSE
-- 		RAISE NOTICE 'Percentual de notas para alunos do sexo feminino:';
--     	RAISE NOTICE 'Fail: %', Fail;
--     	RAISE NOTICE 'DD: %', DD;
--     	RAISE NOTICE 'DC: %', DC;
--     	RAISE NOTICE 'CC: %', CC;
--     	RAISE NOTICE 'CB: %', CB;
--     	RAISE NOTICE 'BB: %', BB;
--     	RAISE NOTICE 'BA: %', BA;
--     	RAISE NOTICE 'AA: %', AA;
-- 	END IF;
-- END $$;

CALL sp_nota(1, Fail, DD, DC, CC, CB, BB, BA, AA);
	IF genero = 1 THEN
    	RAISE NOTICE 'Percentual de notas para alunos do sexo masculino:';
    	RAISE NOTICE 'Fail: %', Fail;
    	RAISE NOTICE 'DD: %', DD;
    	RAISE NOTICE 'DC: %', DC;
    	RAISE NOTICE 'CC: %', CC;
    	RAISE NOTICE 'CB: %', CB;
    	RAISE NOTICE 'BB: %', BB;
    	RAISE NOTICE 'BA: %', BA;
    	RAISE NOTICE 'AA: %', AA;

	ELSE
		RAISE NOTICE 'Percentual de notas para alunos do sexo feminino:';
    	RAISE NOTICE 'Fail: %', Fail;
    	RAISE NOTICE 'DD: %', DD;
    	RAISE NOTICE 'DC: %', DC;
    	RAISE NOTICE 'CC: %', CC;
    	RAISE NOTICE 'CB: %', CB;
    	RAISE NOTICE 'BB: %', BB;
    	RAISE NOTICE 'BA: %', BA;
    	RAISE NOTICE 'AA: %', AA;
	END IF;

	RAISE NOTICE 'Fail: %', Fail;
    RAISE NOTICE 'DD: %', DD;
    RAISE NOTICE 'DC: %', DC;
    RAISE NOTICE 'CC: %', CC;
    RAISE NOTICE 'CB: %', CB;
    RAISE NOTICE 'BB: %', BB;
    RAISE NOTICE 'BA: %', BA;
    RAISE NOTICE 'AA: %', AA;
END $$;


-- 1.5 Escreva as seguintes functions (incluindo um bloco anônimo de teste para cada uma):
-- 1.5.1 Responde (devolve boolean) se é verdade que todos os estudantes de renda acima de
-- 410 são aprovados (grade > 0).
CREATE OR REPLACE FUNCTION sp_renda() RETURNS BOOLEAN 
AS $$
DECLARE
	resultado BOOLEAN;
BEGIN
	SELECT NOT EXISTS (
	SELECT 1
	FROM tb_aluno
	WHERE Salary = 5 and grade = 0
	) INTO resultado;

	RETURN resultado;
END;
$$ LANGUAGE plpgsql;

DO $$
DECLARE 
	renda_aprovada BOOLEAN;
BEGIN
  renda_aprovada := sp_renda();
  IF renda_aprovada THEN
        RAISE NOTICE 'Todos os estudantes com renda acima de 410 são aprovados.';
    ELSE
        RAISE NOTICE 'Nem todos os estudantes com renda acima de 410 são aprovados.';
    END IF;
END $$;
END;
