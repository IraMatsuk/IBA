// article2.3_task4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
/* ������ �4. ������ ������� ����������� ���� �� �������*/
/* ������� ����� �������� �� ������� � ���������. */

#include <stdio.h>
#include <locale.h>

int main()
{
    setlocale(LC_ALL, "");
    float gift1, gift2, gift3, gift4, gift5; /* ���������� ��� ������ �������� */
    float total; /* ���������� ��� ������ ����� ����� */
/* ������ ��������� ������� ������� */
    printf("������� �� ������� ��������� �� ����? ");
    scanf_s(" %f", &gift1);
    printf("������� �� ������� ��������� �� ����? ");
    scanf_s(" %f", &gift2);
    printf("������� �� ������� ��������� �� ������? ");
    scanf_s(" %f", &gift3);
    printf("������� �� ������� ��������� �� �����? ");
    scanf_s(" %f", &gift4);
    printf("������� �� ������� ��������� �� ������ �������� ");
    printf("������ ���� �� ���������������� �� �? ");
    scanf_s(" %f", &gift5);
    total = gift1 + gift2 + gift3 + gift4 + gift5;
/* ���������� ����� ����� �������� �� ��� ������� */
    printf("\n����� �����, ������� �� ��������� �� �������: $%.2f", total);
    return 0; /* ����� ��������� */

}

