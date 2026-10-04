import java.util.Scanner;

public class Exercise04 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        int age = 0;

        do {
            System.out.println("Vui lòng nhập vào tuổi của bạn:");
            if (scanner.hasNextInt()){
                age = scanner.nextInt();
                if (age <= 0) {
                    System.out.println("Vui lòng nhập vào số nguyên lớn và lớn hơn 0.");
                }
            } else {
                    System.out.println("Vui lòng nhập vào số nguyên lớn và lớn hơn 0.");
                    scanner.next();
                }
        } while (age <= 0);
        System.out.printf("Tuổi của bạn là %d! %n", age);
    }
}
