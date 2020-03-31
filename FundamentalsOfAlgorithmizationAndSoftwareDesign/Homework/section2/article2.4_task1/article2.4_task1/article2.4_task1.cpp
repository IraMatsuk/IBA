// article2.4_task1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

enum MONTHS{
    JANUARY = 1,
    FEBRUARY,
    MARCH,
    APRIL,
    MAY,
    JUNE,
    JULY,
    AUGUST,
    SEPTEMBER,
    OCTOBER,
    NOVEMBER,
    DECEMBER
};

enum SEASONS {
    NO_SEASON,
    WINTER,
    SPRING,
    SUMMER,
    AUTUMN
};

SEASONS getSeason(int month)
{
    if (month == JANUARY || month == FEBRUARY || month == DECEMBER) {
        return WINTER;
    }
    else if (month >= MARCH && month <= MAY) {
        return SPRING;
    }
    else if (month >= 6 && month <= 8) {
        return SUMMER;
    }
    else if (month >= 9 && month <= 11) {
        return AUTUMN;
    }
    else {
        return NO_SEASON;
    }
}


int main()
{
    int numberMonth = 0;
    printf("Enter the number of the month: \n");
    scanf_s("%d", &numberMonth);

    SEASONS season = getSeason(numberMonth);
    switch (season){
    case WINTER:
        printf("This is a winter! \n");
        break;
    case SPRING:
        printf("This is a spring! \n");
        break;
    case SUMMER:
        printf("This is an authum! \n");
        break;
    case AUTUMN:
        printf("This is a summer! \n");
        break;    
    default:
        printf("This is an invalid month number! \n");
        break;
    }
    return 0;
}


