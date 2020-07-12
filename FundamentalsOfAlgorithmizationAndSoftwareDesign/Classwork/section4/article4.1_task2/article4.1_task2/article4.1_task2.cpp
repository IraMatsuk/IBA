// article4.1_task2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №2. Демонстрация доступа к элементам класса
#include <windows.h>
#include <iostream>
using namespace std;
class Book {
	int numberOfPages;//закрытый элемент данных
public:
	int yearOfPublication;//открытый элемент данных
	//открытые методы
	void setNumberOfPages(int);
	int getNumberOfPages();
	void reset();
};
void Book::setNumberOfPages(int numberOfPag) {
	numberOfPages = numberOfPag;//прямое обращение к numberOfPages
	yearOfPublication = 2019;//прямое обращение к yearOfPublication
}
int Book::getNumberOfPages() {
	return numberOfPages;//прямое обращение к переменной numberOfPages
}
void Book::reset() {
	//вызов метода setNumberOfPages()
	setNumberOfPages(0);
	yearOfPublication = 2019;
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Book bookForPublish;
	bookForPublish.setNumberOfPages(50);//устанавливаем количество страниц
		cout << "Объект bookForPublish после вызова метода setNumberOfPages(50) : " << endl;
		cout << "numberOfPages = " << bookForPublish.getNumberOfPages() << endl;
	cout << "yearOfPublication = " << bookForPublish.yearOfPublication << endl;//получить значение элемента yearOfPublication можно напрямую, т.к.он является открытым
		cout << endl;
	bookForPublish.yearOfPublication = 2000;//задать значение элемента yearOfPublication можно напрямую, т.к.он является открытым
		cout << "Объект bookForPublish после установки элемента bookForPublish.yearOfPublication = 2000:" << endl;
		cout << "numberOfPages = " << bookForPublish.getNumberOfPages() << endl;
	cout << "yearOfPublication = " << bookForPublish.yearOfPublication << endl;
	cout << endl;
	bookForPublish.reset();
	cout << "Объект bookForPublish после вызова методы bookForPublish.reset() :" << endl;
		cout << "numberOfPages = " << bookForPublish.getNumberOfPages() << endl;
	cout << "yearOfPublication = " << bookForPublish.yearOfPublication << endl;
	return 0;
}