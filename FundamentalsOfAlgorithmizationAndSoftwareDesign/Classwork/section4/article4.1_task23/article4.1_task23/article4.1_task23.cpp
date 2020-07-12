// article4.1_task23.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �23. ������������ ��������, ��������� ��� �������� �������� ��������
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
	cout << "��������� ������, ���������� ���������� ptr.\n";
	ptr = new char[size + 1];
	strcpy_s(ptr, size, symbols);
}

String::~String() {
	cout << "������������ ������, ���������� ���������� ptr.\n";
	delete ptr;
}
// ��� ���������� ���� ������� � ��������� ��������
void display(String ob) {
	cout << "������, ������� ���������� � �������: "<< ob.getString() << endl; }

int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	String line1(100, "������ ������");
	display(line1);
	strcpy_s(line1.getString(), line1.getSize(), "������ ������");
	cout << "������, ������� ���������� � �������: " << line1.getString() << endl;
	return 0;
	}