package task1_NIO_ExplicitChannelRead;
//Пример №1. Использование канала ввода-вывода для чтения файла
import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.nio.file.*;

public class ExplicitChannelRead {
    public static void main(String[] args) {
        int count;
        Path filePath = null;
        //  получить путь к файлу
        try {
            filePath = Paths.get("article3.4_NIO.iml"); // относительный путь
        } catch (InvalidPathException e) {
            System.out.println("Path Error " + e);
            return;
        }
        //получить канал к этому файлу в блоке оператора try с ресусам
        //для создания канала, связного с файлом, вызывается метод newByteChannel(),
        //которому передается ссылка на файл в переменной filePath
        try (SeekableByteChannel fChan = Files.newByteChannel(filePath)) {
            // выделить память под буфер для хранения содержимого файла во время чтения
            // ссылка на этот буфер хранится в переменной экземпляра mBuf
            ByteBuffer mBuf = ByteBuffer.allocate(128);
            do {
                // читать данные из файла в буфер
                count = fChan.read(mBuf); //Количество прочитанных байт сохраняется в переменной count.
                //после вызова метода read() текущая позиция находится в конце буфера
                // прекратить чтение по достижении конца файла
                if (count != -1) {
                    // подготовить буфер к чтению из него данных
                    mBuf.rewind();
                    //читать байты данных из буфера и выводить их на экран как сиволы
                    for (int i = 0; i < count; i++) {
                        System.out.print((char) mBuf.get());
                    }
                }
            } while (count != -1);
            System.out.println();
        } catch (IOException e) {
            System.out.println("Oшибкa ввода-вывода " + e);
        }
    }
}
