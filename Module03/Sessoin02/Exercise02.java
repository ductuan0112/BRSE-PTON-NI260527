import java.util.Scanner;

public class Exercise02 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập vào 1 số nguyên từ 1 đến 7:");
        int day = scanner.nextInt();

        switch (day){
            case 1:
                System.out.println("Chủ Nhật");
                break;
            case 2:
                System.out.println("Thứ hai");
                break;
            case 3:
                System.out.println("Thứ ba");
                break;
            case 4:
                System.out.println("Thứ tư");
                break;
            case 5:
                System.out.println("Thứ năm");
                break;
            case 6:
                System.out.println("Thứ sáu");
                break;
            case 7:
                System.out.println("Thứ bảy");
                break;
            default:
                System.out.println("Số nhập vào không hợp lệ!");
                break;
        }
        scanner.close();
    }
}
