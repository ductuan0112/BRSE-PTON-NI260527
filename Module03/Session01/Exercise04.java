public class Exercise04 {
    public static void main(String[] args) {
        int a = 50;
        int b = 20;

        int sum = a + b;
        int difference = a - b;
        int product = a * b;
        double quotient = (double) a / b;
        int remainder = a % b;

        System.out.printf("Giá trị của a: %d%n", a);
        System.out.printf("Giá trị của b: %d%n", b);
        System.out.printf("Tổng của a và b: %d%n", sum);
        System.out.printf("Hiệu của a và b: %d%n", difference);
        System.out.printf("Tích của a và b: %d%n", product);
        System.out.printf("Thương của a và b: %.2f%n", quotient);
        System.out.printf("Phần dư khi chia a cho b: %d%n", remainder);
    }
}
