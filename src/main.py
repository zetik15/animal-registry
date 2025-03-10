from registry import AnimalRegistry

def print_menu():
    """Вывести меню программы"""
    print("\n=== РЕЕСТР ДОМАШНИХ ЖИВОТНЫХ ===")
    print("1. Завести новое животное")
    print("2. Показать список всех животных")
    print("3. Обучить животное новой команде")
    print("4. Показать список команд животного")
    print("5. Выход")
    print("================================")


def add_animal_menu(registry):
    """Меню добавления нового животного"""
    print("\n=== ДОБАВЛЕНИЕ НОВОГО ЖИВОТНОГО ===")
    print("Выберите тип животного:")
    print("1. Собака")
    print("2. Кошка")
    print("3. Хомяк")
    print("4. Лошадь")
    print("5. Верблюд")
    print("6. Осел")
    print("7. Отмена")
    
    choice = input("Ваш выбор: ")
    
    if choice == "7":
        return
    
    animal_types = {
        "1": "dog",
        "2": "cat",
        "3": "hamster",
        "4": "horse",
        "5": "camel",
        "6": "donkey"
    }
    
    if choice not in animal_types:
        print("Неверный выбор")
        return
    
    animal_type = animal_types[choice]
    name = input("Введите имя животного: ")
    birth_date = input("Введите дату рождения (ГГГГ-ММ-ДД): ")
    
    # Дополнительные параметры в зависимости от типа животного
    kwargs = {}
    if animal_type in ["dog", "cat", "horse"]:
        kwargs["breed"] = input("Введите породу: ")
    elif animal_type == "hamster":
        kwargs["color"] = input("Введите цвет: ")
    elif animal_type == "camel":
        try:
            kwargs["humps"] = int(input("Введите количество горбов: "))
        except ValueError:
            print("Неверное значение. Будет использовано значение по умолчанию.")
    elif animal_type == "donkey":
        try:
            kwargs["stubbornness_level"] = int(input("Введите уровень упрямства (1-10): "))
        except ValueError:
            print("Неверное значение. Будет использовано значение по умолчанию.")
    
    registry.add_animal(animal_type, name, birth_date, **kwargs)


def main():
    """Основная функция программы"""
    registry = AnimalRegistry()
    
    # Предварительное заполнение реестра для демонстрации
    registry.add_animal("dog", "Рекс", "2020-01-15", breed="Немецкая овчарка")
    registry.add_animal("cat", "Мурка", "2019-03-20", breed="Сиамская")
    registry.add_animal("hamster", "Хома", "2023-01-05", color="Рыжий")
    registry.add_animal("horse", "Буцефал", "2018-07-12", breed="Арабская")
    
    # Обучение животных командам
    registry.train_animal("Рекс", "Сидеть")
    registry.train_animal("Рекс", "Лежать")
    registry.train_animal("Мурка", "Кис-кис")
    registry.train_animal("Буцефал", "Галоп")
    
    while True:
        print_menu()
        choice = input("Выберите пункт меню: ")
        
        if choice == "1":
            add_animal_menu(registry)
        elif choice == "2":
            registry.list_animals()
        elif choice == "3":
            name = input("Введите имя животного: ")
            command = input("Введите команду для обучения: ")
            registry.train_animal(name, command)
        elif choice == "4":
            name = input("Введите имя животного: ")
            registry.show_commands(name)
        elif choice == "5":
            print("Спасибо за использование программы!")
            print(f"Всего добавлено животных: {registry.get_animal_count()}")
            break
        else:
            print("Неверный выбор. Пожалуйста, выберите пункт из меню.")


if __name__ == "__main__":
    main()
