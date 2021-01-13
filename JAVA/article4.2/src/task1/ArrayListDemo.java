package task1;
//Пример №1. Демонстрация применения класса ArrayList
import java.util.ArrayList;

class ArrayListDemo {
    public static void main(String[] args) {
        // создать ArrayList для хранения объектов типа String
        ArrayList<String> arrayList = new ArrayList<String>();
        System.out.println("\"Начальный размер arrayList: " + arrayList.size());
        // ввести элементы в ArrayList
        arrayList.add("Не проблемы должны толкать Вас в спину, а впереди вести мечты.");
        arrayList.add("За черной полосой идет белая, за ночью – рассвет, за болезнью – выздоровление.");
        arrayList.add("Дойдя до конца, люди смеются над страхами, мучившими их вначале.");
        arrayList.add("Если ты не знаешь, чего хочешь, ты в итоге останешься с тем, чего точно не хочешь.");
        arrayList.add("Чтобы дойти до цели, надо идти.");
        arrayList.add("Это своего рода забава, делать невозможное.");
        arrayList.add(1, "Пробуйте и терпите неудачу, но не прерывайте ваших стараний.");
        System.out.println("-----------------------------------------------------------------------");
        System.out.println("Размер arrayList после ввода всех элементов:" + arrayList.size());
        System.out.println("Содepжимоe arrayList:");
        // вывести списочный массив
        for(String s: arrayList) {
            System.out.println(s);
        }
        System.out.println("-----------------------------------------------------------------------");
        // удалить элементы из списочного массива
        arrayList.remove("Это своего рода забава, делать невозможное.");
        arrayList.remove(2);
        System.out.println("Размер arrayList после удаления элементов: " + arrayList.size());
        System.out.println("Содepжимоe arrayList:");
        // вывести списочный массив
        for(String s : arrayList) {
            System.out.println(s);
        }
        arrayList.ensureCapacity(32);
        System.out.println("Размер arrayList после увеличения емкости вручную: " + arrayList.size());
        arrayList.trimToSize();
        System.out.println ("Размер arrayList после уменьшения размера до текущего количества элементов вручную: " + arrayList.size());
    }
}
