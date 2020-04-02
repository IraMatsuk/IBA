// article2.4_task3.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

void printSquareOfNaturalNumbers(int a, int b)
{
    for (int i = a; i <= b; i++) {
        printf("%d * %d = %d \n", i, i, i * i);
    }
}

int main()
{
    int a = 0, b = 0;
    printf("Enter two integers:\n");
    scanf_s("%d%d", &a, &b);
    printSquareOfNaturalNumbers(a, b);
    return 0;
}
