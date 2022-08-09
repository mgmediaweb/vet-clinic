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
