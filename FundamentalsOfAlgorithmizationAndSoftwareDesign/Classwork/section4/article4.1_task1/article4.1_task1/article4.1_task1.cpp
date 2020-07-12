// article4.1_task1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №1. Пример работы с классом ClientsQueue. Программа может
//быть использована, например, в следующей ситуации : банк планирует
//ввести электронную очередь обслуживания своих клиентов, для чего
//в единый список клиентов, желающих получить обслуживание, будут добавляться их идентификационные номера
#include <windows.h>
#include <iostream>
using namespace std;
//Создание класса ClientsQueue
class ClientsQueue {
private: // атрибут доступа (нижеперечисленные поля будут закрыты для всех других конструкций кроме этого класса)
	int arrayOfClients[100];//Массив для хранения элементов очереди
	int indexAdd;//индекс заносимого элемента в очередь
	int indexRead;//индекс считываемого элемента из очереди
	int sizeQueue;
public:
	void init(int); //объявление метода (прототип)
	void putClient(int client);
	int getClient();
};
//Метод инициализации объекта класса ClientsQueue
void ClientsQueue::init(int sizeQueue) { //определение метода
	indexRead = indexAdd = 0;
	this->sizeQueue = sizeQueue;
}
//Метод занесения в очередь целочисленного значения
void ClientsQueue::putClient(int client) {
	if (indexAdd == sizeQueue) {
		cout << "Очередь заполнена.\n";
		return;
	}
	arrayOfClients[indexAdd++] = client;
}
//Метод извлечения из очереди целочисленного значения
int ClientsQueue::getClient() {
	if (indexRead == indexAdd) {
		cout << "Очередь пуста.\n";
		return 0;
	}
	return arrayOfClients[indexRead++];
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	ClientsQueue queueLegalEntity, queueNaturalPerson;//Создание двух объектов класса ClientsQueue
	const int LEGAL_ENTITY_SIZE = 15, NATURAL_ENTITY_SIZE = 20;
	queueLegalEntity.init(LEGAL_ENTITY_SIZE);
	queueNaturalPerson.init(NATURAL_ENTITY_SIZE);
	for (int i = 1; i <= LEGAL_ENTITY_SIZE; i++) {
		queueLegalEntity.putClient(i);
	}
	for (int i = 1; i <= NATURAL_ENTITY_SIZE; i++) {
		queueNaturalPerson.putClient(i);
	}
	cout << "Содержимое очереди юридических лиц (queueLegalEntity) : ";
		for (int i = 0; i < LEGAL_ENTITY_SIZE; i++) {
			cout << queueLegalEntity.getClient() << ",";
		}
	cout << endl;
	cout << "Содержимое очереди физических лиц (queueNaturalPerson):";
		for (int i = 0; i < NATURAL_ENTITY_SIZE; i++) {
			cout << queueNaturalPerson.getClient() << ",";
		}
	cout << endl;
	return 0;
}
