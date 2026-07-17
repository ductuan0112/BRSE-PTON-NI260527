// Bai 1:

let arr = [];
let count = 0;

for (let i = 0; i < 10; i++) {
  arr.push(Number(prompt(`Nhập vào số nguyên thứ ${i + 1}`)));
}

for (let num of arr) {
  num >= 10 && count++;
}

console.log(`Có ${count} số nguyên lớn hơn hoặc bằng 10`);

// Bai 2:

let arr = [];
let max = -Infinity;
let index = 0;

for (let i = 0; i < 10; i++) {
  let value = Number(prompt(`Nhập vào số nguyên thứ ${i + 1}`));
  arr.push(value);

  if (value > max) {
    max = value;
    index = i;
  }
}

console.log(`Giá trị lớn nhất trong mảng là: ${max}
Và vị trí của phần tử đó là ${index + 1}`
);

// Bai 3:

let arr = [];
let max = -Infinity;
let sum = 0;

let n = +prompt('Nhập vào số phần tử của mảng:');

for (let i = 0; i < n; i++) {
  let number = +prompt(`Nhập vào số nguyên thứ ${i + 1}`);
  arr.push(number)
  if (number > max) {
    max = number;
  }
  sum += number;
}

let avg = sum / arr.length;

console.log(`Giá trị lớn nhất của mảng là: ${max}
Giá trị trung bình của các phần tử trong mảng là: ${avg}`)

//Bai 4:

let arr = [];

let n;

do {
  n = +prompt('Nhập vào số phần tử của mảng:');
  if (n <= 0 || Number.isNaN(n)) {
    alert('Nhập vào số phần tử hợp lệ');
  }
} while (n === 0 || Number.isNaN(n));

for (let i = 0; i < n; i++) {
  arr.push(+prompt(`Nhập vào số nguyên thứ ${i + 1}`));
};

console.log([...arr].reverse());

// Bai 5:

let str = prompt('Nhập vào 1 chuỗi số nguyên, cách nhau bởi dấu cách');

let arr = str.split(" ")
let count = 0;

for (let num of arr) {
  if (num < 0) {
    count++;
  }
}

alert(`Có ${count} số nguyên âm!`)

//Bai 6:

let arr = [];

for (let i = 0; i < 10; i++) {
  arr.push(+prompt(`Nhập vào số nguyên thứ ${i + 1}`));
}

let ans = +prompt('Nhập vào số nguyên cần kiểm tra');
let found = false;

for (let num of arr) {
  if (num === ans) {
    found = true;
    break;
  }
}

if (found) {
  alert(`Number ${ans} is in the array`);
} else {
  alert(`Number ${ans} is not in the array`)
}

// Bai 7:

let arr = [];

for (let i = 0; i < 10; i++) {
  arr.push(+prompt(`Nhập vào số nguyên thứ ${i + 1}`));
}

for (let i = 0; i < arr.length - 1; i++) {
  for (let j = i + 1; j < arr.length; j++) {
    if (arr[i] < arr[j]) {
      let temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
}

alert(arr);

// Bai 8:

let arrA = [];
let arrB = [];

for (let i = 0; i < 10; i++) {
  arrA.push(+prompt(`Nhập vào số nguyên thứ ${i + 1} cho mảng A`));
  arrB.push(+prompt(`Nhập vào số nguyên thứ ${i + 1} cho mảng B`));
}

let arrC = arrA.concat(arrB);

console.log(arrC)