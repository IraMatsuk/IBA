// article4.1_task28.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �28. ����� ������������ ����� ��� ������������� �������
#include <iostream>
#include <string>
#include <windows.h>
using namespace std;

class Account {
	int* data;
public:
	Account(int data);//������� �����������
	Account(const Account& ob);//����������� �����~MyClass();
	~Account();
	int getVal() { return *data; }
};

//����������� �����
Account::Account(const Account& ob) {
	data = new int;
	*data = *ob.data;//�������� �����
	cout << "��������� ������ ������������� �����.\n";
}

// ������� �����������
Account::Account(int data) {
	cout << "��������� ������ ������� �������������.\n";
	this->data = new int;
	*(this->data) = data;
}

Account::~Account() {
	cout << "������������ ������.\n";
	delete data;
}

int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Account firstAccount(10);//���������� ����������� � �����������
	Account secondAccount = firstAccount;//���������� ����������� �����
	return 0;
}