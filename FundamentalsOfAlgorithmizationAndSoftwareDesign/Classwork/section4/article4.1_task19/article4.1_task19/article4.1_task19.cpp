// article4.1_task19.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//ѕример є19. »спользование перегруженных конструкторов
#include <iostream>
#include <ctime>
#include <windows.h>
using namespace std;

class Timer {
	int seconds;
public:
	//секунды, задаваемые в виде строки
	Timer(const char* time) { seconds = atoi(time); }
	//секунды, задаваемые в виде целого числа
	Timer(int time) { seconds = time; }
	//врем€, задаваемое в минутах и секундах
	Timer(int min, int sec) { seconds = min * 60 + sec; }
	void run();
};
void Timer::run() {
	clock_t t1;
	t1 = clock();
	int k = 0;
	while ((clock() / CLOCKS_PER_SEC - t1 / CLOCKS_PER_SEC) < seconds);
	cout << "\a";//звуковой сигнал
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	char str[80];
	int min, sec;
	Timer Timer1(5);
	Timer1.run();//отсчет 5 секунд
	cout << "ѕрошло п€ть секунд" << endl;
	cout << "¬ведите количество секунд: ";
	cin >> str;
	Timer Timer2(str);
	Timer2.run();//отсчет 10 секунд
	cout << "ѕрошло " << str << " секунд" << endl;
	cout << "¬ведите минуты и секунды: ";
	cin >> min >> sec;
	Timer Timer3(min, sec);
	Timer3.run();//отсчет 1 минуты и 10 секунд
	cout << "ѕрошло " << min << " минут и " << sec << " секунд" << endl;
	return 0;
}