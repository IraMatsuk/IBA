package task2_NIO_ExplicitChannelRead;
//Пример №2. Более компактный способ открытия канала.
import java.io.*;
import java.nio.*;
import java.nio.channels.*;
import java.nio.file.*;

public class ExplicitChannelRead {
    public static void main(String args[]) {
        int count;
        //Здесь канал открывается по пути, возвращаемому методом
        //Paths.get() в виде объекта типа Path
        //Переменная filepath больше не нужна
        try (SeekableByteChannel fChan =
                     Files.newByteChannel(Paths.get("article3.4_NIO.iml"))) {
            // выделить память под буфер
            ByteBuffer mBuf = ByteBuffer.allocate(128);
            do {
                // читать данные из файла в буфер
                count = fChan.read(mBuf);
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
        } catch (IOException е) {
            System.out.println("Ошибка ввода-вывода " + е);
        }
    }
}

