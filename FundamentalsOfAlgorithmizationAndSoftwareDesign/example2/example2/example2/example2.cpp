// example2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
//#include <stdlib.h>
#include <locale.h>
#define CURRENT_YEAR 2019

int main()
{
//	system("chcp 1251");
//	system("cls");
	setlocale(LC_ALL, "Russian");
	int yearBorn, userAge;
	printf("В каком году вы родились?\n");
	scanf_s(" %d", &yearBorn);
	if (yearBorn > CURRENT_YEAR) {
		printf("Правда? Вы еще не родились\n");
		printf("Поздравляем с путешествие во времени\n");
	}
	else {
		userAge = CURRENT_YEAR - yearBorn;
		printf("В этом году в День рождения Вам исполнится %d лет!\n", userAge);
	}
	if ((yearBorn % 4 == 0)) printf("Вы родились в високосный год!\n");
	return 0;
}