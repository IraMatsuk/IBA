// article4.1_task30.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �30. ������������� ��������� this
#include <iostream>
#include <string>
#include <windows.h>
using namespace std;
class Account {
	int numberOfAccount;
public:
	void setNumber(int numberOfAccount) {
		this->numberOfAccount =
			numberOfAccount;
	}
	int getNumber() { return this->numberOfAccount; }//���� �����, ��� return numberOfAccount
};

int main() {
	Account firstAccount;
	firstAccount.setNumber(100);
	cout << firstAccount.getNumber();
	return 0;
}