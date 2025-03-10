-- Заполнение таблиц данными
USE human_friends;

-- Добавление животных
-- Собаки
INSERT INTO animals (name, birth_date, animal_type) VALUES ('Рекс', '2020-01-15', 'Домашнее');
INSERT INTO domestic_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Собака');
INSERT INTO dogs (domestic_animal_id, breed) VALUES (LAST_INSERT_ID(), 'Немецкая овчарка');
INSERT INTO commands (animal_id, command_name) VALUES (1, 'Сидеть');
INSERT INTO commands (animal_id, command_name) VALUES (1, 'Лежать');
INSERT INTO commands (animal_id, command_name) VALUES (1, 'Голос');

INSERT INTO animals (name, birth_date, animal_type) VALUES ('Бобик', '2021-05-10', 'Домашнее');
INSERT INTO domestic_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Собака');
INSERT INTO dogs (domestic_animal_id, breed) VALUES (LAST_INSERT_ID(), 'Дворняжка');
INSERT INTO commands (animal_id, command_name) VALUES (2, 'Сидеть');
INSERT INTO commands (animal_id, command_name) VALUES (2, 'Дай лапу');

-- Кошки
INSERT INTO animals (name, birth_date, animal_type) VALUES ('Мурка', '2019-03-20', 'Домашнее');
INSERT INTO domestic_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Кошка');
INSERT INTO cats (domestic_animal_id, breed) VALUES (LAST_INSERT_ID(), 'Сиамская');
INSERT INTO commands (animal_id, command_name) VALUES (3, 'Кис-кис');

INSERT INTO animals (name, birth_date, animal_type) VALUES ('Барсик', '2022-02-28', 'Домашнее');
INSERT INTO domestic_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Кошка');
INSERT INTO cats (domestic_animal_id, breed) VALUES (LAST_INSERT_ID(), 'Персидская');
INSERT INTO commands (animal_id, command_name) VALUES (4, 'Кис-кис');
INSERT INTO commands (animal_id, command_name) VALUES (4, 'Ко мне');

-- Хомяки
INSERT INTO animals (name, birth_date, animal_type) VALUES ('Хома', '2023-01-05', 'Домашнее');
INSERT INTO domestic_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Хомяк');
INSERT INTO hamsters (domestic_animal_id, color) VALUES (LAST_INSERT_ID(), 'Рыжий');

INSERT INTO animals (name, birth_date, animal_type) VALUES ('Пушок', '2023-06-15', 'Домашнее');
INSERT INTO domestic_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Хомяк');
INSERT INTO hamsters (domestic_animal_id, color) VALUES (LAST_INSERT_ID(), 'Серый');

-- Лошади
INSERT INTO animals (name, birth_date, animal_type) VALUES ('Буцефал', '2018-07-12', 'Вьючное');
INSERT INTO pack_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Лошадь');
INSERT INTO horses (pack_animal_id, breed) VALUES (LAST_INSERT_ID(), 'Арабская');
INSERT INTO commands (animal_id, command_name) VALUES (7, 'Галоп');
INSERT INTO commands (animal_id, command_name) VALUES (7, 'Стой');

INSERT INTO animals (name, birth_date, animal_type) VALUES ('Молния', '2019-11-30', 'Вьючное');
INSERT INTO pack_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Лошадь');
INSERT INTO horses (pack_animal_id, breed) VALUES (LAST_INSERT_ID(), 'Мустанг');
INSERT INTO commands (animal_id, command_name) VALUES (8, 'Рысь');
INSERT INTO commands (animal_id, command_name) VALUES (8, 'Шагом');

-- Верблюды
INSERT INTO animals (name, birth_date, animal_type) VALUES ('Горбун', '2017-04-10', 'Вьючное');
INSERT INTO pack_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Верблюд');
INSERT INTO camels (pack_animal_id, humps) VALUES (LAST_INSERT_ID(), 2);
INSERT INTO commands (animal_id, command_name) VALUES (9, 'Стой');
INSERT INTO commands (animal_id, command_name) VALUES (9, 'Сесть');

INSERT INTO animals (name, birth_date, animal_type) VALUES ('Сахара', '2016-09-15', 'Вьючное');
INSERT INTO pack_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Верблюд');
INSERT INTO camels (pack_animal_id, humps) VALUES (LAST_INSERT_ID(), 1);
INSERT INTO commands (animal_id, command_name) VALUES (10, 'Стой');
INSERT INTO commands (animal_id, command_name) VALUES (10, 'Иди');

-- Ослы
INSERT INTO animals (name, birth_date, animal_type) VALUES ('Иа', '2020-12-25', 'Вьючное');
INSERT INTO pack_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Осел');
INSERT INTO donkeys (pack_animal_id, stubbornness_level) VALUES (LAST_INSERT_ID(), 8);
INSERT INTO commands (animal_id, command_name) VALUES (11, 'Вперед');

INSERT INTO animals (name, birth_date, animal_type) VALUES ('Упрямец', '2021-08-17', 'Вьючное');
INSERT INTO pack_animals (animal_id, animal_kind) VALUES (LAST_INSERT_ID(), 'Осел');
INSERT INTO donkeys (pack_animal_id, stubbornness_level) VALUES (LAST_INSERT_ID(), 10);
INSERT INTO commands (animal_id, command_name) VALUES (12, 'Стой');
INSERT INTO commands (animal_id, command_name) VALUES (12, 'Иди');
