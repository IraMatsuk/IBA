// article4.1_task21.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �21. �������� �������� ��������
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
void printInTable(Employee emp[]) { // ������ �������� ���� Employee, ������ ���������� �� ������ (�.�.�������� � ��������)
	cout << "��� ���������� ----" << setw(32) << left << "------���������� ���������" << endl;
		for (int i = 0; i < SIZE; i++) {
			cout << setw(32) << emp[i].getName() << emp[i].getPosition();  // ������� ������� ����� � ��������� ��� new
			emp[i].setName(emp[i].getName() + "new"); 
			cout << endl;
		}
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Employee employees[SIZE];
	employees[0].setName("�������");
	employees[0].setposition("����������� Swift");
	employees[1].setName("��������");
	employees[1].setposition("����������� ����������������");
	employees[2].setName("�������");
	employees[2].setposition("iOS-�����������");
	employees[3].setName("������");
	employees[3].setposition("Android-�����������");
	employees[4].setName("�����");
	employees[4].setposition("���������� ��� ������");
	printInTable(employees);
	cout << "---------------------------------------" << endl;
	for (int i = 0; i < SIZE; i++) {
		cout << employees[i].getName() << " ";
		cout << employees[i].getPosition();
		cout << endl;
	}
	return 0;
}