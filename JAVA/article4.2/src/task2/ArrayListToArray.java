package task2;
//Пример №2. Преобразовать списочный массив ArrayList в обычный массив
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

class ArrayListToArray {
    public static void main(String[] args) {
        ArrayList<BigDecimal> arrayListSalary = new ArrayList<BigDecimal>();
        // добавить элементы в ArrayList
        arrayListSalary.add(new BigDecimal(10000.2));
        arrayListSalary.add(new BigDecimal(20000.3));
        arrayListSalary.add(new BigDecimal(30000.5));
        arrayListSalary.add(new BigDecimal(40000.1));
        arrayListSalary.add(new BigDecimal(40000.6));
        for(BigDecimal bd : arrayListSalary) {
            //Режим округления для округления в сторону «ближайшего соседа»,
            // если оба соседа не равноудалены, в этом случае округление вверх.
            System.out.println("Coдepжимoe коллекции arrayListSalary:"
                    + bd.setScale(0, RoundingMode.HALF_UP).doubleValue());
        }
        // получить массив из коллекции ArrayList
        BigDecimal bigDecimalSalary[] = new BigDecimal[arrayListSalary.size()];
        bigDecimalSalary = arrayListSalary.toArray(bigDecimalSalary);
        BigDecimal sum = new BigDecimal(0);
        // суммировать элементы массива
        for(BigDecimal bd : bigDecimalSalary) sum = sum.add(bd);
        System.out.println("Сумма равна:" + sum.setScale(2, RoundingMode.HALF_UP));
    }
}
