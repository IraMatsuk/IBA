// 8kyu_AbbreviateATwoWordName.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <string>

std::string abbrevName(std::string name)
{
    std::string result = "";
    result += std::toupper(name[0]);
    result.append(".");
    const auto secondLetterPosition = name.find_last_of(' ') + 1;
    return result += std::toupper(*name.substr(secondLetterPosition, 1).c_str());
}

int main()
{
    abbrevName("Sam harris");
    return 0;
}

