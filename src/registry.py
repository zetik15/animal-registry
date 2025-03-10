from animal import Dog, Cat, Hamster, Horse, Camel, Donkey
import datetime

class Counter:
    """Класс Счетчик для подсчета добавленных животных"""
    
    def __init__(self):
        self.count = 0
        self.is_open = True
    
    def add(self):
        """Увеличить счетчик на 1"""
        if not self.is_open:
            raise ValueError("Счетчик закрыт")
        self.count += 1
        return self.count
    
    def __enter__(self):
        """Метод для работы с контекстным менеджером (try-with-resources)"""
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        """Метод для закрытия ресурса при выходе из блока try"""
        self.is_open = False
        return False  # Не подавлять исключения


class AnimalRegistry:
    """Класс реестра домашних животных"""
    
    def __init__(self):
        self.animals = []
        self.counter = Counter()
    
    def add_animal(self, animal_type, name, birth_date, **kwargs):
        """Добавить новое животное в реестр"""
        try:
            with self.counter as counter:
                # Проверка на заполнение всех полей
                if not name or not birth_date:
                    raise ValueError("Необходимо заполнить все поля")
                
                # Проверка формата даты
                try:
                    datetime.datetime.strptime(birth_date, "%Y-%m-%d")
                except ValueError:
                    raise ValueError("Неверный формат даты. Используйте YYYY-MM-DD")
                
                # Создание животного соответствующего типа
                if animal_type == "dog":
                    animal = Dog(name, birth_date, **kwargs)
                elif animal_type == "cat":
                    animal = Cat(name, birth_date, **kwargs)
                elif animal_type == "hamster":
                    animal = Hamster(name, birth_date, **kwargs)
                elif animal_type == "horse":
                    animal = Horse(name, birth_date, **kwargs)
                elif animal_type == "camel":
                    animal = Camel(name, birth_date, **kwargs)
                elif animal_type == "donkey":
                    animal = Donkey(name, birth_date, **kwargs)
                else:
                    raise ValueError(f"Неизвестный тип животного: {animal_type}")
                
                # Добавление животного в реестр
                self.animals.append(animal)
                counter.add()  # Увеличиваем счетчик
                
                print(f"Животное {name} успешно добавлено в реестр")
                return animal
        except Exception as e:
            print(f"Ошибка при добавлении животного: {e}")
            return None
    
    def list_animals(self):
        """Вывести список всех животных в реестре"""
        if not self.animals:
            print("Реестр пуст")
            return
        
        print("Список животных в реестре:")
        for i, animal in enumerate(self.animals, 1):
            print(f"{i}. {animal.name} - {animal.animal_kind} ({animal.animal_type})")
    
    def find_animal(self, name):
        """Найти животное по имени"""
        for animal in self.animals:
            if animal.name.lower() == name.lower():
                return animal
        return None
    
    def train_animal(self, name, command):
        """Обучить животное новой команде"""
        animal = self.find_animal(name)
        if animal:
            animal.add_command(command)
        else:
            print(f"Животное с именем {name} не найдено")
    
    def show_commands(self, name):
        """Показать команды, которые знает животное"""
        animal = self.find_animal(name)
        if animal:
            animal.list_commands()
        else:
            print(f"Животное с именем {name} не найдено")
    
    def get_animal_count(self):
        """Получить количество животных в реестре"""
        return len(self.animals)
