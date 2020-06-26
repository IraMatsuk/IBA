// article2.7_task1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <locale.h>

int main()
{
    setlocale(LC_ALL, "rus");
    int i, userSize;
    float biggest, smallest;
    float* randomNums;
    float total = 0, average;
    srand(time(nullptr)); //инициализаци€ генератора случайных чисел
    printf("—колько случайных чисел будет в массиве? ");
    scanf_s(" %d", &userSize);
    //¬ыделить пам€ть под массив, число элементов которого совпадает с количеством случайных чисел, запрошенных пользователем
    randomNums = (float *)malloc(userSize * sizeof(float));
    //ѕроверка правильности выделени€ пам€ти дл€ массива
    if (!randomNums) {
        printf("ќшибка выделени€ массива случайных чисел!\n");
        exit(1);
    }

    //ѕроход по элементам массива и присвоение каждому элементу целого числа в диапазоне от 1 до 500
    for (i = 0; i < userSize; i++) 
        randomNums[i] = (rand() % 500) + 1;
        printf("—лучайные элементы массива: \n");      
    for (i = 0; i < userSize; i++) 
        printf("[%d]=%f\n", i + 1, randomNums[i]);
    //»нициализаци€ самого большого и самого маленького числа дл€ последующего сравнени€
    biggest = 0;
    smallest = 500;
    //ѕроход по заполненному массиву и поиск наибольшего и наименьшего чисел, а также сложение всех чисел и вычисление среднего
    for (i = 0; i < userSize; i++) {
        total += randomNums[i];
        if (randomNums[i] > biggest)
            biggest = randomNums[i];

        if (randomNums[i] < smallest)
            smallest = randomNums[i];
    }
    average = total / userSize;
    printf("Ќаибольшее случайное число: %f.\n", biggest);
    printf("Ќаименьшее случайное число: %f.\n", smallest);
    printf("—реднее значение случайных чисел: %.2f.\n", average);
    //ѕри использовании malloc не забудьте использовать free
    free(randomNums);
    return(0);
}

