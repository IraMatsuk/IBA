#include "etype.h"

Etype letterToEnum(char letter) {
    switch (letter) {
    case 'l':
        return Etype::laborer;
    case 's':
        return Etype::secretary;
    case 'm':
        return Etype::manager;
    case 'a':
        return Etype::accountant;
    case 'e':
        return Etype::executive;
    case 'r':
        return Etype::researcher;
    default:
        return Etype::unknown;
    }
}

std::string enumToSting(Etype etype) {
    switch (etype) {
    case Etype::laborer:
        return "laborer";
    case Etype::secretary:
        return "secretary";
    case Etype::manager:
        return "manager";
    case Etype::accountant:
        return "accountant";
    case Etype::executive:
        return "executive";
    case Etype::researcher:
        return "researcher";
    case Etype::unknown:
        return "unknown";
    }
}