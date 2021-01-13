package task12_EnumSet;
//Пример №12. Использование коллекции EnumSet. САМОСТОЯТЕЛЬНО
import java.util.EnumSet;

public class EnumSetDemo {
    public static void main(String[] args) {
        // Creating an empty EnumSet
        // Getting all elements from CARS
        EnumSet<CARS> enumSet = EnumSet.of(CARS.AUDI, CARS.RANGE_ROVER);
        // Displaying the empty EnumSet
        System.out.println("Initial set: " + enumSet);
        // Cloning the set
        EnumSet<CARS> finalSaleEnumSet = EnumSet.complementOf(enumSet);
        // Displaying the final set
        System.out.println("The updated set is:" + finalSaleEnumSet);
    }
}
