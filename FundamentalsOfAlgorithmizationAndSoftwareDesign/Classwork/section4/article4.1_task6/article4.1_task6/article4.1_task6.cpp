// article4.1_task6.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №6. Использование альтернативного синтаксиса инициализации объекта при использовании конструктора с одним параметром
#include <iostream>
#include <string>
#include <windows.h>
using namespace std;
class Student {
	string name;
public:
	Student(string name);
	string getName();
};
Student::Student(string name) { this->name = name; }
string Student::getName() { return name; }
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	std::string studentName = "Анастасия";
	Student obFirst = studentName;//вызов метода Student("Анастасия")
	studentName = "Ангелина";
	Student obSecond = studentName;//вызов метода Student("Ангелина")
	studentName = "Александра";
	Student obThird = studentName;//вызов метода Student("Александра")
	cout << obFirst.getName() << endl;
	cout << obSecond.getName() << endl;
	cout << obThird.getName() << endl;
	return 0;
}