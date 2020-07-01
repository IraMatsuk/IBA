// article2.7_task6.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <Windows.h>
#include <locale>
#include "Date.h"

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    Date date;
    char slash = '/';

    std::cout << "¬ведите день мес€ц и год в формате XX/XX/XXXX: ";
    std::cin >> date.day >> slash;
    std::cin >> date.month >> slash;
    std::cin >> date.year;
    printf("ƒата: %02d/%02d/%04d", date.day, date.month, date.year);
    return 0;
}

