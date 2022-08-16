INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Agumon', '2020-02-03', 0, 0, 10.23
);

INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Gabumon', '2018-11-15', 2, 1, 8
);

INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Pikachu', '2021-01-07', 1, 0, 15.04
);

INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Devimon', '2017-05-12', 5, 1, 11
);

INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Charmander', '2020-02-08', 0, 0, -11
);

INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Plantmon', '2021-11-15', 2, 1, -5.7
);

INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Squirtle', '1993-04-02', 3, 0, -12.13
);

INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Angemon', '2005-06-12', 1, 1, -45
);

INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Boarmon', '2005-06-07', 7, 1, 20.4
);

INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Blossom', '1998-10-13', 3, 1, 17
);

INSERT INTO animals (
    name, date_of_birth, escape_attempts, neutered, weight_kg
) VALUES (
    'Ditto', '2022-05-14', 4, 1, 22
);

/* INSERT OWNERS INTO YOUR TABLE */

INSERT INTO owners (
    full_name, age
) VALUES (
    'Sam Smith', 34
);

INSERT INTO owners (
    full_name, age
) VALUES (
    'Jennifer Orwell', 19
);

INSERT INTO owners (
    full_name, age
) VALUES (
    'Bob', 45
);

INSERT INTO owners (
    full_name, age
) VALUES (
    'Melody Pond', 77
);

INSERT INTO owners (
    full_name, age
) VALUES (
    'Dean Winchester', 14
);

INSERT INTO owners (
    full_name, age
) VALUES (
    'Jodie Whittaker', 38
);

/* INSERT SPECIES INTO YOUR TABLE */

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

/* UPDATE ESPECIES ID */

UPDATE animals
	SET species_id=(SELECT id from species WHERE name = 'Digimon')
	WHERE name LIKE '%mon';

UPDATE animals
	SET species_id=(SELECT id from species WHERE name = 'Pokemon')
	WHERE name NOT LIKE '%mon'; 

/* UPDATE OWNER ID */

UPDATE animals
	SET owner_id=1
	WHERE name = 'Agumon';

UPDATE animals
	SET owner_id=2
	WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
	SET owner_id=3
	WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
	SET owner_id=4
	WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
	SET owner_id=5
	WHERE name IN ('Angemon', 'Boarmon');

/* QUERY JOIN TABLE  */

INSERT INTO vets (
    name, age, date_of_graduation
) VALUES (
    'William Tatcher', 45, '2000-04-23'
);

INSERT INTO vets (
    name, age, date_of_graduation
) VALUES (
    'Maisy Smith', 26, '2019-01-17'
);

INSERT INTO vets (
    name, age, date_of_graduation
) VALUES (
    'Stephanie Mendez', 64, '1981-05-04'
);

INSERT INTO vets (
    name, age, date_of_graduation
) VALUES (
    'Jack Harkness', 38, '2008-06-08'
);

/* INSERT SPECIALIZATION  */

INSERT INTO specializations (
    vet_id, specie_id
) SELECT v.id, s.id
    FROM species s
    INNER JOIN vets v ON v.name = 'William Tatcher' AND s.name = 'Pokemon';

INSERT INTO specializations (
    vet_id, specie_id
) SELECT v.id, s.id
    FROM species s
    INNER JOIN vets v ON v.name = 'Stephanie Mendez' AND s.name IN ('Digimon', 'Pokemon');

INSERT INTO specializations (
    vet_id, specie_id
) SELECT v.id, s.id
    FROM species s
    INNER JOIN vets v ON v.name = 'Jack Harkness' AND s.name = 'Digimon';    

/* INSERT VISITS  */  

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-05-24'
    FROM animals a
    INNER JOIN vets v ON v.name = 'William Tatcher' AND a.name = 'Agumon';

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-07-22'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Stephanie Mendez' AND a.name = 'Agumon';    

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2021-02-02'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Jack Harkness' AND a.name = 'Gabumon';    
   
INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-01-05'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Maisy Smith' AND a.name = 'Pikachu';   

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-03-08'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Maisy Smith' AND a.name = 'Pikachu'; 

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-05-14'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Maisy Smith' AND a.name = 'Pikachu'; 

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2021-05-04'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Stephanie Mendez' AND a.name = 'Devimon'; 

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2021-02-24'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Jack Harkness' AND a.name = 'Charmander';  

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2019-12-21'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Maisy Smith' AND a.name = 'Plantmon'; 

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-08-10'
    FROM animals a
    INNER JOIN vets v ON v.name = 'William Tatcher' AND a.name = 'Plantmon';

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2021-04-07'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Maisy Smith' AND a.name = 'Plantmon';    

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2019-09-29'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Stephanie Mendez' AND a.name = 'Squirtle'; 

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-10-03'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Jack Harkness' AND a.name = 'Angemon';      

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-11-04'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Jack Harkness' AND a.name = 'Angemon'; 

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2019-01-24'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Maisy Smith' AND a.name = 'Boarmon';

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2019-05-15'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Maisy Smith' AND a.name = 'Boarmon';  

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-02-27'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Maisy Smith' AND a.name = 'Boarmon';        

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-08-03'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Maisy Smith' AND a.name = 'Boarmon';

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2020-05-24'
    FROM animals a
    INNER JOIN vets v ON v.name = 'Stephanie Mendez' AND a.name = 'Blossom'; 

INSERT INTO visits (
    animal_id, vet_id, visit
) SELECT a.id, v.id, '2021-01-11'
    FROM animals a
    INNER JOIN vets v ON v.name = 'William Tatcher' AND a.name = 'Blossom';

/* Database performance audit */

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
