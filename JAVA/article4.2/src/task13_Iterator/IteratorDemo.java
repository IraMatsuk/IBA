package task13_Iterator;
//Пример №13. Демонстрация применения итераторов
import java.util.*;

class IteratorDemo {
    public static void main(String args[]) {
        // создать списочный массив
        ArrayList<String> arrayList = new ArrayList<String>();
        // ввести элементы в списочный массив
        arrayList.add("Иванов Иван");
        arrayList.add("Переходцева Ирина");
        arrayList.add("Петровский Максим");
        arrayList.add("Захаренко Юлия");
        arrayList.add("Зарудный Илья");
        arrayList.add("Петроченко Александр");
        // использовать итераторы для вывода содержимого списочного массива arrayList
        System.out.println("Исходное содержимое списочного массива сотрудников: ");
        Iterator<String> iterator = arrayList.iterator();
        while (iterator.hasNext()) {
            String element = iterator.next();
            System.out.println(element + " ");
        }
        System.out.println();
        // изменить перебираемыe объекты
        ListIterator<String> listIterator = arrayList.listIterator();
        while (listIterator.hasNext()) {
            String element = listIterator.next();
            listIterator.set(element + "+");
        }
        System.out.println("Измененное содержимое списочного массива сотрудников: ");
        iterator = arrayList.iterator();
        while (iterator.hasNext()) {
            String element = iterator.next();
            System.out.println(element + " ");
        }
        System.out.println();
        // отобразить список в обратном порядке
        System.out.println("Список сотрудников в обратном порядке: ");
        while (listIterator.hasPrevious()) {
            String element = listIterator.previous();
            System.out.println(element + " ");
        }
    }
}
