package session2.bai_tap;

import java.util.Scanner;

public class List_n_Prime {
    public static void main(String[] args) {
        int count = 0;
        int m = 2;
        while (true) {
            int mark = 1;
            for(int i = 2; i <= Math.sqrt(m); i++){
                if (m % i == 0) {
                    mark = 0;
                    break;
                }
            }
            if(mark == 1){
                count++;
                System.out.print(m + ", ");
            }
            if (count >= 20) {
                break;
            }
            m++;
        }
    }
}
