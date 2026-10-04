import java.util.Scanner;

public class Exercise03 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập vào số nguyên N:");
        int N = scanner.nextInt();

        if (N <= 0) {
            System.out.println("Số nhập vào không hợp lệ!");
        } else {
            int sum = 0;
            for(int i = 0; i <= N; i++){
                sum += i;
            }
            System.out.printf("Tổng các số từ 1 đến %d là: %d", N, sum);
        }
        scanner.close();
    }
}
