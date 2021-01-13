package task5_LinkedHashSetVSHashSet;
//Пример №5. Сравнение классов LinkedHashSet и HashSet. САМОСТОЯТЕЛЬНО
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;

public class LinkedHashSetVSHashSet {
    public static void main(String[] args) {
        HashSet<Integer> hashSet = new HashSet();
        hashSet.add(20);
        hashSet.add(11);
        hashSet.add(3);
        hashSet.add(5);
        hashSet.add(40);
        Iterator iterator = hashSet.iterator();
        System.out.println("Cодержимое HashSet:");
        while (iterator.hasNext()) {
            System.out.print(iterator.next() + " ");
        }
        System.out.println();
        System.out.println("------------------------------");
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        linkedHashSet.add(20);
        linkedHashSet.add(11);
        linkedHashSet.add(3);
        linkedHashSet.add(5);
        linkedHashSet.add(40);
        System.out.println("Cодержимое LinkedHashSet:");
        iterator = linkedHashSet.iterator();
        while (iterator.hasNext()) {
            System.out.print(iterator.next() + " ");
        }
    }
}
