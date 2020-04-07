// article2.6_task2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <malloc.h>

void charOutput(char symbol, int a, int b)
{
    char* symbols = (char*)calloc(a * b, sizeof(char));
    for (int i = 0; i < a * b; i++) {
        symbols[i] = symbol;
        printf("%c", symbols[i]);
    }
}

int main()
{
    char symbol;
    int numberChars, numberOfLines = 0;

    printf("Enter character: \n");
    scanf_s("%c", &symbol);
    printf("Enter the number of characters per line: \n");
    scanf_s("%d", &numberChars);
    printf("Enter the number of lines: \n");
    scanf_s("%d", &numberOfLines);
    charOutput(symbol, numberChars, numberOfLines);
    return 0;
}

