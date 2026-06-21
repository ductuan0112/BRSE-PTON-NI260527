let mathPoint = Number(prompt('Nhập vào điểm Toán:'));
let physicsPoint = Number(prompt('Nhập vào điểm Lý:'));
let chemistryPoint = Number(prompt('Nhập vào điểm Hóa:'));

let gpa = (mathPoint + physicsPoint + chemistryPoint) / 3;

alert(`Điểm trung bình của bạn là: ${gpa.toFixed(2)}`)