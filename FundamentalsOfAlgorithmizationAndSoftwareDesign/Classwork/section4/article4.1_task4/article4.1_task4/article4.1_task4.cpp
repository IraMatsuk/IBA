// article4.1_task4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �4. ������������� ������������������ ������������
#include <iostream>
#include <windows.h>
using namespace std;
//�������� ������ ClientsQueue
class ClientsQueue {
	int arrayOfClients[100];//������ ��� �������� ��������� �������
	int indexAdd;//������ ���������� �������� � �������
	int queueID;//����������������� ����� �������
	int indexRead;//������ ������������ �������� �� �������
	int sizeQueue;
public:
	ClientsQueue();//����������� ��� ����������
	ClientsQueue(int, int);//����������������� �����������
	~ClientsQueue();//����������
	void putClient(int client);
	int getClient();
};
//����������� ������������ ��� ����������
ClientsQueue::ClientsQueue() {
	indexAdd = indexRead = 0;
	sizeQueue = 30;
	cout << "������� ������� ����������������.\n";
}
//����������� �������������������� ������������
ClientsQueue::ClientsQueue(int queueID, int sizeQueue) {
	indexAdd = indexRead = 0;
	this->queueID = queueID;
	this->sizeQueue = sizeQueue;
	cout << "������� �" << this->queueID << " ����������������.\n";
}
// ����������� �����������
ClientsQueue::~ClientsQueue() {
	cout << "������� �" << queueID << " ���������. \n";
}
//����� ��������� � ������� �������������� ��������
void ClientsQueue::putClient(int client) {
	if ((indexAdd == sizeQueue)) {
		cout << "������� ���������.\n";
		return;
	}
	arrayOfClients[indexAdd++] = client;
}
//����� ���������� �� ������� �������������� ��������
int ClientsQueue::getClient() {
	if (indexRead == indexAdd) {
		cout << "������� �����.\n";
		return 0;
	}
	return arrayOfClients[indexRead++];
}
int main() {
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	const int LEGAL_ENTITY_SIZE = 15, NATURAL_ENTITY_SIZE = 20;
	ClientsQueue queueLegalEntity(1, LEGAL_ENTITY_SIZE),
		queueNaturalPerson(2, NATURAL_ENTITY_SIZE);//�������� ���� �������� ������ ClientsQueue
		for (int i = 1; i <= LEGAL_ENTITY_SIZE; i++) {
			queueLegalEntity.putClient(i);
		}
	for (int i = 1; i <= NATURAL_ENTITY_SIZE; i++) {
		queueNaturalPerson.putClient(i);
	}
	cout << "���������� ������� ���������� ��� (queueLegalEntity):";
		for (int i = 0; i < LEGAL_ENTITY_SIZE; i++) {
			cout << queueLegalEntity.getClient() << ",";
		}
	cout << endl;
	cout << "���������� ������� ����������� ��� (queueNaturalPerson) : ";
		for (int i = 0; i < NATURAL_ENTITY_SIZE; i++) {
			cout << queueNaturalPerson.getClient() << ",";
		}
	cout << endl;
	return 0;
}