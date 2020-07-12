// article4.1_task25.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №25. Использование функции, которая возвращает объект
#include <iostream>
#include <string>
#include <windows.h>
using namespace std;

class Message {
	string mString;
public:
	void showMessage() { cout << "Сообщение: " << mString << "\n"; }
	void setMessage(string str) { mString.append(str); }
};

//Эта метод возвращает объект типа Message
Message input() {
	string inputStr;
	Message msg;
	cout << "Введите строку: ";
	getline(cin, inputStr);
	msg.setMessage(inputStr);
	return msg;
}

int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Message ob;
	//Присваиваем объект, возвращаемый методом input(), локальному объекту ob
	ob = input();
	ob.showMessage();
	return 0;
}