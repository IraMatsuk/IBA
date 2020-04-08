// article2.3_task5.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
//Пример отформатированного кода
#include <stdio.h>
#include <locale.h>

int main()
{
    setlocale(LC_ALL, "");
    float a, b;
    printf("Какой бонус вы получили?");
    scanf_s(" %f", &a);
    b = .85 * a;
    printf("Если отдадите 15 процентов, ");
    printf("у вас все еще останется %.2f ", b);
    return 0;
}
