// // Bài 1

let a = Number(prompt('Nhập vào số a'));
let b = Number(prompt('Nhập vào số b'));

if (b === 0) {
    alert(`Nhập vào b khác 0`);
} else if (a % b === 0) {
    alert(`${a} chia hết cho ${b}`);
} else {
    alert(`${a} không chia hết cho ${b}`);
}

// Bài 2

let age = Number(prompt('Nhập vào số tuổi của bạn'));

if (isNaN(age) || age < 0) {
    alert('Nhập số tuổi hợp lệ!');
} else if (age < 15 ) {
    alert('Bạn không đủ điều kiện để vào lớp 10');
} else {
    alert('Chúc mừng bạn đủ điều kiện vào lớp 10');
}

// Bài 3

let answer = Number(prompt('Nhập vào số nguyên muốn kiểm tra'));

if (Number.isInteger(answer)) {
    if (answer < 0) {
        alert('Bạn đã nhập vào số nguyên âm');
    } else if (answer > 0) {
        alert('Bạn đã nhập vào số nguyên dương');
    } else {
        alert('Số bạn nhập vào là số 0');
    }
} else {
alert('Nhập vào số nguyên hợp lệ');
}

// Bài 4

let a = Number(prompt('Nhập vào số nguyên a'));
let b = Number(prompt('Nhập vào số nguyên b'));
let c = Number(prompt('Nhập vào số nguyên c'));

// if (!Number.isInteger(a) || !Number.isInteger(b) || !Number.isInteger(c)) {
//     alert('Bạn đang nhập vào không phải là số nguyên!');
// } else if (a >= b && a >= c) {
//     alert(`${a} là số lớn nhất!`);
// } else if (b >= a && b >= c) {
//     alert(`${b} là số lớn nhất!`);
// } else {
//     alert(`${c} là số lớn nhất!`);
// }

if (!Number.isInteger(a) || !Number.isInteger(b) || !Number.isInteger(c)) {
    alert('Bạn đang nhập vào không phải là số nguyên!');
} else {
    alert(`Số lớn nhất là: ${Math.max(a, b, c)}`);
}

// Bài 5

let dbkt = Number(prompt('Nhập vào điểm bài kiểm tra'));
let dtgk = Number(prompt('Nhâp vào điểm thi giữa kỳ'));
let dtck = Number(prompt('Nhập vào điểm thi cuối kỳ'));

if (isNaN(dbkt) || isNaN(dtgk) || isNaN(dtck) ){
    alert('Nhập vào điểm số hợp lệ!');
} else if (dbkt < 0 || dtgk < 0 || dtck < 0 || dbkt > 10 || dtgk > 10 || dtck > 10){
    alert('Nhập vào điểm số trong khoảng từ 0 đến 10!');
} else {
let dtb = (dbkt + dtgk * 2 + dtck * 3) / 6;

if (dtb >= 8.5) {
    alert('Xuất sắc');
} else if (dtb >= 7) {
    alert('Giỏi');
} else if (dtb >= 5.5) {
    alert('Khá');
} else if (dtb >= 4) {
    alert('Trung bình');
} else {
    alert('Yếu');
}
}

