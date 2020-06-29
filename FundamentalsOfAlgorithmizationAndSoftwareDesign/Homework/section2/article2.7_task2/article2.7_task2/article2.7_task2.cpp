// article2.7_task2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <windows.h>
#include <locale>

struct Phone {
    unsigned short cityCode; // unsigned use for positive digits
    unsigned short phoneStationNumber;
    unsigned short subscriberNumber;
};


int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    Phone newPhone1 = { 212, 767, 8900 };
    Phone newPhone2;
    
    // one more case for initialization of fields by name:
    //newPhone1.cityCode = 212;
    //newPhone1.phoneStationNumber = 767;
    //newPhone1.subscriberNumber = 8900;

    std::cout << "Введите код города, номер станции и номер абонента: \n";
    std::cin >> newPhone2.cityCode >> newPhone2.phoneStationNumber >> newPhone2.subscriberNumber;

    std::cout <<"Мой номер (" << newPhone1.cityCode << ") "
        << newPhone1.phoneStationNumber << "-"
        << newPhone1.subscriberNumber << std::endl;

    std::cout << "Ваш номер (" << newPhone2.cityCode << ") "
        << newPhone2.phoneStationNumber << "-"
        << newPhone2.subscriberNumber;

    return 0;
}
