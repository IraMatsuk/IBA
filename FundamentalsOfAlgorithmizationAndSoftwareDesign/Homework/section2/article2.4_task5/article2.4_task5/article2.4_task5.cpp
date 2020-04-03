// article2.4_task5.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

unsigned long long  factorialCalculation(int number)
{
    if (number == 0 || number == 1) {
        return 1;
    }
    return number * factorialCalculation(number - 1);
 }

unsigned long long factNum(int num)
{
    if (num == 0 || num == 1) {
        return 1;
    }
    unsigned long long r = 1;
    for (int i = 2; i <= num; ++i) {
        r *= i;
    }
    return r;
}

int main()
{
    int n;
    printf("Input a number equal or more than zero: ");
    scanf_s("%d", &n);
    printf("Factorial of the number is %llu\n", factorialCalculation(n));
    printf("Factorial of the number is %llu\n", factNum(n));
    return 0;
}

