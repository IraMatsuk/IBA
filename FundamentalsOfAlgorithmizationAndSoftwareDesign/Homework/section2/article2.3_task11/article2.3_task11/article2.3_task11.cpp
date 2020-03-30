// article2.3_task11.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#define Pi 3.1415

double coneLateralSurfaceArea(double r, double l)
{
    return Pi * r * l;
}

double coneTotalSurfaceArea(double r, double l)
{
    return Pi * r * (r + l);
}

double coneVolume(double r, double h)
{
    return (h / 3.0) * Pi * pow(r, 2);
}


int main()
{
    double radius = 0, length = 0, height = 0;

    printf("Enter the radius of the cone:\n");
    scanf_s("%lf", &radius);
    printf("Enter the length of the edge of the cone:\n");
    scanf_s("%lf", &length);
    printf("Enter the height of the cone:\n");
    scanf_s("%lf", &height);
    printf("The cone lateral surface area is %.3lf\n", coneLateralSurfaceArea(radius, length));
    printf("The total surface area of ​​the cone is %.3lf\n", coneTotalSurfaceArea(radius, length));
    printf("The cone volume is %.3lf\n", coneVolume(radius, height));
    return 0;
 }
