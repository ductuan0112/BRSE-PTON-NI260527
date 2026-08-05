let form = document.querySelector('#registerForm');

let successMessage = document.getElementById(
  'success-message'
);

function validateForm() {
  let isValid = true;

  const firstNameErr =
    document.getElementById('first_name_err');

  const lastNameErr =
    document.getElementById('last_name_err');

  const emailErr =
    document.getElementById('email_err');

  const passwordErr =
    document.getElementById('password_err');

  const confirmPasswordErr =
    document.getElementById('confirm_password_err');

  const agreeErr =
    document.getElementById('agree_err');

  if (form.first_name.value.trim() === '') {
    firstNameErr.innerText =
      'Họ và tên đệm không được để trống';

    isValid = false;
  } else {
    firstNameErr.innerText = '';
  }

  if (form.last_name.value.trim() === '') {
    lastNameErr.innerText =
      'Tên không được để trống';

    isValid = false;
  } else {
    lastNameErr.innerText = '';
  }

  if (form.email.value.trim() === '') {
    emailErr.innerText =
      'Email không được để trống';

    isValid = false;
  } else if (!validEmail(form.email.value.trim())) {
    emailErr.innerText =
      'Email không hợp lệ';

    isValid = false;
  } else {
    emailErr.innerText = '';
  }

  if (form.password.value === '') {
    passwordErr.innerText =
      'Mật khẩu không được để trống';

    isValid = false;
  } else if (form.password.value.length < 8) {
    passwordErr.innerText =
      'Mật khẩu tối thiểu 8 ký tự';

    isValid = false;
  } else {
    passwordErr.innerText = '';
  }

  if (form.confirm_password.value === '') {
    confirmPasswordErr.innerText =
      'Mật khẩu xác nhận không được để trống';

    isValid = false;
  } else if (
    form.confirm_password.value !==
    form.password.value
  ) {
    confirmPasswordErr.innerText =
      'Mật khẩu xác nhận không trùng khớp';

    isValid = false;
  } else {
    confirmPasswordErr.innerText = '';
  }

  if (!form.terms.checked) {
    agreeErr.innerText =
      'Bạn phải đồng ý với điều khoản dịch vụ';

    isValid = false;
  } else {
    agreeErr.innerText = '';
  }

  return isValid;
}

form.addEventListener('submit', function (event) {
  event.preventDefault();

  // Ẩn thông báo cũ trước mỗi lần submit
  successMessage.classList.add('d-none');

  if (!validateForm()) {
    return;
  }

  let newUser = {
    id: Date.now(),
    first_name: form.first_name.value.trim(),
    last_name: form.last_name.value.trim(),
    gender: 0,
    dob: '',
    adress: '',
    avatar: '',
    email: form.email.value.trim().toLowerCase(),
    password: form.password.value,
    phone_number: '',
    created_at: new Date().toISOString()
  };

  users.push(newUser);

  saveToLocalStorage();

  // Hiện thông báo thành công
  successMessage.classList.remove('d-none');

  // Xóa dữ liệu trong form
  form.reset();

  // Chuyển sang trang đăng nhập sau 2 giây
  setTimeout(function () {
    location.href = 'login.html';
  }, 2000);
});

function saveToLocalStorage() {
  localStorage.setItem(
    'users',
    JSON.stringify(users)
  );
}

function validEmail(email) {
  return /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(
    email
  );
}