function inputValues(){
  if(location.pathname == "/items/new"){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const totalProfit = document.getElementById("profit");
    addTaxDom.innerHTML = `${Math.floor(inputValue / 10)}`;
    totalProfit.innerHTML = `${inputValue - Math.floor(inputValue / 10)}`;
 
});
};
};

window.addEventListener('turbolinks:load', inputValues);