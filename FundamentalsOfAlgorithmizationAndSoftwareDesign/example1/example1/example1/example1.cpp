// example1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#include <locale.h>
//#include <stdlib.h> //���� �� �������� ������� ���������, �� ����� ����������� ���� ������� ����������
//#include <Windows.h> 
#define CURRENT_YEAR 2019 // ���������� ���������, ����������� � ������� ��������� define, ����� ����� ��������� ������ � ������ �������� ���� ���������

int main()
{
	setlocale(LC_ALL, "Russian");
//	system("chcp 1251"); ������������ ��������� � stdlib.h �����������
//	system("cls");
//	SetConsoleCP(1251); // ������������ ��� ��������� ������� ��������� � include Windows.h 
//	SetConsoleOutputCP(1251); // ������������ ��� ��������� ������� ��������� � include <Windows.h> � SetConsoleCP(1251)
	int yearBorn, userAge;  // ����������, ����������� � ������� main � �� ������������������, ������ � ���� �����-�� ����� � �� �� ����� �� ������������
	//printf("%d%d", yearBorn, userAge); // �� �� ����� ����� ������������ �� ������������������� ����������

	printf("� ����� ���� �� ��������?\n");
	scanf_s(" %d", &yearBorn); // ������ ����� %d ������������ ��� ����, ����� ���������� ������, ������� ���������, enter ��� �����, & ��������� �� ����� ������ ������
	if (yearBorn > CURRENT_YEAR) {	
		printf("�� ��� �� ��������\n");
		printf("������� ��� ��� ��� ������ ��������.\n");
		printf("� ����� ���� �� ��������?\n");
		scanf_s(" %d", &yearBorn);
	}
	userAge = CURRENT_YEAR - yearBorn;
	printf("� ���� ���� � ���� �������� ��� ���������� %d ���!\n", userAge);
	if ((yearBorn % 4 == 0)) printf("�� �������� � ���������� ���!\n");
	return 0;
}

