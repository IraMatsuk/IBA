// article4.1_task21.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №21. Передача объектов функциям
#include <iostream>
#include <string>
#include <windows.h>
#include <iomanip>
using namespace std;
#define SIZE 5

class Employee {
private:
	string name;
	string position;
public:
	void setName(string);
	void setposition(string);
	string getName();
	string getPosition();
	// More attributes and operations
};
string Employee::getName() {
	return name;
}
string Employee::getPosition() {
	return position;
}
void Employee::setName(string name) {
	this->name = name;
}
void Employee::setposition(string position) {
	this->position = position;
}
void printInTable(Employee emp[]) { // массив объектов типа Employee, всегда передается по ссылке (т.е.меняется и оригинал)
	cout << "ИМЯ СОТРУДНИКА ----" << setw(32) << left << "------ЗАНИМАЕМАЯ ДОЛЖНОСТЬ" << endl;
		for (int i = 0; i < SIZE; i++) {
			cout << setw(32) << emp[i].getName() << emp[i].getPosition();  // выведет обычные имена и должности без new
			emp[i].setName(emp[i].getName() + "new"); 
			cout << endl;
		}
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Employee employees[SIZE];
	employees[0].setName("Аркадий");
	employees[0].setposition("Программист Swift");
	employees[1].setName("Геннадий");
	employees[1].setposition("Разработчик нейроинтерфейсов");
	employees[2].setName("Збигнев");
	employees[2].setposition("iOS-разработчик");
	employees[3].setName("Гжегош");
	employees[3].setposition("Android-разработчик");
	employees[4].setName("Агата");
	employees[4].setposition("Архитектор баз данных");
	printInTable(employees);
	cout << "---------------------------------------" << endl;
	for (int i = 0; i < SIZE; i++) {
		cout << employees[i].getName() << " ";
		cout << employees[i].getPosition();
		cout << endl;
	}
	return 0;
}