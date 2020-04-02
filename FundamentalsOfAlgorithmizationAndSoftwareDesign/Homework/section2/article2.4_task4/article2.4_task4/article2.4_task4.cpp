// article2.4_task4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <locale.h>

void concatStrings()
{
    const char a[] = "Ин";
    char b[] = "форма";
    char c[] = "тика";
    char strA[20];
    strcpy_s(strA, sizeof(strA), a);
    strcat_s(strA, sizeof(strA), b);
    strcat_s(strA, sizeof(strA), c);
    return;
}

void concatStringsDymanicAlloc()
{
    const char a[] = "Ин";
    char b[] = "форма";
    char c[] = "тика";
    size_t strSize = (strlen(a) + strlen(b) + strlen(c) + 1);
    char *strA = (char*) malloc(strSize);

    strcpy_s(strA, strSize, a);
    strcat_s(strA, strSize, b);
    strcat_s(strA, strSize, c);
    free(strA);
    return;
}

int main()
{
    setlocale(LC_ALL, "rus"); 
    concatStrings();
    concatStringsDymanicAlloc();
    return 0;
}

