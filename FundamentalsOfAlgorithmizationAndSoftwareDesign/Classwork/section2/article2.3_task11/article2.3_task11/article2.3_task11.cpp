// article2.3_task11.cpp : This file contains the 'main' function. Program execution begins and ends there.

//������ �11. ���������, ������������� ���� �����, �� ����������� � �������� ���������������,
//� ����� ��������� �� ������������ 

#include <stdio.h>
#include <string.h>
#include <locale.h>
#include "MyConstant.h"

int main()
{
    setlocale(LC_ALL, "");
    int age;
    char childname[14] = "�������";
    printf("\n%s ����� %d �����\n", FAMILY, KIDS);
    age = 11;
    printf("������� ���, %s, %d ���.\n", childname, age);
    strcpy_s(childname, sizeof(childname), "�������");
    age = 6;
    printf("������� ���, %s, %d.\n", childname, age);
    age = 3;
    strcpy_s(childname, sizeof(childname), "�����");
    printf("������� ���, %s, %d.\n", childname, age);
    return 0;
}


