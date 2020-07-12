// article4.1_task9.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №9. Использование массива объектов
#include <iostream>
#include <windows.h>
using namespace std;
enum Resolution { low, medium, high };
char names[3][8] = { "низкий",
					"средний",
					"высокий" };
class Display {
	float width;
	float height;
	Resolution res;
public:
	void setDim(int width, int height) {
		this->width = width; 
		this -> height = height;
	}
	void getDim(int& width, int& height) {
		width = this->width;
		height = this->height;
	}
	void setRes(Resolution res) { this->res = res; }
	Resolution getRes() { return res; }
};
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Display displayMode[3];
	int width, height;
	displayMode[0].setRes(low);
	displayMode[0].setDim(640, 480);
	displayMode[1].setRes(medium);
	displayMode[1].setDim(800, 600);
	displayMode[2].setRes(high);
	displayMode[2].setDim(1600, 1200);
	cout << "Возможные режимы отображения монитора:\n";
	for (int i = 0; i < 3; i++) {
		cout << names[displayMode[i].getRes()] << ":";
		displayMode[i].getDim(width, height);
		cout << width << " x " << height << "\n";
	}
	return 0;
}