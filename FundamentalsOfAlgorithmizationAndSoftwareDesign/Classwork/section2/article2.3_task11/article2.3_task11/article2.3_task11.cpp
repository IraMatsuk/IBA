// article2.3_task11.cpp : This file contains the 'main' function. Program execution begins and ends there.

//Пример №11. Программа, перечисляющая трех детей, их потребности в школьных принадлежностях,
//а также стоимость их приобретения 

#include <stdio.h>
#include <string.h>
#include <locale.h>
#include "MyConstant.h"

int main()
{
    setlocale(LC_ALL, "");
    int age;
    char childname[14] = "Тимофей";
    printf("\n%s имеют %d детей\n", FAMILY, KIDS);
    age = 11;
    printf("Старший сын, %s, %d лет.\n", childname, age);
    strcpy_s(childname, sizeof(childname), "Николай");
    age = 6;
    printf("Средний сын, %s, %d.\n", childname, age);
    age = 3;
    strcpy_s(childname, sizeof(childname), "Борис");
    printf("Младший сын, %s, %d.\n", childname, age);
    return 0;
}


