// article4.1_task2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �2. ������������ ������� � ��������� ������
#include <windows.h>
#include <iostream>
using namespace std;
class Book {
	int numberOfPages;//�������� ������� ������
public:
	int yearOfPublication;//�������� ������� ������
	//�������� ������
	void setNumberOfPages(int);
	int getNumberOfPages();
	void reset();
};
void Book::setNumberOfPages(int numberOfPag) {
	numberOfPages = numberOfPag;//������ ��������� � numberOfPages
	yearOfPublication = 2019;//������ ��������� � yearOfPublication
}
int Book::getNumberOfPages() {
	return numberOfPages;//������ ��������� � ���������� numberOfPages
}
void Book::reset() {
	//����� ������ setNumberOfPages()
	setNumberOfPages(0);
	yearOfPublication = 2019;
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Book bookForPublish;
	bookForPublish.setNumberOfPages(50);//������������� ���������� �������
		cout << "������ bookForPublish ����� ������ ������ setNumberOfPages(50) : " << endl;
		cout << "numberOfPages = " << bookForPublish.getNumberOfPages() << endl;
	cout << "yearOfPublication = " << bookForPublish.yearOfPublication << endl;//�������� �������� �������� yearOfPublication ����� ��������, �.�.�� �������� ��������
		cout << endl;
	bookForPublish.yearOfPublication = 2000;//������ �������� �������� yearOfPublication ����� ��������, �.�.�� �������� ��������
		cout << "������ bookForPublish ����� ��������� �������� bookForPublish.yearOfPublication = 2000:" << endl;
		cout << "numberOfPages = " << bookForPublish.getNumberOfPages() << endl;
	cout << "yearOfPublication = " << bookForPublish.yearOfPublication << endl;
	cout << endl;
	bookForPublish.reset();
	cout << "������ bookForPublish ����� ������ ������ bookForPublish.reset() :" << endl;
		cout << "numberOfPages = " << bookForPublish.getNumberOfPages() << endl;
	cout << "yearOfPublication = " << bookForPublish.yearOfPublication << endl;
	return 0;
}