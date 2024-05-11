window.addEventListener('turbo:load', () => {
  console.log("OK");
});

const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  addTaxDom.innerHTML = Math.floor(inputValue*0.1);
  profitDom.innerHTML = Math.floor(inputValue - inputValue * 0.1);
})