// article2.3_task10.cpp : This file contains the 'main' function. Program execution begins and ends there.

//������ �10. ��������� ��������� ����� � �� �������� ������������

#include <stdio.h>
#include <string.h>

int main()
{
    char Kid1[12];// Kid1 ����� ��������� ��� �� 12 ��������
    char Kid2[] = "Maddie";// Kid2 ����� ��������� 7 �������� (Maddie ���� ����-������)
    char Kid3[7] = "Andrew"; // Kid3 ����� ��������� 7 ��������
    char Hero1[] = "Batman";// Hero1 ����� ��������� 7 ��������
    char Hero2[34] = "Spiderman";// Hero2 ����� ��������� 10 �������� � ����� �������������� ������������
    char Hero3[25];
    //Kid1 ���������������� �����������
    Kid1[0] = 'K';
    Kid1[1] = 'a';
    Kid1[2] = 't';
    Kid1[3] = 'i';
    Kid1[4] = 'e';
    Kid1[5] = '\0'; // ����-������ ���������, ����� ������� ����� ����������� ������
    strcpy_s(Hero3, sizeof(Hero3), "The Incredible Hulk");
    printf("%s\'s favorite hero is %s.\n", Kid1, Hero1);
    printf("%s\'s favorite hero is %s.\n", Kid2, Hero2);
    printf("%s\'s favorite hero is %s.\n", Kid3, Hero3);
    return 0;
}

