// article4.1_task11.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №11. Простой пример использования указателя на объект.
//САМОСТОЯТЕЛЬНО: ИЗМЕНИТЬ ПРОГРАММУ ТАК, ЧТОБЫ КОЛИЧЕСТВО ОБЪЕКТОВ
//УКАЗЫВАЛ ПОЛЬЗОВАТЕЛЬ.ФУНКЦИОНАЛ ОСТАВИТЬ ПРЕЖНИМ
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
	Circle circle, * ptrCircle;//Объявляем объект и указатель
	circle.setRadius(15.5);//Получаем данные через прямой доступ к объекту 
		cout << circle.getRadius() << endl;
	ptrCircle = &circle;//Присваиваем указателю ptrCircle адрес объекта circle
		cout << ptrCircle->getRadius() << endl;//Получаем доступ к объекту circle с помощью указателя
	return 0;
}