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
    printf("\n\n**Проверка баланса клиента**\n");
    while (1) {
        bool found = false;
        printf("Введите искомый номер клиента: ");
        scanf_s(" %d", &idSearch);
        for (ctr = 0; ctr < 10; ctr++) {
            if (idSearch == custID[ctr]) {
                found = true;
                break;
            }
        }
        if (found) {
            if (custBal[ctr] > 100.00) {
                printf("\n*баланс клиента: $%.2f\n", custBal[ctr]);
                printf(" Кредит недоступен. \n");
            }
            else {
                printf("\n*У клиента хороший кредитный баланс!\n");
            }
        }
        else {
            printf("*Вы ввели неверный ID клиента.");
            printf("\nВведенный ID %3d в списке не найден.\n", idSearch);
            }
        }
        return 0;
}

