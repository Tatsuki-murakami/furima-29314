window.addEventListener('load', function(){
  let price_element = document.getElementById("item-price");
  let tax_element = document.getElementById("add-tax-price");
  let profit_element = document.getElementById("profit");
  price_element.addEventListener('input', function(){
    const tax_value = Math.floor(price_element.value * 0.1)
    tax_element.innerHTML = tax_value
    profit_element.innerHTML = price_element.value - tax_value
  })
})