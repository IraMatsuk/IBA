// article2.7_task1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <windows.h>

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    std::cout << "��� char ���������� " << sizeof(char) << " �����\n";
    std::cout << "��� int ���������� " << sizeof(int) << " �����\n";
    std::cout << "��� float ���������� " << sizeof(float) << " �����\n";
    std::cout << "��� doube ���������� " << sizeof(double) << " �����";
    return 0;
}

