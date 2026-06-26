let weight = Number(prompt('Nhập vào cân nặng (kg)'));
let height = Number(prompt('Nhập vào chiều cao (m)'));

if (isNaN(weight) || isNaN(height) || height <= 0) {
    alert('Vui lòng nhập dữ liệu hợp lệ!');
} else {
    let BMI = weight / (height * height);

    if (BMI < 18.5) {
        alert(`BMI của bạn là: ${BMI.toFixed(1)}\n BMI - WHO: Cân nặng thấp (gầy)`);
    } else if (BMI < 23) {
        alert(`BMI của bạn là: ${BMI.toFixed(1)}\nBMI - WHO: Bình thường\nBMI - IDI & WPRO: Bình thường`);
    } else if (BMI < 25) {
        alert(`BMI của bạn là: ${BMI.toFixed(1)}\nBMI - WHO: Bình thường\nBMI - IDI & WPRO: Thừa cân, tiền béo phì`);
    } else if (BMI < 30) {
        alert(`BMI của bạn là: ${BMI.toFixed(1)}\nBMI - WHO: Tiền béo phì\nBMI - IDI & WPRO: Béo phì độ I`);
    } else if (BMI < 35) {
        alert(`BMI của bạn là: ${BMI.toFixed(1)}\nBMI - WHO: Béo phì độ I\nBMI - IDI & WPRO: Béo phì độ II`);
    } else if (BMI < 40) {
        alert(`BMI của bạn là: ${BMI.toFixed(1)}\nBMI - WHO: Béo phì độ II\nBMI - IDI & WPRO: ...`);
    } else {
        alert(`BMI của bạn là: ${BMI.toFixed(1)}\nBMI - WHO: Béo phì độ III\nBMI - IDI & WPRO: ...`);
    }
}