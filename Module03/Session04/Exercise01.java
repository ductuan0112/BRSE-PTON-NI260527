
import java.util.Scanner;

public class Exercise01 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập vào kích thước mảng:");
        int arrSize = scanner.nextInt();

        int[] arr = new int[arrSize];

        for (int i = 0; i < arrSize; i++){
            System.out.println("Nhập vào giá trị thứ " + (i + 1) + " của mảng:");
            arr[i] = scanner.nextInt();
        }

        selectionSort(arr);
        System.out.println("Mảng đã sắp xếp theo thứ tự giảm dần:");
        for (int value : arr) {
            System.out.print(value + " ");
        }

        System.out.println("Phần tử lớn nhất trong mảng:" + arr[0]);
    }

    public static void selectionSort(int[] arr){
        int n = arr.length;
        for (int i = 0; i < n - 1; i++ ){
            int maxIndex = i;
            for (int j = i + 1; j < n; j++){
                if (arr[j] > arr[maxIndex]) {
                    maxIndex = j;
                }
            }
            int temp = arr[i];
            arr[i] = arr[maxIndex];
            arr[maxIndex] = temp;
        }
    }
}




