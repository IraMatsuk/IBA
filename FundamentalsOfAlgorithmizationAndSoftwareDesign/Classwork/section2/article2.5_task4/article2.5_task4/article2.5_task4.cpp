// article2.5_task4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <windows.h>
#include <stdio.h>
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	int kids, * pKids;
	float price, * pPrice;
	char code, * pCode;
	price = 17.50;
	pPrice = &price;
	printf("\nСкольких детей вы ведете в аквапарк? ");
	scanf_s(" %d", &kids);
	pKids = &kids;
	printf("\nУ Вас есть скидка?");
	printf("\nВведите E для скидки сотрудника, S для скидки по программе Sav - More ");
	printf("или N если скидки нет: ");
	scanf_s(" %c", &code, 1);
	pCode = &code;
	printf("\nРабота с переменными : \n");
	printf("У вас %d детей...\n", kids);
	switch (code) {
	case ('E'):
		printf("Скидка сотрудника позволяет сэкономить 25 %% от цены ");
		printf("$%.2f price", price);
		printf("\nОбщая стоимость билетов: $%.2f",(price * .75 * kids));
		break;
	case ('S'):
		printf("Скидка Sav-more позволяет сэкономить 15 %% от цены");
		printf("$%.2f price", price);
		printf("\n Общая стоимость билетов: $%.2f",
			(price * .85 * kids));
		break;
	default: // Если введена N или неправильная буква
		printf("Вы заплатите полную стоимость билетов,");
		printf("которая составит $%.2f", price);
	}
	//повторим тот же код, использовав разыменованные указатели
	printf("\n\n\nРабота с указателями : \n");
	printf("У вас %d детей...\n", *pKids);
	switch (*pCode) {
	case ('E'):
		printf("Скидка сотрудника позволяет сэкономить 25 %% от цены ");
		printf("$%.2f price", *pPrice);
		printf("\nОбщая стоимость билетов: $%.2f", (*pPrice * .75 * *pKids));
		break;
	case ('S'):
		printf("Скидка Sav-more позволяет сэкономить 15 %% от цены");
		printf("$%.2f price", *pPrice);
		printf("\nОбщая стоимость билетов: $%.2f", (*pPrice * .85 *	*pKids));
		break;
	default: // Если введена N или неправильная буква
		printf("Вы заплатите полную стоимость билетов, ");
		printf("которая составит $%.2f", *pPrice * kids);
	}
	return(0);
}

