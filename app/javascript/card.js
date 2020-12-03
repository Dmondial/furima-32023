const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_form[number]"),
      cvc: formData.get("purchase_form[code]"),
      exp_month: formData.get("purchase_form[month]"),
      exp_year: `20${formData.get("purchase_form[year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      

     
    });
  });
};

// const erasing = () => {
//   document.getElementById("postal-code").removeAttribute("name");
//   document.getElementById("prefecture").removeAttribute("name");
//   document.getElementById("city").removeAttribute("name");
//   document.getElementById("addresses").removeAttribute("name");
//   document.getElementById("building").removeAttribute("name");
//   document.getElementById("phone-number").removeAttribute("name");
// }

// window.addEventListener("load", erasing)
window.addEventListener("load", pay)