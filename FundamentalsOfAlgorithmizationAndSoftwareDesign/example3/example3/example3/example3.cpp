#include <stdio.h>
//#include <stdlib.h>
#include <locale.h>

int main()
{
	setlocale(LC_ALL, "Russian");
	//system("chcp 1251");
	//system("color F0");
	//system("cls");

	int userPreference;
	printf("��������� �� ��������� (�� ����� �� 1 �� 10)?\n");
	scanf_s(" %d", &userPreference);

	if (userPreference >= 8) {
		printf("�� ��� �����������!\n");
		printf("� ��� ��� ������!\n");
	}
	else if (userPreference >= 5) {
		printf("���� ���� ��������, �� ��� ��?\n");
		printf("����� ����, ������ ��� ������ ��� �����!\n");
	}
	else if (userPreference >= 3) {
		printf("��������, ��� ��� �� ����� ������.\n");
		printf("��������, ������ �� �����������\n");
	}
	else {
		printf("���������, ��� ����������, �� ��� ��?\n");
		printf("����� ����� ������ �������.\n");
	}
	return 0;
}