// article2.5_task1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//


#include <stdio.h>
#include <windows.h>

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    int gameScores[10] = { 12, 5, 21, 15, 32, 10 };
    int totalPoints = 0, i;
    float avg;
    for (i = 6; i < 10; i++) {
        printf("Очки игрока за игру №%d: ", i + 1);
        scanf_s(" %d", &gameScores[1]);
    }
    for (i = 0; i < 10; i++) { totalPoints += gameScores[i]; }
    avg = ((float)totalPoints / 10);
    printf("\n\nСреднее значение очков игрока: %.lf.\n", avg);
    return 0;
}

