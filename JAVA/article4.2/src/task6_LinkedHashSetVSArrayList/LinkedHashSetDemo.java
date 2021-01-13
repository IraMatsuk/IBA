package task6_LinkedHashSetVSArrayList;
//Пример №6. Демонстрация применения класса LinkedHashSet и метода retainAll(Collection<? extends E> c)
import java.util.ArrayList;
import java.util.LinkedHashSet;

class LinkedHashSetDemo {
    public static void main(String[] args) {
        LinkedHashSet<String> linkedHashSet = new LinkedHashSet<String>();
        linkedHashSet.add("Андреенко Елена");
        linkedHashSet.add("Баденкова Оксана");
        linkedHashSet.add("Беседа Мария");
        linkedHashSet.add("Борбух Владимир");
        linkedHashSet.add("Ковальчук Александр");
        System.out.println("Список сотрудников: ");
        for (String s : linkedHashSet) {
            System.out.println(s);
        }
        ArrayList<String> arrayList = new ArrayList<String>();
        arrayList.add("Андреенко Елена");
        arrayList.add("Борбух Владимир");
        arrayList.add("Ковальчук Александр");
        arrayList.add("Ковальчук Александр");
        System.out.println("Список сотрудников, которые едут в командировку: ");
        for (String s : arrayList) {
            System.out.println(s);
        }
         /* Retains only the elements in this collection that are
        contained in the specified collection.
        In other words, removes from this collection all of its
        elements that are not contained in the specified collection.*/
        boolean isRetained = linkedHashSet.retainAll(arrayList);
        System.out.println("успешно сформирован список командировки: " + (isRetained ? "да" : "нет"));
        System.out.println("Список сотрудников, которые едут в командировку: ");
        for (String s : linkedHashSet) {
            System.out.println(s);
        }
    }
}
