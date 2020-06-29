// article2.7_task1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <windows.h>

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    std::cout << "для char необходимо " << sizeof(char) << " байта\n";
    std::cout << "для int необходимо " << sizeof(int) << " байта\n";
    std::cout << "для float необходимо " << sizeof(float) << " байта\n";
    std::cout << "для doube необходимо " << sizeof(double) << " байта";
    return 0;
}

