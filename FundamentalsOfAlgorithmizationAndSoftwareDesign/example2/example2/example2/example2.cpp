// example2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
//#include <stdlib.h>
#include <locale.h>
#define CURRENT_YEAR 2019

int main()
{
//	system("chcp 1251");
//	system("cls");
	setlocale(LC_ALL, "Russian");
	int yearBorn, userAge;
	printf("� ����� ���� �� ��������?\n");
	scanf_s(" %d", &yearBorn);
	if (yearBorn > CURRENT_YEAR) {
		printf("������? �� ��� �� ��������\n");
		printf("����������� � ����������� �� �������\n");
	}
	else {
		userAge = CURRENT_YEAR - yearBorn;
		printf("� ���� ���� � ���� �������� ��� ���������� %d ���!\n", userAge);
	}
	if ((yearBorn % 4 == 0)) printf("�� �������� � ���������� ���!\n");
	return 0;
}