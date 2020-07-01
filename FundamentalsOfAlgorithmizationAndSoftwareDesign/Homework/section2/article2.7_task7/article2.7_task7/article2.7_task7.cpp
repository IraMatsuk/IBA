// article2.7_task7.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <windows.h>
#include "etype.h"

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    char firstLetter;
    std::cout << "Введите первую букву должности (laborer, secretary, manager, accountant, executive, researcher) ";
    std::cin >> firstLetter;
    Etype etype = letterToEnum(firstLetter); // calling the function and storing the result of calling the function in a variable
    std::string str = enumToSting(etype); // calling the function and storing the result of calling the function in a variable
    std::cout << "Полное название должности: " << str;
    return 0;
}

