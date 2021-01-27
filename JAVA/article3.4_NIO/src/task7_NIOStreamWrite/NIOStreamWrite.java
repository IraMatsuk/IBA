package task7_NIOStreamWrite;

//Пример №7. Демонстрация потокового вывод на основе системы NIO
import java.io.*;
import java.nio.file.*;
class NIOStreamWrite {
    public static void main(String args[]) {
// открыть файл и получить связанный с ним поток вывода
        try (OutputStream fout = new
                BufferedOutputStream(Files.newOutputStream(Paths.get("test_2.txt"))))
        {// вывести в поток заданное количество байтов
            for (int i = 0; i < 26; i++) {
                fout.write((byte) ('A' + i));
            }
        } catch (InvalidPathException е) {
            System.out.println(" Oшибкa указания пути " + е);
        } catch (IOException е) {
            System.out.println("Oшибкa ввода-вывода: " + е);
        }
    }
}
