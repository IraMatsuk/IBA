// 8kyu_FakeBinary.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <string>
#include <cstdlib>

std::string fakeBin(std::string str) {
    std::string result;
    int a = 0;
    for (auto elem : str) { 
        a = atoi(&elem);
        if (a < 5) {
            result.append("0");
        }
        else {
            result.append("1");
        }
    }
    return result;
}

int main()
{
    fakeBin("4530451125");
    return 0;
}

