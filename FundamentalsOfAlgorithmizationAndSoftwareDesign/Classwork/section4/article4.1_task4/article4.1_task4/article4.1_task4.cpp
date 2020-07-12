// article4.1_task4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//Пример №4. Использование параметризованного конструктора
#include <iostream>
#include <windows.h>
using namespace std;
//Создание класса ClientsQueue
class ClientsQueue {
	int arrayOfClients[100];//Массив для хранения элементов очереди
	int indexAdd;//индекс заносимого элемента в очередь
	int queueID;//идентификационный номер очереди
	int indexRead;//индекс считываемого элемента из очереди
	int sizeQueue;
public:
	ClientsQueue();//конструктор без параметров
	ClientsQueue(int, int);//параметризованный конструктор
	~ClientsQueue();//деструктор
	void putClient(int client);
	int getClient();
};
//Определение конструктора без параметров
ClientsQueue::ClientsQueue() {
	indexAdd = indexRead = 0;
	sizeQueue = 30;
	cout << "Очередь успешно инициализирована.\n";
}
//Определение параметризированного конструктора
ClientsQueue::ClientsQueue(int queueID, int sizeQueue) {
	indexAdd = indexRead = 0;
	this->queueID = queueID;
	this->sizeQueue = sizeQueue;
	cout << "Очередь №" << this->queueID << " инициализирована.\n";
}
// Определение деструктора
ClientsQueue::~ClientsQueue() {
	cout << "Очередь №" << queueID << " разрушена. \n";
}
//Метод занесения в очередь целочисленного значения
void ClientsQueue::putClient(int client) {
	if ((indexAdd == sizeQueue)) {
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
	const int LEGAL_ENTITY_SIZE = 15, NATURAL_ENTITY_SIZE = 20;
	ClientsQueue queueLegalEntity(1, LEGAL_ENTITY_SIZE),
		queueNaturalPerson(2, NATURAL_ENTITY_SIZE);//Создание двух объектов класса ClientsQueue
		for (int i = 1; i <= LEGAL_ENTITY_SIZE; i++) {
			queueLegalEntity.putClient(i);
		}
	for (int i = 1; i <= NATURAL_ENTITY_SIZE; i++) {
		queueNaturalPerson.putClient(i);
	}
	cout << "Содержимое очереди физических лиц (queueLegalEntity):";
		for (int i = 0; i < LEGAL_ENTITY_SIZE; i++) {
			cout << queueLegalEntity.getClient() << ",";
		}
	cout << endl;
	cout << "Содержимое очереди юридических лиц (queueNaturalPerson) : ";
		for (int i = 0; i < NATURAL_ENTITY_SIZE; i++) {
			cout << queueNaturalPerson.getClient() << ",";
		}
	cout << endl;
	return 0;
}