import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr("#delivery_date", {
    altInput: true,
    minDate: "today",
    enableTime: true
    // onClose: (selectedDates, dateStr, instance) => {
    //   const daysInRange = document.getElementsByClassName('inRange');
    //   const daysLengthTotal = daysInRange.length + 1;
    //   const daysField = document.getElementById('length-of-stay');
    //   const totalPriceField = document.getElementById('total-price');
    //   daysField.innerText = daysLengthTotal;
    //   totalPriceField.innerText = daysLengthTotal * Number.parseInt(totalPriceField.dataset.price_per_day, 10);
    // }
  });
}

export { initFlatpickr };