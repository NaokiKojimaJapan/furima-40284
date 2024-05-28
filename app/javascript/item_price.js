const pay = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  addTaxDom.innerHTML = Math.floor(inputValue*0.1);
  profitDom.innerHTML = inputValue - Math.floor(inputValue*0.1);
})
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);