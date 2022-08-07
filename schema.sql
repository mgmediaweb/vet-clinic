/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(5,3),
    PRIMARY KEY (id)
);
