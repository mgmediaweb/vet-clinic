# Vet Clinic Database

> This template should be used for database related projects at Microverse.
> Generate your own repository, update this README and edit all files content while working on projects. You should not be adding any new files unless asked otherwise.

## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. 

## Getting Started

Query required:

- [x] Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';

- [x] List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

- [x] List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE escape_attempts < 3 AND neutered = 1;

- [x] List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';

- [x] List name and escape attempts of animals that weigh more than 10.5kg
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;

- [x] Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = 1;

- [x] Find all animals not named Gabumon.
SELECT * FROM animals WHERE name != 'Gabumon';

- [x] Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

## Authors

👤 **Gonzalo A. Medina**

- GitHub: [@mgmediaweb](https://github.com/mgmediaweb)
- Twitter: [@GonzoMedinaDev](https://twitter.com/GonzoMedinaDev)
- LinkedIn: [gonzalo-medina-g](https://www.linkedin.com/in/gonzalo-medina-g/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.
