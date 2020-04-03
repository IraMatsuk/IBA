// article2.4_task6.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

int main()
{
    int a = 0, b = 0;
    int c = a + b;

    printf("Enter two digital numbers and the result of their addition\n");
    scanf_s("%d%d%d", &a, &b ,&c);
    if (a + b == c) {
        printf("Your result is right! %d + %d = %d\n", a, b, c);
    }
    else {
        printf("Your answer is incorrect! %d + %d != %d\n", a, b, c);
    }
    return 0;
}

