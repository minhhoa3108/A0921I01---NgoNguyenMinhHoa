package session3.bai_tap;

import java.util.Scanner;

public class FindMinElementArray {
    public static void main(String[] args) {
        int [] arr = {4, 1, 2, 454};
        int min = arr[0];
        for (int i = 0; i < arr.length; i++){
            if (arr[i] < min){
                min = arr[i];
            }
        }
        System.out.println("MIN: " + min);
    }
}