// article2.3_task8.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

double surfaceAreaOfRectParallelepiped(double a, double b, double c)
{
    return 2 * (a * b + b * c + a * c);
}

double parallelepipedVolume(double h, double a, double b)
{
    return h * a * b;
}

int main()
{
    double side1 = 0, side2 = 0, side3 = 0;
    printf("Enter the length of one side of the rectangular parallelepiped:\n");
    scanf_s("%lf", &side1);
    printf("Enter the length of the second side of the rectangular parallelepiped:\n");
    scanf_s("%lf", &side2);
    printf("Enter the length of the third side of the rectangular parallelepiped:\n");
    scanf_s("%lf", &side3);
    printf("The surface area of a rectangular parallelepiped is %.3lf\n", surfaceAreaOfRectParallelepiped(side1, side2, side3));
    printf("The parallelepiped volume is %.3lf\n", parallelepipedVolume(side1, side2, side3));
    return 0;
}

