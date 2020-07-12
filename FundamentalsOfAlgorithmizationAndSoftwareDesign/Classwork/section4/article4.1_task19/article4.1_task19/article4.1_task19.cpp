// article4.1_task19.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �19. ������������� ������������� �������������
#include <iostream>
#include <ctime>
#include <windows.h>
using namespace std;

class Timer {
	int seconds;
public:
	//�������, ���������� � ���� ������
	Timer(const char* time) { seconds = atoi(time); }
	//�������, ���������� � ���� ������ �����
	Timer(int time) { seconds = time; }
	//�����, ���������� � ������� � ��������
	Timer(int min, int sec) { seconds = min * 60 + sec; }
	void run();
};
void Timer::run() {
	clock_t t1;
	t1 = clock();
	int k = 0;
	while ((clock() / CLOCKS_PER_SEC - t1 / CLOCKS_PER_SEC) < seconds);
	cout << "\a";//�������� ������
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	char str[80];
	int min, sec;
	Timer Timer1(5);
	Timer1.run();//������ 5 ������
	cout << "������ ���� ������" << endl;
	cout << "������� ���������� ������: ";
	cin >> str;
	Timer Timer2(str);
	Timer2.run();//������ 10 ������
	cout << "������ " << str << " ������" << endl;
	cout << "������� ������ � �������: ";
	cin >> min >> sec;
	Timer Timer3(min, sec);
	Timer3.run();//������ 1 ������ � 10 ������
	cout << "������ " << min << " ����� � " << sec << " ������" << endl;
	return 0;
}