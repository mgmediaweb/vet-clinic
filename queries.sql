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

/* What animals belong to Melody Pond */

SELECT
	a.name
    FROM animals a
    INNER JOIN owners o ON a.owner_id = o.id
    WHERE o.full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon) */

SELECT
	a.name
    FROM animals a
    INNER JOIN species s ON a.species_id = s.id
    WHERE s.name = 'Pokemon';

/* List all owners and their animals, remember to include those that don't own any animal. */

SELECT 
	o.full_name, STRING_AGG (a.name, ', ') as animals
    FROM owners o
    LEFT JOIN animals a ON o.id = a.owner_id
    GROUP BY o.full_name;    

/* How many animals are there per species? */

SELECT
	s.name, COUNT(a.name) AS count_species
    FROM animals a
    JOIN species s ON a.species_id = s.id
    GROUP BY s.name;

/* List all Digimon owned by Jennifer Orwell. */

SELECT
	a.name
    FROM animals a
    LEFT JOIN species s ON a.species_id = s.id
    LEFT JOIN owners o ON a.owner_id = o.id
    WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

/* List all animals owned by Dean Winchester that haven't tried to escape. */

SELECT
	a.name
    FROM animals a
    LEFT JOIN owners o ON a.owner_id = o.id
    WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

/* Who owns the most animals? */

SELECT
	o.full_name, COUNT(a.*) AS quantity
    FROM animals a
    LEFT JOIN owners o ON a.owner_id = o.id
    GROUP BY o.full_name
    ORDER BY quantity DESC
    LIMIT 1;

/* Who was the last animal seen by William Tatcher? */

SELECT
	a.name, v.visit
    FROM visits v
    JOIN animals a ON v.animal_id = a.id
    JOIN vets e ON v.vet_id = e.id
    WHERE e.name = 'William Tatcher'
    ORDER BY v.visit DESC
    LIMIT 1;

/* How many different animals did Stephanie Mendez see? */ 

SELECT
	COUNT(DISTINCT(v.*)) AS quantity
    FROM visits v
    JOIN vets e ON v.vet_id = e.id
    WHERE e.name = 'Stephanie Mendez';

/* List all vets and their specialties, including vets with no specialties. */

SELECT
	v.name AS vet, STRING_AGG(s.name, ', ') as specializations
    FROM vets v
    LEFT JOIN specializations z ON v.id = z.vet_id
    LEFT JOIN species s ON z.specie_id = s.id
    GROUP BY v.name;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */ 

SELECT
	a.name, v.visit
    FROM visits v
    JOIN animals a ON v.animal_id = a.id
    JOIN vets e ON v.vet_id = e.id
    WHERE e.name = 'Stephanie Mendez' AND v.visit BETWEEN '2020-04-01' AND '2020-08-30'
    ORDER BY v.visit DESC;

/* What animal has the most visits to vets? */

SELECT
	a.name, COUNT(v.*) AS visits
    FROM visits v
    JOIN animals a ON v.animal_id = a.id
    GROUP BY a.name
    ORDER BY visits DESC
    LIMIT 1;

/* Who was Maisy Smith's first visit? */    

SELECT
	a.name
    FROM visits v
    JOIN animals a ON v.animal_id = a.id
    JOIN vets e ON v.vet_id = e.id
    WHERE e.name = 'Maisy Smith'
    ORDER BY v.visit ASC
    LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit. */

SELECT
	a.name AS animal, 
    s.name AS specie, 
    e.name AS veterinary, 
    e.age, 
    e.date_of_graduation, 
    v.visit AS date
    FROM visits v
    JOIN animals a ON v.animal_id = a.id
    JOIN species s ON a.species_id = s.id
    JOIN vets e ON v.vet_id = e.id
    ORDER BY v.visit DESC
    LIMIT 1;

/* How many visits were with a vet that did not specialize in that animal's species? */    

SELECT COUNT(*) AS Qty
    FROM visits 
    INNER JOIN animals ON visits.animal_id = animals.id 
    INNER JOIN vets ON visits.vet_id = vets.id
    WHERE animals.species_id NOT IN (
        SELECT specie_id FROM specializations 
        WHERE vet_id = vets.id
    );
    
/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */

SELECT
    s.name AS specie
    FROM visits v
    JOIN animals a ON v.animal_id = a.id
    JOIN species s ON a.species_id = s.id
    JOIN vets e ON v.vet_id = e.id
    WHERE e.name = 'Maisy Smith'
    GROUP BY s.name
    ORDER BY COUNT(v.*) DESC
    LIMIT 1;

    /* performance audit */

    EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
    EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
    EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@gmail.com';
