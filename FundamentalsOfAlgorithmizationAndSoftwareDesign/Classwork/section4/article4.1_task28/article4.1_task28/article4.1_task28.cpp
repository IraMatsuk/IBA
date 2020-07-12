// article4.1_task28.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №28. Вызов конструктора копии для инициализации объекта
#include <iostream>
#include <string>
#include <windows.h>
using namespace std;

class Account {
	int* data;
public:
	Account(int data);//обычный конструктор
	Account(const Account& ob);//конструктор копии~MyClass();
	~Account();
	int getVal() { return *data; }
};

//Конструктор копии
Account::Account(const Account& ob) {
	data = new int;
	*data = *ob.data;//значение копии
	cout << "Выделение памяти конструктором копии.\n";
}

// Обычный конструктор
Account::Account(int data) {
	cout << "Выделение памяти обычным конструктором.\n";
	this->data = new int;
	*(this->data) = data;
}

Account::~Account() {
	cout << "Освобождение памяти.\n";
	delete data;
}

int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Account firstAccount(10);//Вызывается конструктор с параметрами
	Account secondAccount = firstAccount;//Вызывается конструктор копии
	return 0;
}