// article2.5_task4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <windows.h>
#include <stdio.h>
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	int kids, * pKids;
	float price, * pPrice;
	char code, * pCode;
	price = 17.50;
	pPrice = &price;
	printf("\n�������� ����� �� ������ � ��������? ");
	scanf_s(" %d", &kids);
	pKids = &kids;
	printf("\n� ��� ���� ������?");
	printf("\n������� E ��� ������ ����������, S ��� ������ �� ��������� Sav - More ");
	printf("��� N ���� ������ ���: ");
	scanf_s(" %c", &code, 1);
	pCode = &code;
	printf("\n������ � ����������� : \n");
	printf("� ��� %d �����...\n", kids);
	switch (code) {
	case ('E'):
		printf("������ ���������� ��������� ���������� 25 %% �� ���� ");
		printf("$%.2f price", price);
		printf("\n����� ��������� �������: $%.2f",(price * .75 * kids));
		break;
	case ('S'):
		printf("������ Sav-more ��������� ���������� 15 %% �� ����");
		printf("$%.2f price", price);
		printf("\n ����� ��������� �������: $%.2f",
			(price * .85 * kids));
		break;
	default: // ���� ������� N ��� ������������ �����
		printf("�� ��������� ������ ��������� �������,");
		printf("������� �������� $%.2f", price);
	}
	//�������� ��� �� ���, ����������� �������������� ���������
	printf("\n\n\n������ � ����������� : \n");
	printf("� ��� %d �����...\n", *pKids);
	switch (*pCode) {
	case ('E'):
		printf("������ ���������� ��������� ���������� 25 %% �� ���� ");
		printf("$%.2f price", *pPrice);
		printf("\n����� ��������� �������: $%.2f", (*pPrice * .75 * *pKids));
		break;
	case ('S'):
		printf("������ Sav-more ��������� ���������� 15 %% �� ����");
		printf("$%.2f price", *pPrice);
		printf("\n����� ��������� �������: $%.2f", (*pPrice * .85 *	*pKids));
		break;
	default: // ���� ������� N ��� ������������ �����
		printf("�� ��������� ������ ��������� �������, ");
		printf("������� �������� $%.2f", *pPrice * kids);
	}
	return(0);
}

