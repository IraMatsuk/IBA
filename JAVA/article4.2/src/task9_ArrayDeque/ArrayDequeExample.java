package task9_ArrayDeque;
//Пример №9. Демонстрация применения класса ArrayDeque. САМОСТОЯТЕЛЬНО.
import java.util.ArrayDeque;

class ArrayDequeExample {
    public static void main(String[] args) {
        ArrayDeque<String> countries = new ArrayDeque<String>();
        countries.add("Германия");
        countries.addFirst("Франция");//добавляем элемент в начало
        countries.push("Великобритания");//добавляем элемент в начало коллекции
        countries.addLast("Испания");//добавляем элемент в конец коллекции
        countries.add("Беларусь");
        // получаем первый элемент без удаления
        System.out.println(countries.getFirst());
        // получаем последний элемент без удаления
        System.out.println(countries.getLast());
        System.out.println("Размер очереди:\n"+countries.size());
        // перебор коллекции
        while(countries.peek() != null) {
            // извлечение c начала
            System.out.println(countries.pop());
        }
    }
}
