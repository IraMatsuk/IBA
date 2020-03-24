// article2.3_task1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

static const double pi = 3.14;

double lateralSurfaceArea(double h, double r)
{
  return 2 * pi * h * r;
}

double totalSurfaceArea(double h, double r)
{
  return 2 * pi * r * (r + h);
}

double cylinderVolume(double h, double r)
{
  return pi * pow(r, 2) * h;
}

int main()
{
  double h = 0, r = 0;

  printf("Enter height of the cylinder\n");
  scanf_s("%lf", &h);
  printf("Enter radius of the cylinder\n");
  scanf_s("%lf", &r);

  printf("Lateral surface area is %.2lf\n", lateralSurfaceArea(h, r));
  printf("Total surface area is %.2lf\n", totalSurfaceArea(h, r));
  printf("Cylinder volume is %.2lf\n", cylinderVolume(h, r));
  return 0;
}