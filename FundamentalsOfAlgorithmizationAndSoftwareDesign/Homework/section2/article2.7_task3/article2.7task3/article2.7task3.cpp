// article2.7task3.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <windows.h>
#include <locale>
#include "Point.h"

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    Point point1, point2, point3;
        
    std::cout << "Введите координаты точки р1: ";
    std::cin >> point1.x; 
    std::cin >> point1.y;

    std::cout << "Введите координаты точки р2: ";
    std::cin >> point2.x;
    std::cin >> point2.y;

    point3.x = point1.x + point2.x;
    point3.y = point1.y + point2.y;

    std::cout << "Координаты точки р1 + р2 равны " << point3.x << "." << point3.y;
    return 0;
}

