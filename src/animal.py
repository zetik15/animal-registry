from datetime import datetime
from abc import ABC, abstractmethod

class Animal(ABC):
    """Базовый абстрактный класс для всех животных"""
    
    def __init__(self, name, birth_date):
        self.name = name
        self.birth_date = birth_date
        self.commands = []
    
    def add_command(self, command):
        """Добавить команду, которую выполняет животное"""
        if command not in self.commands:
            self.commands.append(command)
            print(f"{self.name} теперь знает команду: {command}")
        else:
            print(f"{self.name} уже знает команду: {command}")
    
    def list_commands(self):
        """Вывести список команд, которые знает животное"""
        if not self.commands:
            print(f"{self.name} не знает никаких команд")
        else:
            print(f"Команды, которые знает {self.name}:")
            for cmd in self.commands:
                print(f"- {cmd}")
    
    def get_age(self):
        """Получить возраст животного в месяцах"""
        birth_date = datetime.strptime(self.birth_date, "%Y-%m-%d")
        today = datetime.now()
        age_in_days = (today - birth_date).days
        return age_in_days // 30  # Примерное количество месяцев
    
    @abstractmethod
    def make_sound(self):
        """Абстрактный метод - издать звук, характерный для животного"""
        pass


class DomesticAnimal(Animal):
    """Класс для домашних животных"""
    
    def __init__(self, name, birth_date, animal_kind):
        super().__init__(name, birth_date)
        self.animal_kind = animal_kind
        self.animal_type = "Домашнее"


class PackAnimal(Animal):
    """Класс для вьючных животных"""
    
    def __init__(self, name, birth_date, animal_kind):
        super().__init__(name, birth_date)
        self.animal_kind = animal_kind
        self.animal_type = "Вьючное"


class Dog(DomesticAnimal):
    """Класс для собак"""
    
    def __init__(self, name, birth_date, breed="Дворняжка"):
        super().__init__(name, birth_date, "Собака")
        self.breed = breed
    
    def make_sound(self):
        return "Гав!"


class Cat(DomesticAnimal):
    """Класс для кошек"""
    
    def __init__(self, name, birth_date, breed="Дворняжка"):
        super().__init__(name, birth_date, "Кошка")
        self.breed = breed
    
    def make_sound(self):
        return "Мяу!"


class Hamster(DomesticAnimal):
    """Класс для хомяков"""
    
    def __init__(self, name, birth_date, color="Рыжий"):
        super().__init__(name, birth_date, "Хомяк")
        self.color = color
    
    def make_sound(self):
        return "Пи-пи!"


class Horse(PackAnimal):
    """Класс для лошадей"""
    
    def __init__(self, name, birth_date, breed="Обычная"):
        super().__init__(name, birth_date, "Лошадь")
        self.breed = breed
    
    def make_sound(self):
        return "Иго-го!"


class Camel(PackAnimal):
    """Класс для верблюдов"""
    
    def __init__(self, name, birth_date, humps=2):
        super().__init__(name, birth_date, "Верблюд")
        self.humps = humps
    
    def make_sound(self):
        return "Хрум-хрум!"


class Donkey(PackAnimal):
    """Класс для ослов"""
    
    def __init__(self, name, birth_date, stubbornness_level=5):
        super().__init__(name, birth_date, "Осел")
        self.stubbornness_level = stubbornness_level
    
    def make_sound(self):
        return "Иа-иа!"
