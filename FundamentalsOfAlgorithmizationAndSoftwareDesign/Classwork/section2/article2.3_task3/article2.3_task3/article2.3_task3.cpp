// article2.3_task3.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#include<locale.h>

int main()
{
    setlocale(LC_ALL, "");
    printf("� ������ ���� ���������������� %c \n", 'C');
    printf("� ������ ��� ������� ������ %d\n", 1);
    printf("� �� %.1f ��������� ����� ������� ", 99.9);
    printf("� ���������� �������!\n");
    return 0;
}

