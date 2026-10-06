import java.util.Arrays;
import java.util.Scanner;

public class Exercise04 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập vào kích thước mảng:");
        int arrSize = scanner.nextInt();

        int[] arr = new int[arrSize];
        for (int i = 0; i < arrSize; i++) {
            System.out.println("Nhập vào giá trị thứ " + (i + 1) + " của mảng:");
            arr[i] = scanner.nextInt();
        }

        int n = arr.length;
        if (n == 0) {
            System.out.println("Mảng ban đầu: " + Arrays.toString(arr));
            System.out.println("Mảng sau khi đảo ngược: " + "Kích thước rỗng");
        } else {
            System.out.println("Mảng ban đầu: " + Arrays.toString(arr));
            for (int i = 0; i < n / 2; i++){
                int temp = arr[i];
                arr[i] = arr[n - i - 1];
                arr[n - i - 1] = temp;
            }
            System.out.println("Mảng sau khi đảo ngược: " + Arrays.toString(arr));
        }
    }
}
