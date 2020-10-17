class Automobile {
    constructor (color, model, year, manufact) {
        this.color = color;
        this.model = model;
        this.year = year;
        this.manufact = manufact;
        this.whatColor = function whatColor() {
            document.write('Цвет' + this.color);
        }
        this.autoInfo  = function autoInfo () {
            document.write('Модель ' + this.model + ' Год выпуска ' + this.year +  ' Производитель автомобиля ' + this.manufact);
        }
    }
}

auto1 = new Automobile('Красный', 'Nissan Skyline', 2007);
auto1.whatColor();
auto1.autoInfo();

auto2 = new Automobile('Черный', 'Toyota Corolla', 2009);
auto2.whatColor();
auto2.autoInfo();

auto3 = new Automobile('Синий', 'Volkswagen Golf', 2009);
auto3.whatColor();
auto3.autoInfo();

class Driver extends Automobile {
    constructor(name, experience, color, model, year, manufact){
        super(color, model, year, manufact);
        this.name = name;
        this.experience = experience;
        this.driverInfo = function driverInfo() {
            document.write('Имя водителя ' + this.name + ' Стаж ' + this.experience);
        }
    }
}

driver1 = new Driver('Дмитрий', 3, 'Белый', 'Ford Focus', 2010);
driver1.whatColor();
driver1.autoInfo();
driver1.driverInfo();
