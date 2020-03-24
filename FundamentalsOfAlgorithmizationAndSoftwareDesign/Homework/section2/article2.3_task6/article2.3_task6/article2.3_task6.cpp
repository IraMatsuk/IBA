// article2.3_task6.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

double heightOfTheEquilateralTriangle(double a)
{
    return (a * sqrt(3)) / 2;
}

double areaOfTheEquilateralTriangle(double a)
{
    return (1 / 2.0) * a * heightOfTheEquilateralTriangle(a);
}

int main()
{
    double side = 0;

    printf("Enter length of the side of the qequilateral triangle:\n");
    scanf_s("%lf", &side);
    printf("The height of the equilateral triangle is %.3lf\n", heightOfTheEquilateralTriangle(side));
    printf("The height of the equilateral triangle is %.3lf\n", areaOfTheEquilateralTriangle(side));
    return 0;
}

