// article4.1_task10.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №10. Инициализация массива объектов класса
#include <iostream>
#define SIZE_ARR 4
using namespace std;
#include <windows.h>
class MyRectangle {
	int width, height;
public:
	MyRectangle(int width, int height) : width(width), height(height) {}
	int getArea() { return width * height; }
};
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	MyRectangle rectArray[SIZE_ARR] = { {1,2},{10,20},{30,40},{25,25} };
	int i;
	for (i = 0; i < SIZE_ARR; i++) {
		cout << "Площадь прямоугольника №" << i + 1 << " = ";
		cout << rectArray[i].getArea() << " см квадратных" << endl;
	}
	return 0;
}