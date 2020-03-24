// article2.3_task3.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

static const double pi = 3.14;

double ballVolume(double radius)
{
  return (4 / 3.0) * pi * pow(radius, 3);
}

double ballSurfaceArea(double radius)
{
  return 4 * pi * pow(radius, 2);
}

int main()
{
  double radius = 0;

  printf("Enter the radius of the ball:\n");
  scanf_s("%lf", &radius);

  printf("The volume of the ball is %.2lf\n", ballVolume(radius));
  printf("The ball surface area is %.2lf\n", ballSurfaceArea(radius));
}


