// article4.1_task23.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №23. Демонстрация проблемы, возможной при передаче объектов функциям
#include <iostream>
#include <windows.h>
using namespace std;

class String {
	char* ptr;
	int size;
public:
	String(int size, const char* symbols);
	~String();
	int getBegin() { return *ptr; }
	int getSize() { return size; }
	char* getString() { return ptr; };
};

String::String(int size, const char* symbols) {
	this->size = size;
	cout << "Выделение памяти, адресуемой указателем ptr.\n";
	ptr = new char[size + 1];
	strcpy_s(ptr, size, symbols);
}

String::~String() {
	cout << "Освобождение памяти, адресуемой указателем ptr.\n";
	delete ptr;
}
// При выполнении этой функции и возникает проблема
void display(String ob) {
	cout << "Строка, которая содержится в объекте: "<< ob.getString() << endl; }

int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	String line1(100, "Первая строка");
	display(line1);
	strcpy_s(line1.getString(), line1.getSize(), "Вторая строка");
	cout << "Строка, которая содержится в объекте: " << line1.getString() << endl;
	return 0;
	}