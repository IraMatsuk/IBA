import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;
import java.io.FileReader;
import java.io.File;

public class Main {
    public static void main(String[] args) throws Exception {
        File myFile = new File("text.txt");
        if(myFile.exists()) {
            HashMap<String, Double> myMap = new HashMap<String, Double>(){{
                put("еда", 0.0);
                put("кафе", 0.0);
                put("транспорт", 0.0);
                put("бытовая химия", 0.0);
                put("аптека", 0.0);
                put("связь", 0.0);
                put("фильтр для воды", 0.0);
                put("медицина", 0.0);
                put("средства гигиены", 0.0);
                put("подарки", 0.0);
            }};
            FileReader reader = new FileReader("text.txt");
            Scanner scan = new Scanner(reader);
            String str;
            while(scan.hasNextLine()) {
                str = scan.nextLine();
                String[] parts = str.split(" ");
                double price = Double.parseDouble(parts[0]);
                if(!myMap.containsKey(parts[1])) {
                    System.out.println("This category not found: " + parts[1]);
                    return;
                }
                myMap.put(parts[1], myMap.get(parts[1]) + price);
            }
            System.out.printf("%-30s", "Категория:");
            System.out.printf("%15s %n", "Расходы(руб.): ");
            double totalPrice = 0.0;
            for (HashMap.Entry<String, Double> item : myMap.entrySet() ) {
                if (item.getValue() != 0) {
                    System.out.printf("%-30s", item.getKey());
                    System.out.printf("%15s %n", item.getValue());
                    totalPrice += item.getValue();
                }
            }
            System.out.printf("%-30s", "Итого:");
            System.out.printf("%15s %n", totalPrice);
            reader.close();
        } else {
            System.out.println("File not found");
        }
    }
}
