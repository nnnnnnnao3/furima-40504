window.addEventListener('turbo:load', () => {
  // 金額を入力した数値をpriceInputという変数に格納
  const priceInput = document.getElementById("item-price");
  // 入力するたびイベント発火
  priceInput.addEventListener("input", () => {
  // 入力した金額の値を取得
    const inputValue = priceInput.value;
  // id:add-tax-price(販売手数料)のHTML要素をaddTaxDomに代入
    const addTaxDom = document.getElementById("add-tax-price");
  // addTaxDomに消費税を表示するように式を代入する
    const taxValue = Math.floor(inputValue * 0.1);
    // コンマ区切りで表示
    addTaxDom.innerHTML = taxValue.toLocaleString(); 

  // id:profit(販売利益)のHTML要素をaddTaxDomに代入
  const SalesProfit = document.getElementById("profit");
  // profitValueに利益率を出す計算式を代入
  const profitValue  = inputValue - taxValue;
   // コンマ区切りで表示
  SalesProfit.innerHTML = profitValue.toLocaleString();
  })
});