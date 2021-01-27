package task5_MappedChannelWrite;

//Пример №5. Запись данных в сопоставляем файл
import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.nio.file.*;

public class MappedChannelWrite {
    public static void main(String args[]) {
        // получить канал к файлу в блоке try с ресурсам
        try (FileChannel fChan = (FileChannel)
                Files.newByteChannel(Paths.get("test_1.txt"),
                        StandardOpenOption.WRITE, StandardOpenOption.READ,
                        StandardOpenOption.CREATE)) {
            // затем сопоставить файл с буфером
            MappedByteBuffer mBuf =
                    fChan.map(FileChannel.MapMode.READ_WRITE, 0, 26);
            //записать заданное количество байтов в буфер
            for (int i = 0; i < 26; i++) {
                mBuf.put((byte)('A' + i));
            }
        } catch (InvalidPathException е) {
            System.out.println("Oшибкa указания пути " + е);
        } catch (IOException е) {
            System.out.println("Ошибка ввода-вывода " + е);
        }
    }
}
