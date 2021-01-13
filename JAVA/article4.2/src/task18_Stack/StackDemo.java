package task18_Stack;
//Пример №18. Демонстрация применения класса Stack
import java.util.*;

class StackDemo {
    static void showpush(Stack< Integer> st, int a) {
        st.push(a);
        System.out.println("push(" + a + ")");
        System.out.println("cтeк:" + st);
    }
    static void showpop(Stack< Integer> st) {
        System.out.print("pop->");
        Integer a = st.pop();
        System.out.println(a);
        System.out.println("cтeк:" + st);
    }
    public static void main(String args[]) {
        Stack< Integer> st = new Stack< Integer>();
        System.out.println("cтeк:" + st);
        showpush(st, 42);
        showpush(st, 66);
        showpush(st, 99);
        showpop(st);
        showpop(st);
        showpop(st);
        try {
            showpop(st);
        } catch (EmptyStackException е) {
            System.out.println("cтeк пуст");
        }
    }
}