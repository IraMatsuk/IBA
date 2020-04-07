// article2.6_task4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

double min(double x, double y)
{
    return x < y ? x : y;
}

double max(double x, double y)
{
    return x < y ? y : x;
}

void sort(double* px, double* py, double* pz)
{
    double maximum = max(max(*px, *py), *pz);
    double minimum = min(min(*px, *py), *pz);
    double middle = 0;

    if (*px != minimum && *px != maximum) {
        middle = *px;
    }
    if (*py != minimum && *py != maximum) {
        middle = *py;
    }
    if (*pz != minimum && *pz != maximum) {
        middle = *pz;
    }
    *px = minimum;
    *py = middle;
    *pz = maximum;
}

int main()
{
    double x, y, z = 0;

    printf("Enter 3 numbers: \n");
    scanf_s("%lf%lf%lf", &x, &y, &z);
    sort(&x, &y, &z);
    printf("Minimum = %.3lf, middle = %.3lf, maximum = %.3lf.\n", x, y, z);
    return 0;
}