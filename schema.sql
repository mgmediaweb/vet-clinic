CREATE TABLE animals (
    id SERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(5,3),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS animals
    ADD COLUMN species character(50);

/* QUERY MULTIPLES TABLES  */

CREATE TABLE owners (
    id SERIAL NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id SERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE animals 
    DROP COLUMN species;

ALTER TABLE animals
    ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals
    ADD COLUMN owner_id INT REFERENCES owners(id);
