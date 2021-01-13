package task15;
//Пример №15. Реализация обработки списка почтовых адресов. ЗАДАНИЕ:
//СОЗДАТЬ ПРИЛОЖЕНИЕ, ПОЗВОЛЯЮЩЕЕ СОХРАНЯТЬ В КОЛЛЕКЦИИ НАБОР АДРЕСОВ
//ПОЛЬЗОВАТЕЛЕЙ. САМОЙ ЧАСТОЙ ОПЕРАЦИЕЙ БУДЕТ ДОБАВЛЕНИЕ АДРЕСА.
import java.util.*;

class MailList {
    public static void main(String args[]) {
        LinkedList<Address> addressLinkedList = new LinkedList<Address>();
        //ввести элементы в связный список
        addressLinkedList.add(new Address("Сидоров Игнат Васильевич", "пр. Независимости", "Минск", "61801"));
        addressLinkedList.add(new Address("Сидоров Павел Васильевич", "пр. Независимости", "Брест", "61853"));
        addressLinkedList.add(new Address("Сидорова Людмила Васильевна", "пр. Независимости", "Гомель", "61820"));
        //вывести список почтовых адресов
        for (Address element : addressLinkedList) {
            System.out.println(element + "\n");
        }
    }
}
