// article2.5_task3.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <windows.h>
#include <stdio.h>

int main()
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	int gameScores[10] = { 12, 5, 21, 15, 32, 10, 6, 31, 11, 10 };
	int gameRebound[10] = { 5, 7, 1, 5, 10, 6, 31, 11, 10 };
	int gameAssists[10] = { 2, 9, 4, 3, 6, 1, 11, 6, 9, 10 };
	int bestGame = 0;
	int bestGameNum = 0;
	int i;
	for (i = 0; i < 10; i++) {
		if (gameScores[i] > bestGame) {
			bestGame = gameScores[i];
			bestGameNum = i;
		}
	}
	printf("\n\n���� ������ � ����� �������������� ����:\n");
	printf("����� �������������� ����� ���� �%d\n", bestGameNum + i);
	printf("���������� %d �����\n", gameScores[bestGameNum]);
	printf("��������� %d �����\n", gameRebound[bestGameNum]);
	printf("������������ %d ������� �������\n", gameAssists[bestGameNum]);
	return 0;
}

