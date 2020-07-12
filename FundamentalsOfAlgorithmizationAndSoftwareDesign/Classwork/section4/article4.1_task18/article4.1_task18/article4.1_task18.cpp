// article4.1_task18.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �18. ������������� ������������� �������������
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
	clock_t timeStart = clock(); // ���������� ������
	while ((clock() / CLOCKS_PER_SEC - timeStart / CLOCKS_PER_SEC)
		< seconds);
	cout << "\a";//�������� ������
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Timer Timer1(5), Timer2("10"), Timer3(1, 10);
	Timer1.run();//������ ���� ������
	cout << "������ ���� ������" << endl;
	Timer2.run();//������ ������ ������
	cout << "������ ������ ������" << endl;
	Timer3.run();//������ ����� ������ � ������ ������
	cout << "������ ���� ������ � ������ ������" << endl;
	return 0;
}
