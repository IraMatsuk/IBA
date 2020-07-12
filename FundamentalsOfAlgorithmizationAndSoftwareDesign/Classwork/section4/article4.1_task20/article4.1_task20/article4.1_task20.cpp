// article4.1_task20.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №20. Демонстрация присваивания объектов
#include <iostream>
#include <windows.h>
using namespace std;
class Person {
	int age;
	float salary;
public:
	void setAge(int age) { 
		this->age = age; 
	}
	void setSalary(float salary) { 
		this->salary = salary; 
	}
	void showAge();
	void showSalary();
};
void Person::showAge() {
	cout << "Возраст равен " << age << '\n';
}
void Person::showSalary() {
	cout << "Зарплата равна " << salary << '\n';
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Person person1, person2;
	person1.setAge(23);
	person1.setSalary(10000);
	person2.setAge(35);
	person2.setSalary(20000.20f);
	cout << "Объект person1 до присваивания: \n";
	person1.showAge();
	person1.showSalary();
	cout << "Объект person2 до присваивания: \n";
	person2.showAge();
	person2.showSalary();
	cout << endl;
	person2 = person1; // Присваиваем объект person1 объекту person2
	cout << "Объект person1 после присваивания: \n";
	person1.showAge();
	person1.showSalary();
	cout << "Объект person2 после присваивания: \n";
	person2.showAge();
	person2.showSalary();
	return 0;
}