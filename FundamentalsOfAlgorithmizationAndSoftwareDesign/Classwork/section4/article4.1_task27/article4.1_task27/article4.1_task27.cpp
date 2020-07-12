// article4.1_task27.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �27. ������������� ������������ ����� ��� ����������� ��������� �������
#include <iostream>
#include <string>
#include <windows.h>
using namespace std;

class Account {
	int* data;
public:
	Account(int data);//������� �����������
	Account(const Account& ob);//����������� �����
	~Account();
	int getData() { return *data; }
};

//����������� �����
Account::Account(const Account &obj) {
	data = new int[10];
	*data = *obj.data; // �������� �����
	cout << "������ ����������� �����.\n";
}

// ������� �����������
Account::Account(int data) {
	cout << "��������� ������, ���������� ���������� data.\n";
	this->data = new int[10];
	*(this->data) = data;
}
Account::~Account() {
	cout << "������������ ������, ���������� ���������� data.\n";
	delete data;
}
// ��� ������� ��������� ���� ������-��������
void display(Account ob) {
	cout << "���������� �����:" <<
		ob.getData() << endl;
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Account firstAccount(10);
	display(firstAccount);
	return 0;
}