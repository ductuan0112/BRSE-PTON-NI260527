let answer = Number(prompt('Nhập vào số cần kiểm tra'));

function isEven(answer) {
  if (Number.isNaN(answer)) {
    return null;
  }

  return answer % 2 === 0;
}

const result = isEven(answer);

if (result === null) {
  alert('Vui lòng nhập vào 1 số!')
} else if (result === true) {
  alert('Số bạn nhập là số chẵn');
} else {
  alert('Số bạn nhập không phải là số chẵn')
}