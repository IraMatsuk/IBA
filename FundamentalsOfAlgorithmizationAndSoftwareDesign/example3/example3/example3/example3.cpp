#include <stdio.h>
//#include <stdlib.h>
#include <locale.h>

int main()
{
	setlocale(LC_ALL, "Russian");
	//system("chcp 1251");
	//system("color F0");
	//system("cls");

	int userPreference;
	printf("Насколько вы счастливы (по шкале от 1 до 10)?\n");
	scanf_s(" %d", &userPreference);

	if (userPreference >= 8) {
		printf("Мы Вас поздравляем!\n");
		printf("У Вас все хорошо!\n");
	}
	else if (userPreference >= 5) {
		printf("Чуть выше среднего, не так ли?\n");
		printf("Может быть, вскоре все станет еще лучше!\n");
	}
	else if (userPreference >= 3) {
		printf("Сожалеем, что Вам не очень хорошо.\n");
		printf("Надеемся, вскоре всё исправится…\n");
	}
	else {
		printf("Держитесь, все исправится, не так ли?\n");
		printf("Перед зарей всегда темнеет.\n");
	}
	return 0;
}