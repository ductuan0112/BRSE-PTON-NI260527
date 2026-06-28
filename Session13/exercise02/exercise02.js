let arr = [1, 4, 6, 9, 45, 32, 64, 82, 51];

let answer = Number(prompt('Nhập vào số nguyên của bạn!'))

if (isNaN(answer) || !Number.isInteger(answer)) {
    alert('Vui lòng nhập vào 1 số nguyên!');
} else {
    let hasNumber = false;
    for (let i = 0; i < arr.length; i++) {
        if (arr[i] === answer) {
            hasNumber = true;
            break;
        }
    }
    if (hasNumber) {
        alert('Bingooooo!!!');
    } else {
        alert('Chúc bạn may mắn lần sau!');
    }
}