-- On vous soumet une table brute aectations_brutes(employe_id,
-- employe_nom, dept_nom, projets_liste, chef_projet, chef_projet_tel).
-- Passez-la en 3FN en explicitant les dépendances fonctionnelles et les clés
-- primaires/étrangères.


CREATE TABLE departements (
    dept_id INT PRIMARY KEY,
    dept_nom VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE employes (
    employe_id INT PRIMARY KEY,
    employe_nom VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL REFERENCES departements(dept_id)
);

CREATE TABLE chefs_projet (
    chef_projet_id SERIAL PRIMARY KEY,
    chef_projet_nom VARCHAR(100) NOT NULL,
    chef_projet_tel VARCHAR(20)
);

CREATE TABLE projets (
    projet_id SERIAL PRIMARY KEY,
    projet_nom VARCHAR(100) NOT NULL UNIQUE,
    chef_projet_id INT NOT NULL REFERENCES chefs_projet(chef_projet_id)
);

CREATE TABLE affectations (
    employe_id INT REFERENCES employes(employe_id),
    projet_id INT REFERENCES projets(projet_id),
    PRIMARY KEY (employe_id, projet_id)
);

--employe_id -> employe_nom, dept_nom
--departement_id -> dept_nom
--projet_id -> projet_nom, chef_projet_id
--chef_projet_id -> chef_projet, chef_projet_tel

--chaque table a sa clé primaire (dept_id, employe_id, chef_id, projet_id).
--La table affectations a une clé primaire composée (employe_id, projet_id).
--Les clés étrangères relient les tables entre elles.