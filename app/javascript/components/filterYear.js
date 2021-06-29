// a tej

// const filterByYear = () => {
//   const checkboxesYear = document.querySelectorAll('.checkbox-year');

//   checkboxesYear.forEach((checkbox) => {
//     checkbox.addEventListener('click', (event) => {
//       if(event.currentTarget.classList.contains('active')){
//         event.currentTarget.classList.remove('active');
//         const cards = document.querySelectorAll('.card');
//         cards.forEach(card => card.style.display = null)
//       } else {
//       const type = event.currentTarget.dataset.yearselect;
//       event.currentTarget.classList.toggle('active');
//       const cards = document.querySelectorAll('.card')
//       const cardsType = document.querySelectorAll(`[data-year="${type}"]`)
//       cards.forEach(card => card.style.display = 'none')
//       cardsType.forEach(card => card.style.display = null)
//     }
//     })
//   })
// }

// export {filterByYear};
