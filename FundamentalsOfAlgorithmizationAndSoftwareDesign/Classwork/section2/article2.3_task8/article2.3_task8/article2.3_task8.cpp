// article2.3_task8.cpp : This file contains the 'main' function. Program execution begins and ends there.

// Привер №8. Использование форматированного вывода данных

#include <stdio.h>

int main()
{

    /* Вот еще код, помогающий освоить функцию printf(),
    Управляющие последовательности и Символы преобразования */
    printf("Quantity\tCost\tTotal\n");
    printf("%d\t\t$%.2f\t$%.2f\n", 3, 9.99, 29.97);
    printf("Too many spaces \b\b\b\b can be fixed with the ");
    printf("        %c Escape character\n", 'b');
    printf("\n\a\n\n\nSkip a few lines, and beep");
    printf("%s %c.", "You are kicking but learning", 'C');
    printf("You just finished chapter %d. \nYou have finished ", 4);
    printf("%.1f%c of the book.\n", 12.500, '%');
    printf("\n\nOne third equals %.2f or ", 0.333333);
    printf("%.3f or %.4f or ", 0.333333, 0.333333);
    printf("%.5f or %.6f\n\n\n", 0.333333, 0.333333);
    return 0;
}


