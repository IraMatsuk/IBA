// article2.3_task4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
/* Пример №4. Первый листинг программног кода из раздела*/
/* Подсчет суммы расходов на подарки в праздники. */

#include <stdio.h>
#include <locale.h>

int main()
{
    setlocale(LC_ALL, "");
    float gift1, gift2, gift3, gift4, gift5; /* Переменные для записи расходов */
    float total; /* Переменная для записи общей суммы */
/* Запрос стоимости каждого подарка */
    printf("Сколько вы хотитет потратить на маму? ");
    scanf_s(" %f", &gift1);
    printf("Сколько вы хотитет потратить на папу? ");
    scanf_s(" %f", &gift2);
    printf("Сколько вы хотитет потратить на сестру? ");
    scanf_s(" %f", &gift3);
    printf("Сколько вы хотитет потратить на брата? ");
    scanf_s(" %f", &gift4);
    printf("Сколько вы хотитет потратить на своего любимого ");
    printf("автора книг по программированию на С? ");
    scanf_s(" %f", &gift5);
    total = gift1 + gift2 + gift3 + gift4 + gift5;
/* Вычисление общей суммы расходов на все подарки */
    printf("\nОбщая сумма, которую вы потратите на подарки: $%.2f", total);
    return 0; /* Конец программы */

}

