// article2.3_task12.cpp : This file contains the 'main' function. Program execution begins and ends there.

#include <stdio.h>
#include <windows.h>

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    char firstInitial, lastInitial;
    int age, favorite_number;
    printf("� ����� ����� ���������� ���� �������?\n");
    scanf_s(" %c", &firstInitial, 1);
    printf("� ����� ����� ���������� ���� ���?\n");
    scanf_s(" %c", &lastInitial, 1);
    printf("������� ��� ���?\n");
    scanf_s(" %d", &age);
    printf("����� ���� ������� �����? (������ �����)\n");
    scanf_s(" %d", &favorite_number);
    printf("\n\n���� ��������: %c.%c., � ��� %d ���", firstInitial, lastInitial, age);
    printf("\n���� ������� ����� %d. \n\n", favorite_number);
    return 0;
    scanf_s(" %c", &firstInitial, 1);
}

