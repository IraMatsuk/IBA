package task14_LoopForEachInCollection;
//Пример №14. Применение цикла for each для перебора элементов коллекции
import java.util.ArrayList;

class ForEachDemo {
    public static void main(String[] args) {
        //создать списочный массив для целых чисел
        ArrayList<Integer> arrayList = new ArrayList<>();
        //ввести числовые значения в списочный массив
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);
        //организовать цикл для вывода числовых значений
        System.out.println("Исходное содержимое списочного массива arrayList:");
        arrayList.forEach(element -> System.out.println(element));
        int sum = 0;
        for (int element : arrayList) sum += element;
        System.out.println("Сумма числовых значений: " + sum);
    }
}
