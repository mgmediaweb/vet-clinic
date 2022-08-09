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
