// article2.7_task4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <Windows.h>
#include <locale>
#include "Volume.h"

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);

    Volume volume = { 5, 6, 7 };
    std::cout << "Объем, занимаемый помещением равен ";
    std::cout << volume.distance1.height * volume.distance1.length * volume.distance1.width;

    return 0;
}

