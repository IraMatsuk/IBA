// article4.1_task7.2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �7.2. ������������� ������ ��� �������� �������
#include <iostream>
using namespace std;
class Student {
	int ID;
public:
	int getID();//��� �������� ������� (public) �� ���������
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