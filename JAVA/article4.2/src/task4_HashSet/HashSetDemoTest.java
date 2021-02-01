package task4_HashSet;
//Пример №4. Демонстрация применения класса HashSet.
//Вопрос: почему порядок вывода содержимого объекта hashSet не соответствует порядку
//добавления элементов в множество?
/*  HashSet инкапсулирует в себе объект HashMap (то-есть использует для хранения хэш-таблицу).
Механизм хеширования, в котором содержимое ключа используется для определения уникального значения,
называемого хеш-кодом. Этот хеш-код затем применяется в качестве индекса, с которым
ассоциируются данные, доступные по этому ключу. Преобразование ключа в хеш-код
выполняется автоматически. Также ваш код не может напрямую индексировать хеш-таблицу.
Выгода от хеширования состоит в том, что оно обеспечивает
константное время выполнения методов add(), contains(), remove() и size() */
import java.util.HashSet;
import static org.junit.Assert.*;
public class HashSetDemoTest {
    HashSet<String> hashSet;
    HashSet<String> clonedHashSet;
    @org.junit.jupiter.api.Test // юнит-тесты
    //	@Test указывает, что данный метод (public void) может быть запущен, как тестовый случай.
    public void test() {
        // создать хеш-множество
        hashSet = new HashSet<String>();
        // добавить элементы в хеш-множество
        hashSet.add("Славянская Елена");
        hashSet.add("Левандовская Анна");
        hashSet.add("Владова Алина");
        hashSet.add("Поплавская Эльвира");
        hashSet.add("Воронцова Наталья");
        hashSet.add("Южная Елизавета");
        for(String s : hashSet) {
            System.out.println(s);
        }
        clonedHashSet = (HashSet<String>) hashSet.clone();
        clonedHashSet = (HashSet<String>) hashSet.clone(); //создат копию, при этом выделяет новый участок памяти
        System.out.println("--------------------------------------");
        System.out.println("Дубликат хеш-множества:");
        for(String s : clonedHashSet) {
            System.out.println(s);
        }
        assertEquals(hashSet, clonedHashSet); //assertEquals - ожидаемый результат и полученный результат совпадают
    }
}
