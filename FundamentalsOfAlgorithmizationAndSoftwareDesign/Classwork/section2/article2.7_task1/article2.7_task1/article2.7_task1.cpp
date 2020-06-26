// article2.7_task1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <locale.h>

int main()
{
    setlocale(LC_ALL, "rus");
    int i, userSize;
    float biggest, smallest;
    float* randomNums;
    float total = 0, average;
    srand(time(nullptr)); //������������� ���������� ��������� �����
    printf("������� ��������� ����� ����� � �������? ");
    scanf_s(" %d", &userSize);
    //�������� ������ ��� ������, ����� ��������� �������� ��������� � ����������� ��������� �����, ����������� �������������
    randomNums = (float *)malloc(userSize * sizeof(float));
    //�������� ������������ ��������� ������ ��� �������
    if (!randomNums) {
        printf("������ ��������� ������� ��������� �����!\n");
        exit(1);
    }

    //������ �� ��������� ������� � ���������� ������� �������� ������ ����� � ��������� �� 1 �� 500
    for (i = 0; i < userSize; i++) 
        randomNums[i] = (rand() % 500) + 1;
        printf("��������� �������� �������: \n");      
    for (i = 0; i < userSize; i++) 
        printf("[%d]=%f\n", i + 1, randomNums[i]);
    //������������� ������ �������� � ������ ���������� ����� ��� ������������ ���������
    biggest = 0;
    smallest = 500;
    //������ �� ������������ ������� � ����� ����������� � ����������� �����, � ����� �������� ���� ����� � ���������� ��������
    for (i = 0; i < userSize; i++) {
        total += randomNums[i];
        if (randomNums[i] > biggest)
            biggest = randomNums[i];

        if (randomNums[i] < smallest)
            smallest = randomNums[i];
    }
    average = total / userSize;
    printf("���������� ��������� �����: %f.\n", biggest);
    printf("���������� ��������� �����: %f.\n", smallest);
    printf("������� �������� ��������� �����: %.2f.\n", average);
    //��� ������������� malloc �� �������� ������������ free
    free(randomNums);
    return(0);
}

