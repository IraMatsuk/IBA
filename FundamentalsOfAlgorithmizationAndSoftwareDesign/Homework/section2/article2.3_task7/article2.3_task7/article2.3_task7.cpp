// article2.3_task7.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#define Pi 3.14

double circumference(double r)
{
    return 2 * Pi * r;
}

double areaOfTheCircle(double r)
{
    return Pi * pow(r, 2);
}

int main()
{
    double radius = 0;

    printf("Enter the radius of the circle:\n");
    scanf_s("%lf", &radius);
    printf("The circumference is %.2lf\n", circumference(radius));
    printf("The circumference is %.2lf\n", areaOfTheCircle(radius));
    return 0;
}

