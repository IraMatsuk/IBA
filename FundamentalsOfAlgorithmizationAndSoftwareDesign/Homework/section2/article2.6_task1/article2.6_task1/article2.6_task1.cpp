// article2.6_task1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

double minDegree(double x, double y, int degree)
{
	if (x == y) {
		printf("The numbers are equals.\n");	
		return x;
	} else if (pow(x, degree) < pow(y, degree)) {
		return x;
	} else {
		return y;
	}
}

int main()
{
	double x, y;
	int degree = 0;

	printf("Enter two double numbers:\n");
	scanf_s("%lf%lf", &x, &y);
	printf("Enter the degree to which to raise the number:\n");
	scanf_s("%d", &degree);
	printf("The min degree number is %lf:\n", minDegree(x, y, degree));
	return 0;
}

