// article4.1_task18.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №18. Использование перегруженных конструкторов
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
	//время, задаваемое в минутах и секундах
	Timer(int min, int sec) { seconds = min * 60 + sec; }
	void run();
};
void Timer::run() {
	clock_t timeStart = clock(); // количество тактов
	while ((clock() / CLOCKS_PER_SEC - timeStart / CLOCKS_PER_SEC)
		< seconds);
	cout << "\a";//звуковой сигнал
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	Timer Timer1(5), Timer2("10"), Timer3(1, 10);
	Timer1.run();//отсчет пяти секунд
	cout << "Прошло пять секунд" << endl;
	Timer2.run();//отсчет десяти секунд
	cout << "Прошло десять секунд" << endl;
	Timer3.run();//отсчет одной минуты и десяти секунд
	cout << "Прошла одна минута и десять секунд" << endl;
	return 0;
}
