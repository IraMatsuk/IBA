// article4.1_task27.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №27. Использование конструктора копии для определения параметра функции
#include <iostream>
#include <string>
#include <windows.h>
using namespace std;

class Account {
	int* data;
public:
	Account(int data);//обычный конструктор
	Account(const Account& ob);//конструктор копии
	~Account();
	int getData() { return *data; }
};

//Конструктор копии
Account::Account(const Account &obj) {
	data = new int[10];
	*data = *obj.data; // значение копии
	cout << "Вызван конструктор копии.\n";
}

// Обычный конструктор
Account::Account(int data) {
	cout << "Выделение памяти, адресуемой указателем data.\n";
	this->data = new int[10];
	*(this->data) = data;
}
Account::~Account() {
	cout << "Освобождение памяти, адресуемой указателем data.\n";
	delete data;
}
// Эта функция принимает один объект-параметр
void display(Account ob) {
	cout << "Содержимое счета:" <<
		ob.getData() << endl;
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Account firstAccount(10);
	display(firstAccount);
	return 0;
}