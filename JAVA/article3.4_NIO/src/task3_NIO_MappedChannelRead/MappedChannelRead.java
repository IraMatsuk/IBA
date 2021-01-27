package task3_NIO_MappedChannelRead;
//Пример №3. Сопоставления содержимого файла с буфером
import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.nio.file.*;

public class MappedChannelRead {
    public static void main(String args[]) {
        //получить канал к файлу в блоке оператора try с ресурсам
        try (FileChannel fChan = (FileChannel)
                Files.newByteChannel(Paths.get("article3.4_NIO.iml"))) {
            // получить размер файла
            long fSize = fChan.size();
            //сопоставить файл с буфером
            MappedByteBuffer mBuf =
                    fChan.map(FileChannel.MapMode.READ_ONLY, 0, fSize);
            //читать байты из буфера и выводить их на экран
            for (int i = 0; i < fSize; i++) {
                System.out.print((char) mBuf.get());
            }
            System.out.println();
        } catch (InvalidPathException е) {
            System.out.println("Oшибкa указания пути" + е);
        } catch (IOException е) {
            System.out.println("Oшибкa ввода-вывода" + е);
        }
    }
}