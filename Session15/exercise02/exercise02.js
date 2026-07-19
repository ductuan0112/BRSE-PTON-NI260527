// BAI 1:

let arr = ['c', 's', 'c', '2', '6', '1'];

let result = arr.reverse().join('');

console.log(result);

// BAI 2:

let arr = ['a', '1', 'b', '5', 'c', '9', '@'];
let count = 0;

for (let value of arr) {
  if (!Number.isNaN(Number(value))) {
    count++
  }
};

console.log(`Có ${count} ký tự số`)

// BAI 3:

let str = prompt('Nhập vào một chuỗi ký tự');
let arr = str.split('');

console.log('Số ký tự trong chuỗi là:', arr.length)

// BAI 4:

let str1 = prompt('Nhập vào chuỗi thứ nhất');
let str2 = prompt('Nhập vào chuỗi thứ hai');

if (str1 === str2) {
  console.log('2 chuỗi vừa nhập giống nhau!');
} else {
  console.log('2 chuỗi vừa nhập không giống nhau!')
}

BAI 5:

let arr = [];
let n = +prompt('Nhập vào số lượng ký tự');

for (let i = 0; i < n; i++) {
  arr.push(prompt(`Nhập vào ký tự thứ ${i + 1}`));
}

for (let i = 0; i < arr.length; i++) {
  if (arr[i] === '-') {
    arr[i] = '_';
  }
}

console.log(arr)
