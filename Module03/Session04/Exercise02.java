import java.util.Scanner;

public class Exercise02 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập vào kích thước mảng:");
        int arrSize = scanner.nextInt();

        int[] arr = new int[arrSize];
        for (int i = 0; i < arrSize; i++){
            System.out.println("Nhập vào giá trị thứ " + (i + 1) + " của mảng:");
            arr[i] = scanner.nextInt();
        }

        int arrSum = 0;
        for (int value : arr) {
            arrSum += value;
        }

        System.out.println("Tổng các phần tử trong mảng là:" + arrSum);
    }
}
