// article4.1_task7.2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №7.2. Использование класса для создания объекта
#include <iostream>
using namespace std;
class Student {
	int ID;
public:
	int getID();//Эти элементы открыты (public) по умолчанию
	void putID(int ID);
};
int Student::getID() { return ID; }
void Student::putID(int ID) { this->ID = ID; }
int main() {
	Student studentIEF;
	studentIEF.putID(10);
	cout << studentIEF.getID();
	return 0;
}