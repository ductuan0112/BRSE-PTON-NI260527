const form = document.querySelector("form");

const correctEmail = "huanrose@gmail.com";
const correctPassword = "123456";

form.addEventListener("submit", function (event) {
  event.preventDefault();

  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;

  if (email === correctEmail && password === correctPassword) {
    alert("Đăng nhập thành công!");
  } else {
    alert("Đăng nhập thất bại!");
  }
});