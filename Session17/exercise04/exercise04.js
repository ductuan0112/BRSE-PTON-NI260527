let items = document.querySelectorAll(".item");

items.forEach((el) => {
  el.addEventListener("mouseover", () => {
    let bgColor = el.getAttribute("id");
    document.body.style.backgroundColor = bgColor;
  });
});