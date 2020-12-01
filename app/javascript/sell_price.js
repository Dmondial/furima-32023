function sellPrice (){
  const itemPriceContent = document.getElementById("item-price");
  itemPriceContent.addEventListener("keyup",() => {
    const itemPrice = itemPriceContent.value;
    const addTax = itemPrice / 10 ;
    const addTaxContent = document.getElementById("add-tax-price");
    const profitContent = document.getElementById("profit")
    addTaxContent.innerHTML = addTax ;
    profitContent.innerHTML = itemPrice - addTax ;
  });
};
window.addEventListener("load", sellPrice);