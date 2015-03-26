import java.io.*;
import java.util.*;

public class Driver2 {
    public static void main(String[] args) {

        if (args.length != 2) {
            System.out.println("Usage: java Driver2 <length of liked list> <randomness>");
            System.exit(1);
        }
        Random randgen = new Random();
        Llist2 l1 = new Llist2();

        for (int i = 0 ; i < Integer.parseInt(args[0]) ; i++) {
            l1.add(randgen.nextInt(Integer.parseInt(args[1])));
        }

        System.out.println(l1);

        int sum = 0;

        long start = System.currentTimeMillis();
        for (int i = 0 ; i < l1.length() ; i++) {
            sum = sum + l1.get(i);
        }

        long elapsed = System.currentTimeMillis() - start;

        System.out.println(elapsed);
        System.out.println(sum);
    }
}
