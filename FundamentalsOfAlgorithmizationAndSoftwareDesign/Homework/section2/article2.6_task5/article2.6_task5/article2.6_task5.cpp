// article2.6_task5.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

int valueCalculation(int a, int b, int f)
{
    return (a + b - f / a) + f * a * a - (a + b);
}

int main()
{
    int a, b, f = 0;

    printf("You have a formula: (a + b - f / a) + f * a * a - (a + b) \n");
    printf("Enter the value of variable a: \n");
    scanf_s("%d", &a);
    printf("Enter the value of variable b: \n");
    scanf_s("%d", &b);
    printf("Enter the value of variable f: \n");
    scanf_s("%d", &f);
    printf("The result is: %d", valueCalculation(a, b, f));
}

