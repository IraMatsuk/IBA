// article2.7_task5.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <Windows.h>
#include <locale.h>
#include <iomanip>
#include "Employee.h"
const int SIZE_ARR = 3;

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);

    Employee employee[SIZE_ARR];
    for (int i = 0; i < 3; i++) {
        std::cout << "Введите номер сотрудника: ";
        std::cin >> employee[i].numberOfEmployee;
        std::cout << "Введите размер пособия сотрудника в долларах: ";
        std::cin >> employee[i].salary;
    }
    std::cout << std::endl;
    for (int i = 0; i < SIZE_ARR; i++) {
        std::cout << "Сотрудник " << employee[i].numberOfEmployee; 
        std::cout << " Размер пособия " << std::fixed << std::setprecision(2) << employee[i].salary << "$" << std::endl;
    }
    return 0;
}

