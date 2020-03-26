// article2.3_task10.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

double vectorLength(double x, double y, double z)
{
    return sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
}

double trianglePerimeter(double* x, double* y, double* z)
{
    if (!x || !y || !z) {
        return 0;
    }
    double ab[] = { x[1] - x[0], y[1] - y[0], z[1] - z[0] };
    double bc[] = { x[2] - x[1], y[2] - y[1], z[2] - z[1] };
    double ac[] = { x[2] - x[0], y[2] - y[0], z[2] - z[0] };
    double vectorLength_ab = vectorLength(ab[0], ab[1], ab[2]);
    double vectorLength_bc = vectorLength(bc[0], bc[1], bc[2]);
    double vectorLength_ac = vectorLength(ac[0], ac[1], ac[2]);
    return vectorLength_ab + vectorLength_bc + vectorLength_ac;
}

int main()
{
    double x[3];
    double y[3];
    double z[3];

    printf("Enter the coordinates of the points x1, y1, z1:\n");
    scanf_s("%lf%lf%lf", &x[0], &y[0], &z[0]);
    printf("Enter the coordinates of the points x2, y2, z2:\n");
    scanf_s("%lf%lf%lf", &x[1], &y[1], &z[1]);
    printf("Enter the coordinates of the points x3, y3, z3:\n");
    scanf_s("%lf%lf%lf", &x[2], &y[2], &z[2]);
    printf("The triangle perimetr is %.2lf\n", trianglePerimeter(x, y, z));
    return 0;
}

