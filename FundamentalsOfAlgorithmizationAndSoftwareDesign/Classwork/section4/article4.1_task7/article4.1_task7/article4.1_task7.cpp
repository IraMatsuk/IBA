// article4.1_task7.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �7.1. ������������� ��������� ��� �������� �������
#include <iostream>
using namespace std;
struct Student {
	int getID();//��� �������� ������� (public) �� ���������
	void putID(int ID);
private:
	int ID;
};
int Student::getID() { return ID; }
void Student::putID(int ID) { this->ID = ID; }
int main() {
	Student studentIEF;
	studentIEF.putID(10);
	cout << studentIEF.getID();
	return 0;
}

