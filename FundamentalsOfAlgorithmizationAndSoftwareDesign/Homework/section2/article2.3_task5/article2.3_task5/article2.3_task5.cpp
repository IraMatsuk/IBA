// article2.3_task5.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

double areaOfTheRightTriangle(double a, double b)
{
	return (1 / 2.0) * a * b;
}

double hypotenuseOfTheRightTriangle(double a, double b)
{
	return pow(a, 2) + pow(b, 2);
}

int main()
{
	double katet_a = 0, katet_b = 0;

	printf("Enter two numbers:\n");
	scanf_s("%lf%lf", &katet_a, &katet_b);
	printf("The area of the right triangle is %.2lf\n", areaOfTheRightTriangle(katet_a, katet_b));
	printf("The hypotenuse of the right triangle is %.2lf\n", hypotenuseOfTheRightTriangle(katet_a, katet_b));
	return 0;

}

