import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.io.FileReader;
import java.io.File;

public class Main {
    public static void main(String[] args) throws Exception {
        File myFile = new File("text1.txt");
        if(myFile.exists()) {
            HashMap<String, Integer> myMap = new HashMap<String, Integer>();
            FileReader reader = new FileReader("text1.txt");
            Scanner scan = new Scanner(reader);
            int i = 1;
            while(scan.hasNextLine()) {
                System.out.println(i + " : " + scan.nextLine());
                i++;
            }

            reader.close();
            System.out.println("File exists");
        } else {
            System.out.println("File not found");
        }
    }
}
