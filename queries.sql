SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE escape_attempts < 3 AND neutered = 1;

SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';

SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = 1;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* DAY 2 EXERCISE */

/* UPDATE SPECIES TO UNSPECIFIED */

BEGIN;

UPDATE animals
    SET species = 'unspecified'; 

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

/* UPDATE SPECIES TO DIGIMON OR POKEMON */

BEGIN;

UPDATE animals
	SET species='digimon'
	WHERE name LIKE '%mon';

UPDATE animals
	SET species='pokemon'
	WHERE species IS NULL;

COMMIT;

SELECT * FROM animals;

/* DELETE ALL DATA AND RECOVERY */

BEGIN;

TRUNCATE TABLE animals;

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

/* DELETE ANIMALS AFTER 2022-01-01 */

BEGIN;

DELETE FROM animals WHERE date_of_birth >= '2022-01-01'; 
SAVEPOINT delete_2022; 

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO delete_2022; 

UPDATE animals SET weight_kg = weight_kg * 1 WHERE weight_kg < 0;

COMMIT;

/* COUNT OF ANIMALS */

SELECT COUNT(*) AS COUNT_ANIMALS FROM animals;

/* COUNT OF ANIMALS WITHOUT INTENT OF ESCAPES */

SELECT COUNT(*) AS COUNT_QUIET_ANIMALS
    FROM animals
    WHERE escape_attempts = 0;

/* AVERAGE WHEIGHT OF ANIMALS*/

SELECT AVG(weight_kg) AS AVERAGE_WEIGHT 
    FROM animals;

/* NAME OF THE ANIMAL WITH MOST INTENT TO ESCAPE */

SELECT name, escape_attempts 
    FROM animals 
    ORDER BY escape_attempts DESC
    LIMIT 1;

/* MAXIMUN AND MINIMUM WEIGHT OF SPECIE */

SELECT species , MIN(weight_kg) as MIN_WEIGHT, MAX(weight_kg) AS MAX_WEIGHT 
    FROM animals 
    GROUP BY species;

/* AVERAGE INTENT OF ESCAPE BETWEEN '1990-01-01' AND '2000-12-31'  */

SELECT species, AVG(escape_attempts) as AVERAGE_ESCAPES
    FROM animals 
    WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' 
    GROUP BY species;
