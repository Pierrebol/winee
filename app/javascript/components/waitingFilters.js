// Mise en pause le temps qu'on trouve une solution

const filterAll = () => {
  const allFilters = document.querySelectorAll('.checkbox-cat, .checkbox-country, .checkbox-year');
      const categoryList = document.getElementById('list1')
      const countryList = document.getElementById('list3')
      const yearList = document.getElementById('list4')

  allFilters.forEach((filter) => {
    filter.addEventListener('click', (event) => {
      event.currentTarget.parentNode.parentNode.dataset.selected = event.currentTarget.dataset.select

      if(event.currentTarget.classList.contains('active')){
        event.currentTarget.classList.remove('active');
        const cards = document.querySelectorAll('.card');
        cards.forEach(card => card.style.display = null)
      } else {
      const type = categoryList.dataset.selected;
      const country = countryList.dataset.selected;
      const year = yearList.dataset.selected;
      event.currentTarget.classList.toggle('active');
      const cards = document.querySelectorAll('.card')
      const cardsType = document.querySelectorAll(`[data-category="${type}"][data-country="${country}"][data-year="${year}"]`)
      // if (year === null && country === null && year === null){
      //   cards.forEach(card => card.style.display = null)
      // } else if (year === null && country === null && year !== null){
      //   const cardsType = document.querySelectorAll(`[data-year="${year}"]`)
      //   cards.forEach(card => card.style.display = 'none')
      //   cardsType.forEach(card => card.style.display = null)
      // } else if (year === null && country !== null & year !== null){
      //   const cardsType = document.querySelectorAll(`[data-year="${year}"][data-country="${country}"]`)
      //   cards.forEach(card => card.style.display = 'none')
      //   cardsType.forEach(card => card.style.display = null)
      // } else if (year !== null && country !== null & year !== null){
      //   const cardsType = document.querySelectorAll(`[data-category="${type}"][data-year="${year}"][data-country="${country}"]`)
      //   cards.forEach(card => card.style.display = 'none')
      //   cardsType.forEach(card => card.style.display = null)
      // } else if (year !== null && country === null & year !== null){
      //   const cardsType = document.querySelectorAll(`[data-country="${country}"]`)
      //   cards.forEach(card => card.style.display = 'none')
      //   cardsType.forEach(card => card.style.display = null)
      // } else if (year !== null && country === null & year === null){
      //   const cardsType = document.querySelectorAll(`[data-category="${category}"]`)
      //   cards.forEach(card => card.style.display = 'none')
      //   cardsType.forEach(card => card.style.display = null)
      // }


      // const cardsCountry = document.querySelectorAll(`[data-country="${country}"]`)
      // const cardsYear = document.querySelectorAll(`[data-year="${year}"]`)
      cards.forEach(card => card.style.display = 'none')
      cardsType.forEach(card => card.style.display = null)
      // cardsCountry.forEach(card => card.style.display = null)
      // cardsYear.forEach(card => card.style.display = null)
    }
    })
  })
}

export {filterAll};
