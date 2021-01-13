package task11_EnumSet;
//Пример №11. Использование коллекции EnumSet. САМОСТОЯТЕЛЬНО
import java.util.EnumSet;
import java.util.Iterator;

class SizeSet {
    public static void main(String[] args) {
        EnumSet largeSize = EnumSet.of(Size.XL, Size.XXL, Size.XXXL);
        for (Iterator it = largeSize.iterator(); it.hasNext();) {
            Size size = (Size) it.next();
            System.out.println(size);
        }
    }
}
