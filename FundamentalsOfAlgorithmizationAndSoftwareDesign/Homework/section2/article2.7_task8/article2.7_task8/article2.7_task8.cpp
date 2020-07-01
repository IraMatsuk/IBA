// article2.7_task8.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <Windows.h>
#include "time.h"

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);

    Time time;
    std::cout << "Ââåäèòå âðåìÿ â ôîðìàòå ÷àñû, ìèíóòû, ñåêóíäû: ";
    std::cin >> time.hours;
    std::cin >> time.minutes;
    std::cin >> time.seconds;
    long totalseñs = time.hours * 3600 + time.minutes * 60 + time.seconds;
    std::cout << totalseñs;
    return 0;
}

