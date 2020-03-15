// example1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#include <locale.h>
//#include <stdlib.h> //если не работает русская кодировка, то можно попробовать этот вариант библиотеки
//#include <Windows.h> 
#define CURRENT_YEAR 2019 // глобальная константа, объявляется с помощью дерективы define, после имени константы пробем и дальше значение этой константы

int main()
{
	setlocale(LC_ALL, "Russian");
//	system("chcp 1251"); используется совместно с stdlib.h библиотекой
//	system("cls");
//	SetConsoleCP(1251); // используется для настройки русской кодировки с include Windows.h 
//	SetConsoleOutputCP(1251); // используется для настройки русской кодировки с include <Windows.h> и SetConsoleCP(1251)
	int yearBorn, userAge;  // переменные, объявленные в функции main и не инициализированные, хранят в себе какой-то мусор и мы не можем их использовать
	//printf("%d%d", yearBorn, userAge); // мы не имеем права пользоваться не инициализированными значениями

	printf("В каком году Вы родились?\n");
	scanf_s(" %d", &yearBorn); // пробел перед %d используется для того, чтобы пропустить пробел, символы табуляции, enter при вводе, & указывает на адрес ячейки памяти
	if (yearBorn > CURRENT_YEAR) {	
		printf("Вы еще не родились\n");
		printf("Введите еще раз год вашего рождения.\n");
		printf("В каком году Вы родились?\n");
		scanf_s(" %d", &yearBorn);
	}
	userAge = CURRENT_YEAR - yearBorn;
	printf("В этом году в День рождения Вам исполнится %d лет!\n", userAge);
	if ((yearBorn % 4 == 0)) printf("Вы родились в високосный год!\n");
	return 0;
}

