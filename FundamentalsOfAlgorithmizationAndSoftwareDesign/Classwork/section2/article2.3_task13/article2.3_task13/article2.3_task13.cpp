// article2.3_task13.cpp : This file contains the 'main' function. Program execution begins and ends there.

//Пример №13. Программа запрашивает у пользователя данные, после
//чего выводит на экран, то, что было введено

#include <stdio.h>
#include <windows.h>

int main()
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	char topping[24];
	int slices = 0;
	int month, day, year;
	float price;

	//первый вызов функции scanf считывает переменную типа 
	//float для сохранения стоимости пиццы. Если пользователь не
	//введет знак $ перед ценой, то возникнут ошибки в программе
	printf("Сколько стоит пицца в вашем районе?");
	printf("\n(Введите как XX.XX)\n");
	scanf_s(" %f", &price);
	printf("Какая ваша любимая начинка (одним словом)?\n");
	scanf_s(" %s", topping, 24);//Начинка пиццы - строка, поэтому & не нужен
	printf("Сколько пицц с начинкой %s", topping);
	printf(" вы можете съесть за раз?\n");
	scanf_s(" %d", &slices);
	printf("Какое сегодня число? (Введите ХХ/ХХ/ХХ)\n");
	scanf_s(" %d/%d/%d", &month, &day, &year);
	printf("\n\nПочему бы не угостить себя ужином %d/%d/%d", month, day, year);
	printf("\nи не съесть %d пиццы с начинкой %s?\n", slices, topping);
	printf("Это будет стоить лишь $%.2f!\n\n\n", price*slices);
	return 0;


}

