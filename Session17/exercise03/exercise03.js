let btnOpen = document.querySelector(".btn-open");
let overlay = document.querySelector(".overlay");
let btnClose = document.querySelector(".btn-close");
let modal = document.querySelector(".modal");

btnOpen.onclick = function () {
  overlay.style.display = "block";
};

btnClose.onclick = function () {
  overlay.style.display = "none";
};

overlay.onclick = function () {
  overlay.style.display = "none";
};

modal.onclick = function (event) {
  event.stopPropagation();
};