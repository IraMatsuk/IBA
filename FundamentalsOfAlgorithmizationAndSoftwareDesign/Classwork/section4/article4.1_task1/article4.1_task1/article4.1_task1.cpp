// article4.1_task1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �1. ������ ������ � ������� ClientsQueue. ��������� �����
//���� ������������, ��������, � ��������� �������� : ���� ���������
//������ ����������� ������� ������������ ����� ��������, ��� ����
//� ������ ������ ��������, �������� �������� ������������, ����� ����������� �� ����������������� ������
#include <windows.h>
#include <iostream>
using namespace std;
//�������� ������ ClientsQueue
class ClientsQueue {
private: // ������� ������� (����������������� ���� ����� ������� ��� ���� ������ ����������� ����� ����� ������)
	int arrayOfClients[100];//������ ��� �������� ��������� �������
	int indexAdd;//������ ���������� �������� � �������
	int indexRead;//������ ������������ �������� �� �������
	int sizeQueue;
public:
	void init(int); //���������� ������ (��������)
	void putClient(int client);
	int getClient();
};
//����� ������������� ������� ������ ClientsQueue
void ClientsQueue::init(int sizeQueue) { //����������� ������
	indexRead = indexAdd = 0;
	this->sizeQueue = sizeQueue;
}
//����� ��������� � ������� �������������� ��������
void ClientsQueue::putClient(int client) {
	if (indexAdd == sizeQueue) {
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
	ClientsQueue queueLegalEntity, queueNaturalPerson;//�������� ���� �������� ������ ClientsQueue
	const int LEGAL_ENTITY_SIZE = 15, NATURAL_ENTITY_SIZE = 20;
	queueLegalEntity.init(LEGAL_ENTITY_SIZE);
	queueNaturalPerson.init(NATURAL_ENTITY_SIZE);
	for (int i = 1; i <= LEGAL_ENTITY_SIZE; i++) {
		queueLegalEntity.putClient(i);
	}
	for (int i = 1; i <= NATURAL_ENTITY_SIZE; i++) {
		queueNaturalPerson.putClient(i);
	}
	cout << "���������� ������� ����������� ��� (queueLegalEntity) : ";
		for (int i = 0; i < LEGAL_ENTITY_SIZE; i++) {
			cout << queueLegalEntity.getClient() << ",";
		}
	cout << endl;
	cout << "���������� ������� ���������� ��� (queueNaturalPerson):";
		for (int i = 0; i < NATURAL_ENTITY_SIZE; i++) {
			cout << queueNaturalPerson.getClient() << ",";
		}
	cout << endl;
	return 0;
}
