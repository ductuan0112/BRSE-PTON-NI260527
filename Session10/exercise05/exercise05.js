let usd = Number(prompt('Nhập vào số tiền Đô la:'));
let exchangeRate = 25000;

let vnd = usd * exchangeRate;

alert(`Số tiền VND là: ${vnd.toLocaleString('vi-vn')} đ`);