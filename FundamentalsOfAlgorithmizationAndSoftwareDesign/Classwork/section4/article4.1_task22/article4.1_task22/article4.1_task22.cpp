// article4.1_task22.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �22. ������������, ����������� � �������� ��������
#include <iostream>
#include <windows.h>
using namespace std;

class Employee {
	int ID;
public:
	Employee(int ID) {
		this->ID = ID; 
		cout << "�������� ������� ������ Employee\n"; 
	}
	~Employee() {
		cout << "���������� ������� ������ Employee\n";
	}

	int getID() { return ID; }
};

void display(Employee employee) {
	cout << employee.getID() << endl;
}

int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Employee ob(1010);
	display(ob);
	return 0;
}