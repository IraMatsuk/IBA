// article4.1_task25.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �25. ������������� �������, ������� ���������� ������
#include <iostream>
#include <string>
#include <windows.h>
using namespace std;

class Message {
	string mString;
public:
	void showMessage() { cout << "���������: " << mString << "\n"; }
	void setMessage(string str) { mString.append(str); }
};

//��� ����� ���������� ������ ���� Message
Message input() {
	string inputStr;
	Message msg;
	cout << "������� ������: ";
	getline(cin, inputStr);
	msg.setMessage(inputStr);
	return msg;
}

int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Message ob;
	//����������� ������, ������������ ������� input(), ���������� ������� ob
	ob = input();
	ob.showMessage();
	return 0;
}