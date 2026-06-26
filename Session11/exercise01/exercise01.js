let year = Number(prompt("Nhập vào số năm cần kiểm tra:"))

if (isNaN(year)) {
    alert("Vui lòng nhập nhập một số! ");
} else if ((year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0)) {
    alert(`${year} là năm nhuận`);
} else {
    alert(` ${year} không phải là năm nhuận`);
}
