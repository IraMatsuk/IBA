// article2.4_task2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <locale.h>

int main()
{
    setlocale(LC_ALL, "Russian");

    int age;
    printf("Введите возраст от 0 до 120: \n");
    scanf_s("%d", & age);

    if ((age > 120) || (age < 0)) {
        printf("Вы ввели неверный возраст! \n");
    }
    else if (age % 10 == 1 && age <= 101) {
        printf("Вам %d год. \n", age);
    }
    else if ((age <= 104) && (age % 10 == 2) || (age % 10 == 3) || (age % 10 == 4)){
        printf("Вам %d года. \n", age);
    }
    else {
        printf("Вам %d лет. \n", age);
    }
    return 0;
}

