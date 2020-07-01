#pragma once
#include <string>

enum class Etype {
    unknown, laborer, secretary, manager, accountant, executive, researcher
};

Etype letterToEnum(char letter);
std::string enumToSting(Etype etype);
