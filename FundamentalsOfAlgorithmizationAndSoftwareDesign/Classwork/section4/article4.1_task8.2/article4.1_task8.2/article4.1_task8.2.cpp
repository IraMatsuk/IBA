// article4.1_task8.2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �8.2 ������������� ������������ �������
#include <iostream>
//using namespace std;
class Student {
	int age;//�������� ������� �� ���������
public:
	int getAge() { return age; }
	void putAge(int age) { this->age = age; }
};
int main() {
	Student student;
	student.putAge(19);
	std::cout << student.getAge();
	return 0;
}

//������ �8.2 ������������� ������������ ������� �������!!! 
//���� Student ��� ������ Student ��� ���� �������� � ������ Student
//#include <iostream>
//using namespace std;
//
//class Student {
//	int age;//�������� ������� �� ���������
//public:
//	int Student::getAge() { return age; }
//	void Student::putAge(int age) { this->age = age; }
//};
//int main() {
//	Student student;
//	student.putAge(19);
//	cout << student.getAge();
//	return 0;
//}

