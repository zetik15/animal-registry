-- Удаление верблюдов и объединение таблиц лошадей и ослов
USE human_friends;

-- 10. Удаление верблюдов
DELETE FROM pack_animals 
WHERE animal_kind = 'Верблюд';

-- Создание таблицы для объединения лошадей и ослов
CREATE TABLE horses_and_donkeys AS
SELECT h.id, pa.animal_id, pa.animal_kind, h.breed, NULL as stubbornness_level
FROM horses h
JOIN pack_animals pa ON h.pack_animal_id = pa.id
UNION
SELECT 1000 + d.id, pa.animal_id, pa.animal_kind, NULL as breed, d.stubbornness_level
FROM donkeys d
JOIN pack_animals pa ON d.pack_animal_id = pa.id;

-- 11. Создание таблицы молодых животных (от 1 до 3 лет)
CREATE TABLE young_animals AS
SELECT 
    a.id,
    a.name,
    a.birth_date,
    a.animal_type,
    TIMESTAMPDIFF(MONTH, a.birth_date, CURDATE()) AS age_in_months
FROM 
    animals a
WHERE 
    TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) BETWEEN 1 AND 3;

-- 12. Объединение всех таблиц в одну
CREATE TABLE all_animals AS
SELECT 
    a.id,
    a.name,
    a.birth_date,
    a.animal_type,
    CASE
        WHEN da.id IS NOT NULL THEN da.animal_kind
        WHEN pa.id IS NOT NULL THEN pa.animal_kind
        ELSE NULL
    END AS specific_type,
    CASE
        WHEN d.id IS NOT NULL THEN 'Собака'
        WHEN c.id IS NOT NULL THEN 'Кошка'
        WHEN hm.id IS NOT NULL THEN 'Хомяк'
        WHEN h.id IS NOT NULL THEN 'Лошадь'
        WHEN cm.id IS NOT NULL THEN 'Верблюд'
        WHEN dn.id IS NOT NULL THEN 'Осел'
        ELSE NULL
    END AS animal_subtype,
    GROUP_CONCAT(cmd.command_name SEPARATOR ', ') AS commands
FROM 
    animals a
LEFT JOIN domestic_animals da ON a.id = da.animal_id
LEFT JOIN pack_animals pa ON a.id = pa.animal_id
LEFT JOIN dogs d ON da.id = d.domestic_animal_id
LEFT JOIN cats c ON da.id = c.domestic_animal_id
LEFT JOIN hamsters hm ON da.id = hm.domestic_animal_id
LEFT JOIN horses h ON pa.id = h.pack_animal_id
LEFT JOIN camels cm ON pa.id = cm.pack_animal_id
LEFT JOIN donkeys dn ON pa.id = dn.pack_animal_id
LEFT JOIN commands cmd ON a.id = cmd.animal_id
GROUP BY a.id;
