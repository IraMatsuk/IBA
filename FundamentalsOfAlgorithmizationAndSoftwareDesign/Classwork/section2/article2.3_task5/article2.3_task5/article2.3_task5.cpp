// article2.3_task5.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
//������ ������������������ ����
#include <stdio.h>
#include <locale.h>

int main()
{
    setlocale(LC_ALL, "");
    float a, b;
    printf("����� ����� �� ��������?");
    scanf_s(" %f", &a);
    b = .85 * a;
    printf("���� �������� 15 ���������, ");
    printf("� ��� ��� ��� ��������� %.2f ", b);
    return 0;
}
