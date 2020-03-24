// article2.3_task2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

double cubeVolume(double cubeEdgeLength)
{
  return pow(cubeEdgeLength, 3);
}

double cubeSurfaceArea(double cubeEdgeLength)
{
  return 6 * pow(cubeEdgeLength, 2);
}

int main()
{
  double cubeEdgeLength = 0;

  printf("Enter the length of cube edge\n");
  scanf_s("%lf", &cubeEdgeLength);

  printf("The cube volume is %.3lf\n", cubeVolume(cubeEdgeLength));
  printf("The cube volume is %.3lf\n", cubeSurfaceArea(cubeEdgeLength));
  return 0;
}

