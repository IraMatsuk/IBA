// article2.3_task9.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

double pointsDistance(double x1, double x2, double y1, double y2)
{
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
}

int main()
{
    double x1 = 0, x2 = 0, y1 = 0, y2 = 0;

    printf("Enter the coordinates of the point x1:\n");
    scanf_s("%lf", &x1);
    printf("Enter the coordinates of the point x2:\n");
    scanf_s("%lf", &x2);
    printf("Enter the coordinates of the point y1:\n");
    scanf_s("%lf", &y1);
    printf("Enter the coordinates of the point y2:\n");
    scanf_s("%lf", &y2);
    printf("The distance between two points is %.2lf\n", pointsDistance(x1, x2, y1, y2));
    return 0;
}

