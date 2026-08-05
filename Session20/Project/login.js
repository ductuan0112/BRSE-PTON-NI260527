let form = document.querySelector('#loginForm');

let authAlert = document.getElementById('authAlert');
let successAlert = document.getElementById('successAlert');

function validateForm() {
  let isValid = true;

  let emailErr = document.getElementById('email_err');
  let passwordErr = document.getElementById('password_err');

  let email = form.email.value.trim();
  let password = form.password.value;

  if (email === '') {
    emailErr.innerText = 'Email không được để trống';
    isValid = false;
  } else {
    emailErr.innerText = '';
  }

  if (password === '') {
    passwordErr.innerText = 'Mật khẩu không được để trống';
    isValid = false;
  } else {
    passwordErr.innerText = '';
  }

  return isValid;
}

form.addEventListener('submit', function (event) {
  event.preventDefault();

  // Ẩn các thông báo cũ
  authAlert.classList.add('d-none');
  successAlert.classList.add('d-none');

  if (!validateForm()) {
    return;
  }

  let inputEmail =
    form.email.value.trim().toLowerCase();

  let inputPassword =
    form.password.value;

  let userFound = false;
  let currentUser = null;

  for (let i = 0; i < users.length; i++) {
    let userEmail =
      users[i].email.toLowerCase();

    if (
      userEmail === inputEmail &&
      users[i].password === inputPassword
    ) {
      currentUser = users[i];
      userFound = true;
      break;
    }
  }

  if (userFound) {
    localStorage.setItem(
      'currentUser',
      JSON.stringify(currentUser)
    );

    successAlert.classList.remove('d-none');

    let submitButton =
      form.querySelector('button[type="submit"]');

    submitButton.disabled = true;

    setTimeout(function () {
      window.location.href = 'dashboard.html';
    }, 2000);
  } else {
    authAlert.classList.remove('d-none');
  }
});