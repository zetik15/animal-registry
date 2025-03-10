-- Создание базы данных "Друзья человека"
CREATE DATABASE IF NOT EXISTS human_friends;
USE human_friends;

-- Создание таблицы для родительского класса "Животные"
CREATE TABLE animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    animal_type VARCHAR(20) NOT NULL
);

-- Создание таблицы для класса "Домашние животные"
CREATE TABLE domestic_animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    animal_kind VARCHAR(20) NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE
);

-- Создание таблицы для класса "Вьючные животные"
CREATE TABLE pack_animals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    animal_kind VARCHAR(20) NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE
);

-- Создание таблицы для класса "Собаки"
CREATE TABLE dogs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    domestic_animal_id INT,
    breed VARCHAR(50),
    FOREIGN KEY (domestic_animal_id) REFERENCES domestic_animals(id) ON DELETE CASCADE
);

-- Создание таблицы для класса "Кошки"
CREATE TABLE cats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    domestic_animal_id INT,
    breed VARCHAR(50),
    FOREIGN KEY (domestic_animal_id) REFERENCES domestic_animals(id) ON DELETE CASCADE
);

-- Создание таблицы для класса "Хомяки"
CREATE TABLE hamsters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    domestic_animal_id INT,
    color VARCHAR(20),
    FOREIGN KEY (domestic_animal_id) REFERENCES domestic_animals(id) ON DELETE CASCADE
);

-- Создание таблицы для класса "Лошади"
CREATE TABLE horses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pack_animal_id INT,
    breed VARCHAR(50),
    FOREIGN KEY (pack_animal_id) REFERENCES pack_animals(id) ON DELETE CASCADE
);

-- Создание таблицы для класса "Верблюды"
CREATE TABLE camels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pack_animal_id INT,
    humps INT,
    FOREIGN KEY (pack_animal_id) REFERENCES pack_animals(id) ON DELETE CASCADE
);

-- Создание таблицы для класса "Ослы"
CREATE TABLE donkeys (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pack_animal_id INT,
    stubbornness_level INT,
    FOREIGN KEY (pack_animal_id) REFERENCES pack_animals(id) ON DELETE CASCADE
);

-- Создание таблицы для команд животных
CREATE TABLE commands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    command_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES animals(id) ON DELETE CASCADE
);
