// article2.6_task3.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

void larger_of(double *x, double *y)
{
    *x > * y ? *y = *x : *x = *y;
}

int main()
{
    double x, y = 0;

    printf("Enter two double numbers: \n");
    scanf_s("%lf%lf", &x, &y);
    larger_of(&x, &y);  
    printf("x = %.3lf, y = %.3lf", x, y);
    return 0;
}

