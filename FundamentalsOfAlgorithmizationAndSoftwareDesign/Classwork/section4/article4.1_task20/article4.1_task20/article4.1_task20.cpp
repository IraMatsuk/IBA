// article4.1_task20.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �20. ������������ ������������ ��������
#include <iostream>
#include <windows.h>
using namespace std;
class Person {
	int age;
	float salary;
public:
	void setAge(int age) { 
		this->age = age; 
	}
	void setSalary(float salary) { 
		this->salary = salary; 
	}
	void showAge();
	void showSalary();
};
void Person::showAge() {
	cout << "������� ����� " << age << '\n';
}
void Person::showSalary() {
	cout << "�������� ����� " << salary << '\n';
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Person person1, person2;
	person1.setAge(23);
	person1.setSalary(10000);
	person2.setAge(35);
	person2.setSalary(20000.20f);
	cout << "������ person1 �� ������������: \n";
	person1.showAge();
	person1.showSalary();
	cout << "������ person2 �� ������������: \n";
	person2.showAge();
	person2.showSalary();
	cout << endl;
	person2 = person1; // ����������� ������ person1 ������� person2
	cout << "������ person1 ����� ������������: \n";
	person1.showAge();
	person1.showSalary();
	cout << "������ person2 ����� ������������: \n";
	person2.showAge();
	person2.showSalary();
	return 0;
}