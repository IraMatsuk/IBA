// article2.3_task4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

double arithmeticalMeanOfTheModulesOfTwoNumbers(double number1, double number2)
{
  return (number1 + number2) / 2;
}

double geometricMeanOfTheModulesOfTwoNumbers(double number1, double number2)
{
  return sqrt(number1 * number2);
}

int main()
{
  double number1 = 0, number2 = 0;

  printf("Enter two numbers:\n");
  scanf_s("%lf", &number1);
  scanf_s("%lf", &number2);
  printf("The arithmetical mean of two numbers is %.3lf\n", arithmeticalMeanOfTheModulesOfTwoNumbers(number1, number2));
  printf("The geometric mean of two numbers is %.3lf\n", geometricMeanOfTheModulesOfTwoNumbers(number1, number2));
  return 0;
}

