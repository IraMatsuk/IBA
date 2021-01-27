package task6_ShowFile;

//Пример №6. Вывод на экран текстового файла, используя код
//потокового ввода-вывода на основе NIO
import java.io.*;
import java.nio.file.*;

class ShowFile {
    public static void main(String args[]) {
        int i;
        // удостовериться, что указано имя файла
        if (args.length != 1) {
            System.out.println("Пpимeнeниe: ShowFile имя_файла ");
            return;
        }
        // открыть файл и получить связанный с ним поток ввода-вывода
        try (InputStream fin =
                     Files.newInputStream(Paths.get(args[0]))) {
            do {
                i = fin.read();
                if (i != -1) System.out.print((char) i);
            } while (i != -1);
        } catch (InvalidPathException е) {
            System.out.println(" Oшибкa указания пути " + е);
        } catch (IOException е) {
            System.out.println("Oшибкa ввода-вывода " + е);
        }
    }
}