// article2.5_task2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <windows.h>
#include<stdio.h>

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    int ctr;
    int idSearch;
    int custID[10] = { 31, 45, 50, 10, 89, 47, 79, 91, 34, 63 };
    double custBal[10] = { 0.00, 45.43, 71.23, 301.56, 9.08,
    192.41, 389.00, 229.67, 18.31, 59.54 };
    printf("\n\n**�������� ������� �������**\n");
    while (1) {
        bool found = false;
        printf("������� ������� ����� �������: ");
        scanf_s(" %d", &idSearch);
        for (ctr = 0; ctr < 10; ctr++) {
            if (idSearch == custID[ctr]) {
                found = true;
                break;
            }
        }
        if (found) {
            if (custBal[ctr] > 100.00) {
                printf("\n*������ �������: $%.2f\n", custBal[ctr]);
                printf(" ������ ����������. \n");
            }
            else {
                printf("\n*� ������� ������� ��������� ������!\n");
            }
        }
        else {
            printf("*�� ����� �������� ID �������.");
            printf("\n��������� ID %3d � ������ �� ������.\n", idSearch);
            }
        }
        return 0;
}

