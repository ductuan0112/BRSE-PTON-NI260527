let arr = [24, 41, 34, 31, 54, 76, 23, 35, 24, 42, 23, 23, 12, 45, 13, 13, 76, 23, 2, 32, 21];

let search = Number(prompt('Nhập vào 1 số nguyên từ 1 đến 100'));
let times = 0;

for (let i = 0; i < arr.length; i ++) {
    if (arr[i] === search) {
        times += 1;
    }
}

alert(`Số lần xuất hiện của ${search} trong mảng là ${times} lần.`)