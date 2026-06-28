// let length = Math.floor(Math.random() * 10) + 11;
// let arr = [];
// for (let i = 0; i < length; i++) {
//     arr.push(Math.floor(Math.random() * 100));
// }

let arr = prompt(
    'Nhập dãy 10 đến 20 số nguyên phân cách nhau bởi dấu cách!'
).split(' ');

if (arr.length < 10 || arr.length > 20) {
    alert('Vui lòng nhập từ 10 đến 20 số nguyên!');
} else {
    let evenSum = 0;
    let oddSum = 0;

    for (let i = 0; i < arr.length; i++) {
        let number = Number(arr[i]);

        if (number % 2 === 0) {
            evenSum += number;
        } else {
            oddSum += number;
        }
    }

    alert(
        `Tổng các số chẵn là: ${evenSum}
Tổng các số lẻ là: ${oddSum}`
    );
}