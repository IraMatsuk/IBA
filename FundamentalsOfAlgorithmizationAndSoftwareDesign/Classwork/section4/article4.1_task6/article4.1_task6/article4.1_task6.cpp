// article4.1_task6.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �6. ������������� ��������������� ���������� ������������� ������� ��� ������������� ������������ � ����� ����������
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
	std::string studentName = "���������";
	Student obFirst = studentName;//����� ������ Student("���������")
	studentName = "��������";
	Student obSecond = studentName;//����� ������ Student("��������")
	studentName = "����������";
	Student obThird = studentName;//����� ������ Student("����������")
	cout << obFirst.getName() << endl;
	cout << obSecond.getName() << endl;
	cout << obThird.getName() << endl;
	return 0;
}