// article4.1_task11.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �11. ������� ������ ������������� ��������� �� ������.
//��������������: �������� ��������� ���, ����� ���������� ��������
//�������� ������������.���������� �������� �������
#include <iostream>
using namespace std;
class Circle {
	float radius;
public:
	void setRadius(float radius) { this->radius = radius; }
	float getRadius();
};
float Circle::getRadius() { return radius; }
int main() {
	Circle circle, * ptrCircle;//��������� ������ � ���������
	circle.setRadius(15.5);//�������� ������ ����� ������ ������ � ������� 
		cout << circle.getRadius() << endl;
	ptrCircle = &circle;//����������� ��������� ptrCircle ����� ������� circle
		cout << ptrCircle->getRadius() << endl;//�������� ������ � ������� circle � ������� ���������
	return 0;
}