# Vet Clinic Database

> In this exercise I was working on creating the table and the necessary queries to insert and list the results on the screen.

## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. 

## Getting Started

Query required:

- [x] Find all animals whose name ends in "mon".
```
SELECT * FROM animals WHERE name LIKE '%mon';
```
![image](https://user-images.githubusercontent.com/41912912/183305698-a61455eb-491b-4439-ba3b-a0b02c60d23c.png)


- [x] List the name of all animals born between 2016 and 2019.
```
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
```
![image](https://user-images.githubusercontent.com/41912912/183305732-9cb9dff0-5bb7-4146-9210-72ae10e61726.png)


- [x] List the name of all animals that are neutered and have less than 3 escape attempts.
```
SELECT name FROM animals WHERE escape_attempts < 3 AND neutered = 1;
```
![image](https://user-images.githubusercontent.com/41912912/183305773-e2cc08a2-e98f-4fcc-a051-4b11d5fbd1ff.png)


- [x] List the date of birth of all animals named either "Agumon" or "Pikachu".
```
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
```
![image](https://user-images.githubusercontent.com/41912912/183305898-9df01cf9-88d3-490a-aa34-4b7bf8e1e65d.png)


- [x] List name and escape attempts of animals that weigh more than 10.5kg
```
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
```
![image](https://user-images.githubusercontent.com/41912912/183305963-28526c51-280e-43bb-b7ab-d23eaf57d320.png)


- [x] Find all animals that are neutered.
```
SELECT * FROM animals WHERE neutered = 1;
```
![image](https://user-images.githubusercontent.com/41912912/183306067-77a5b392-9368-4f2f-aa08-73ef73f4cd82.png)


- [x] Find all animals not named Gabumon.
```
SELECT * FROM animals WHERE name != 'Gabumon';
```
![image](https://user-images.githubusercontent.com/41912912/183306133-a3b19cc1-c582-4c61-a6d8-16ca96070ebc.png)


- [x] Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
```
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
```
![image](https://user-images.githubusercontent.com/41912912/183306190-4112db27-e22e-4d81-8bc1-ff1af4e6171b.png)


## Authors

👤 **Gonzalo A. Medina**

- GitHub: [@mgmediaweb](https://github.com/mgmediaweb)
- Twitter: [@GonzoMedinaDev](https://twitter.com/GonzoMedinaDev)
- LinkedIn: [gonzalo-medina-g](https://www.linkedin.com/in/gonzalo-medina-g/)

👤 **Oyelakin Ridwan Adio**

**Oyelakin Ridwan Adio**
- GitHub: [@oyelakin](https://github.com/oyelakinG9)
- Twitter: [@oyelakin](https://twitter.com/OyelakinG1)
- LinkedIn: [@oyelakin](https://www.linkedin.com/in/oyelakin-ridwan-4b4a02b6/)

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
