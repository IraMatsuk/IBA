// article4.1_task13.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
//������ �13. ������������� ������-"�����"
#include <iostream>
#include <Windows.h>
using namespace std;
class Shape {
protected:
	float coordX, coordY; //���������� ������
public:
	Shape() { this->coordX = 0; this->coordY = 0; }
	friend void move(Shape* shape, int times);
};
class Circle : public Shape {
	float radius;//�����-"����" ������ Circle
public:
	Circle(float radius) { this->radius = radius; }
	friend void move(Shape* rec, int times);//����� move - "����" ������ MyRectangle
};
class MyRectangle :public Shape {
	float width, height;
public:
	MyRectangle(float width, float height) {
		this->width; this -> height = height;
	}
	friend void move(Shape* rec, int times);//����� move - "����" ������ MyRectangle
};
//����� move() �� �������� ��������� �� ������ �� �������
void move(Shape* ptrShape, int times) {
	ptrShape->coordX = ptrShape->coordX + times;
	ptrShape->coordY = ptrShape->coordY + times;
	cout << "X ���������� ������=" << ptrShape->coordX << endl;
	cout << "Y ���������� ������=" << ptrShape->coordY << endl;
}
void main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	MyRectangle rectangle(3.2f, 4.4f);
	Circle circle(20);
	Shape* ptrShape = &rectangle;
	move(ptrShape, 2);
	ptrShape = &circle;
	move(ptrShape, 10);
}