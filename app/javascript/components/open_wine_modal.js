const initOpenModal = () => {
  const btnsAddCart = document.querySelectorAll('.btn-add-cart');
  const fieldId = document.getElementById('order_wine_wine_id');
  btnsAddCart.forEach((btn) => {
    btn.addEventListener('click', (event) => {
      const wineId = event.currentTarget.dataset.wine;
      $('#exampleModal').modal();
      // setTimeout(function(){
      //   fieldId.value = wineId;
      // },5000);
      console.log(wineId);
      console.log(fieldId);
      console.log(fieldId.value)
    });
  });
}

export { initOpenModal };
