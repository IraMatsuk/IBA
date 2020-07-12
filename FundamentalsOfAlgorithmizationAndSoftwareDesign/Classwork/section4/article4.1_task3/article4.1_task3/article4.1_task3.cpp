// article4.1_task3.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

//������ �3. ������������ ������������� ������������ � ����������� ������
#include <iostream>
#include <windows.h>
using namespace std;
//�������� ������ ClientsQueue
class ClientsQueue {
	int arrayOfClients[100];//������ ��� �������� ��������� �������
	int indexAdd;//������ ���������� �������� � �������
	int indexRead;//������ ������������ �������� �� �������
	int sizeQueue;
public:
	ClientsQueue();//�����������
	~ClientsQueue();//����������
	void putClient(int element);
	int getClient();
};
//����������� ������������
ClientsQueue::ClientsQueue() {
	indexAdd = indexRead = 0;
	cout << "������� ������� ����������������.\n";
}
// ����������� �����������
ClientsQueue::~ClientsQueue() {
	cout << "������� ��������a.\n";
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
	ClientsQueue queueLegalEntity, queueNaturalPerson;//�������� ���� �������� ������ ClientsQueue
	const int LEGAL_ENTITY_SIZE = 15, NATURAL_ENTITY_SIZE = 20;
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