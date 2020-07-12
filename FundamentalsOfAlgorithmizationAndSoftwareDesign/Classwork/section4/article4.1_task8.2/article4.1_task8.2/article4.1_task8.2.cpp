// article4.1_task8.2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №8.2 Автоматически встраиваемая функция
#include <iostream>
//using namespace std;
class Student {
	int age;//закрытый элемент по умолчанию
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

//Пример №8.2 Автоматически встраиваемая функция неверно!!! 
//ищет Student вне класса Student при этом находясь в классе Student
//#include <iostream>
//using namespace std;
//
//class Student {
//	int age;//закрытый элемент по умолчанию
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

