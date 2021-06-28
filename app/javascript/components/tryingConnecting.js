// Mise en pause le temps qu'on trouve une solution

// const filterAll = () => {
//   const allFilters = document.querySelectorAll('.checkbox-cat, .checkbox-country, .checkbox-year');

//   allFilters.forEach((filter) => {
//     filter.addEventListener('click', (event) => {
//       if(event.currentTarget.classList.contains('active')){
//         event.currentTarget.classList.remove('active');
//         const cards = document.querySelectorAll('.card');
//         cards.forEach(card => card.style.display = null)
//       } else {
//       const type = event.currentTarget.dataset.categoryselect;
//       const type2 = event.currentTarget.dataset.countryselect;
//       const type3 = event.currentTarget.dataset.yearselect;
//       event.currentTarget.classList.toggle('active');
//       const cards = document.querySelectorAll('.card')
//       const cardsType = document.querySelectorAll(`[data-category="${type}"]`)
//       const cardsCountry = document.querySelectorAll(`[data-country="${type2}"]`)
//       const cardsYear = document.querySelectorAll(`[data-year="${type3}"]`)
//       console.log(cardsType)
//       console.log(cardsCountry)
//       console.log(cardsYear)
//       cards.forEach(card => card.style.display = 'none')
//       cardsType.forEach(card => card.style.display = null)
//       cardsCountry.forEach(card => card.style.display = null)
//       cardsYear.forEach(card => card.style.display = null)
//     }
//     })
//   })
// }

// export {filterAll};
