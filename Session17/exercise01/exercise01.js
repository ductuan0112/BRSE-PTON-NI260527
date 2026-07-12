let hide = document.getElementById("hideText");
let show = document.getElementById("showText");
let text = document.getElementById("text");

hide.addEventListener("click", () => {
  text.style.visibility = "hidden";
})

show.addEventListener("click", () => {
  text.style.visibility = "visible";
})