let firstNumber = Number(prompt('Nhập số thứ nhất'));
let secondNumber = Number(prompt('Nhập số thứ hai'));

function sumOf2Number(firstNumber, secondNumber) {
  if (Number.isNaN(firstNumber) || Number.isNaN(secondNumber)) {
    return null;
  }

  return firstNumber + secondNumber;
}

const result = sumOf2Number(firstNumber, secondNumber);

if (result === null) {
  alert('Giá trị không hợp lệ!!!');
} else {
  alert(`Tổng hai số là: ${result}`);
}