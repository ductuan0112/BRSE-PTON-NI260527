import java.util.Scanner;

public class Exercise03 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập vào kích thước mảng:");
        int arrSize = scanner.nextInt();

        int[] arr = new int[arrSize];
        for (int i = 0; i < arrSize; i++){
            System.out.println("Nhập vào giá trị thứ " + (i + 1) + " của mảng:");
            arr[i] = scanner.nextInt();
        }

        int n = arr.length;
        for (int i = 0; i < n - 1; i++){
            for (int j = 0; j < n - 1 - i; j++){
                if (arr[j] < arr[j + 1]) {
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }

        System.out.print("Mảng sau khi sắp xếp theo thứ tự giảm dần: ");
        for (int value : arr) {
            System.out.print(value + " ");
        }

        scanner.close();
    }
}
