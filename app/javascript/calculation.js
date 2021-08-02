// const priceTextArea = document.getElementById("item-price")
// console.log(priceTextArea)

function input (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", keyUp);
  function keyUp() {
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = Math.floor(priceInput.value * 0.1);
    const addProfit = document.getElementById("profit")
    addProfit.innerHTML = Math.floor(priceInput.value * 0.9);
  };
};

window.addEventListener('load', input);

