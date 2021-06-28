const filterAll = () => {
  const allFilters = document.querySelectorAll('.checkbox-cat, .checkbox-country, .checkbox-year');
  const filters = []
  allFilters.forEach((filter) => {
    filter.addEventListener('click', (event) => {

      if(event.currentTarget.classList.contains('active')){
        event.currentTarget.classList.remove('active');
        const cards = document.querySelectorAll('.card');
        cards.forEach(card => card.style.display = null)
      } else {
        if(event.currentTarget.classList.contains("checkbox-cat")){
          const type = event.currentTarget.dataset.select;
          filters.push(`[data-category="${type}"]`)
        } else if(event.currentTarget.classList.contains("checkbox-country")) {
          const country = event.currentTarget.dataset.select;
          filters.push(`[data-country="${country}"]`)
        } else if(event.currentTarget.classList.contains("checkbox-year")) {
          const year = event.currentTarget.dataset.select;
          filters.push(`[data-year="${year}"]`)
        }
      event.currentTarget.classList.toggle('active');
      const cards = document.querySelectorAll('.card')

      let finalFilters = ``
      filters.forEach((filter) => {
        finalFilters += filter
      })
      console.log(finalFilters)
      const cardsType = document.querySelectorAll(`${finalFilters}`)

      cards.forEach(card => card.style.display = 'none')
      cardsType.forEach(card => card.style.display = null)
    }
    })
  })
}

export {filterAll};
