function price() {
  const PriceInput = document.getElementById("item-price");
  PriceInput.addEventListener('keyup', () => {
    const Price = PriceInput.value;
    const TaxValue = Math.floor(Price * 0.1);
    const ProfitValue  = Price - TaxValue;
    const AddTaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    AddTaxPrice.innerHTML = `${TaxValue}`;
    Profit.innerHTML = `${ProfitValue}`;
  });
}
window.addEventListener('load', price);
