// article2.3_task13.cpp : This file contains the 'main' function. Program execution begins and ends there.

//������ �13. ��������� ����������� � ������������ ������, �����
//���� ������� �� �����, ��, ��� ���� �������

#include <stdio.h>
#include <windows.h>

int main()
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	char topping[24];
	int slices = 0;
	int month, day, year;
	float price;

	//������ ����� ������� scanf ��������� ���������� ���� 
	//float ��� ���������� ��������� �����. ���� ������������ ��
	//������ ���� $ ����� �����, �� ��������� ������ � ���������
	printf("������� ����� ����� � ����� ������?");
	printf("\n(������� ��� XX.XX)\n");
	scanf_s(" %f", &price);
	printf("����� ���� ������� ������� (����� ������)?\n");
	scanf_s(" %s", topping, 24);//������� ����� - ������, ������� & �� �����
	printf("������� ���� � �������� %s", topping);
	printf(" �� ������ ������ �� ���?\n");
	scanf_s(" %d", &slices);
	printf("����� ������� �����? (������� ��/��/��)\n");
	scanf_s(" %d/%d/%d", &month, &day, &year);
	printf("\n\n������ �� �� �������� ���� ������ %d/%d/%d", month, day, year);
	printf("\n� �� ������ %d ����� � �������� %s?\n", slices, topping);
	printf("��� ����� ������ ���� $%.2f!\n\n\n", price*slices);
	return 0;


}

