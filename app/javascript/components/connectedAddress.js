const changeDeliveryAddress = () => {
    const searchDelivery = document.getElementById("delivery_product_delivery_address");
    const searchMapbox = document.querySelector('.mapboxgl-ctrl-geocoder--input')
    if (searchMapbox) {
    searchMapbox.addEventListener("blur", (event) => {

        const selectedAddress = event.currentTarget.value;
        searchDelivery.innerText = selectedAddress;
        searchDelivery.value = selectedAddress;
      });
    }
  }

export { changeDeliveryAddress };
