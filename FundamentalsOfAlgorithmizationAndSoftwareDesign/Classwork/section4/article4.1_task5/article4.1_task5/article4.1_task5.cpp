// article4.1_task5.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №5. Использование параметризованного конструктора
#include <iostream>
using namespace std;
class Widget {
	int xCoord;
	int yCoord;
public:
	Widget(int, int);
	void getCoords();
};
//Передаем 2 аргумента конструктору класса Widget()
Widget::Widget(int xCoord, int yCoord) {
	this->xCoord = xCoord; this->yCoord = yCoord;
}
void Widget::getCoords() {
	cout << xCoord << " " << yCoord << "\n";
}
int main() {
	Widget firstObj(10, 20), secondObj(0, 0);
	firstObj.getCoords();
	secondObj.getCoords();
	return 0;
}