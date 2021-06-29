const changeDeliveryAddress = () => {
    const searchDelivery = document.getElementById("delivery_product_delivery_address");
    const searchMapbox = document.querySelector('.mapboxgl-ctrl-geocoder--input')
    searchMapbox.addEventListener("blur", (event) => {
        // console.log(event);
        const selectedAddress = event.currentTarget.value;
        searchDelivery.innerText = selectedAddress;
        searchDelivery.value = selectedAddress;
      });
  }
  
export { changeDeliveryAddress };