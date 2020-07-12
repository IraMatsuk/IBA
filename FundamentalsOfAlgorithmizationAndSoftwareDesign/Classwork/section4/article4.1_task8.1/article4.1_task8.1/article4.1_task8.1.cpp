// article4.1_task8.1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
//Пример №8.1 Использование встраиваемых методов
#include <iostream>
using namespace std;
class Student {
	int age; //закрытый элемент
public:
	int getAge();
	void putAge(int age);
};
inline int Student::getAge() { return age; }
inline void Student::putAge(int age) { this->age = age; }

int main()
{
	Student student;
	student.putAge(19);
	cout << student.getAge();
	return 0;
}
