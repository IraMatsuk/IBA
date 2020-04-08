// article2.3_task3.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#include<locale.h>

int main()
{
    setlocale(LC_ALL, "");
    printf("Я изучаю язык программирования %c \n", 'C');
    printf("Я только что дочитал раздел %d\n", 1);
    printf("Я на %.1f процентов готов перейти ", 99.9);
    printf("к следующему разделу!\n");
    return 0;
}

