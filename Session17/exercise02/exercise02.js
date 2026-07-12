// let btnToggle = document.querySelector('.btnToggle');

// btnToggle.addEventListener("click", () => {
//   document.body.classList.toggle('dark-mode');
//   btnToggle = 'Toggle light mode';
// })

let btnToggle = document.querySelector('.btnToggle');

btnToggle.addEventListener("click", () => {
  const isDarkMode = document.body.classList.toggle('dark-mode');
  btnToggle.textContent = isDarkMode
    ? 'Toggle light mode'
    : 'Toggle dark mode';
});