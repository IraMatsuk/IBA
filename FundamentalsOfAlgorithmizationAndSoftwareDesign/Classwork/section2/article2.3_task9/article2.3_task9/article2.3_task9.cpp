// article2.3_task9.cpp : This file contains the 'main' function. Program execution begins and ends there.

/* ������ �9� ������ ���������, ������������� ��� ���� ��������
���������������, � ����� ��������� �� �������*/
#include <stdio.h>

int main()
{
    // ���������� � ����������� ��������� ����������
    char firstInitial, middleInitial;
    int number_of_pencils;
    int number_of_notebooks;
    float pencils = 0.23f;
    float notebooks = 2.89f;
    float lunchbox = 4.99f;
    // ���������� ��� ������� �������
    firstInitial = 'J';
    middleInitial = 'R';
    number_of_pencils = 7;
    number_of_notebooks = 4;
    printf("%c%c needs %d pencils, %d notebooks, and 1 lunchbox\n", firstInitial, middleInitial, number_of_pencils, number_of_notebooks);
    printf("The total cost is $%.2f\n\n", number_of_pencils*pencils + number_of_notebooks * notebooks + lunchbox);
    // ���������� ��� ������� �������
    firstInitial = 'A';
    middleInitial = 'J';
    number_of_pencils = 10;
    number_of_notebooks = 3;
    printf("%c%c needs %d pencils, %d notebooks, and 1 lunchbox\n", firstInitial, middleInitial, number_of_pencils, number_of_notebooks);
    printf("The total cost is $%.2f\n\n", number_of_pencils * pencils + number_of_notebooks * notebooks + lunchbox);
    // ���������� ��� �������� �������
    firstInitial = 'M';
    middleInitial = 'T';
    number_of_pencils = 9;
    number_of_notebooks = 2;
    printf("%c%c needs %d pencils, %d notebooks, and 1 lunchbox\n", firstInitial, middleInitial, number_of_pencils, number_of_notebooks);
    printf("The total cost is $%.2f\n", number_of_pencils * pencils + number_of_notebooks * notebooks + lunchbox);

    return 0;
}


