package task10_EnumSet;
//Пример №10. Использование коллекции EnumSet
import java.util.EnumSet;
import java.util.Iterator;
import java.util.Set;

class EnumSetExample {
    public static void main(String[] args) {
        EnumSet<Days> setForСleaningCompany = EnumSet.of(Days.MONDAY, Days.TUESDAY, Days.WEDNESDAY,
                Days.FRIDAY);
        System.out.println("Дни работы сотрудников клининговой компании:");
        Iterator<Days> iter = setForСleaningCompany.iterator();
        while (iter.hasNext())
            System.out.println(iter.next().getName());
        EnumSet<Days> setForCleaningFree = EnumSet.complementOf((setForСleaningCompany));
        System.out.println("Дни, в которые клининговая компания не работает:");
        iter = setForCleaningFree.iterator();
        while (iter.hasNext())
            System.out.println(iter.next().getName());
    }
}
