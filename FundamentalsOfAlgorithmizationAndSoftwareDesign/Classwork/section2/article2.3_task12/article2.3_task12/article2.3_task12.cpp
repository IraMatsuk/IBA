// article2.3_task12.cpp : This file contains the 'main' function. Program execution begins and ends there.

#include <stdio.h>
#include <windows.h>

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    char firstInitial, lastInitial;
    int age, favorite_number;
    printf("С какой буквы начинается Ваша фамилия?\n");
    scanf_s(" %c", &firstInitial, 1);
    printf("С какой буквы начинается Ваше имя?\n");
    scanf_s(" %c", &lastInitial, 1);
    printf("Сколько Вам лет?\n");
    scanf_s(" %d", &age);
    printf("Какое ваше любимое число? (только целое)\n");
    scanf_s(" %d", &favorite_number);
    printf("\n\nВаши инициалы: %c.%c., и вам %d лет", firstInitial, lastInitial, age);
    printf("\nВаше любимое число %d. \n\n", favorite_number);
    return 0;
    scanf_s(" %c", &firstInitial, 1);
}

