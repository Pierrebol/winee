const filterAll = () => {
  const allFilters = document.querySelectorAll('.checkbox-cat, .checkbox-country, .checkbox-year');
  if (allFilters) {
  const filters = []
  allFilters.forEach((filter) => {
    filter.addEventListener('click', (event) => {
      if(event.currentTarget.classList.contains("checkbox-cat")){
        if(event.currentTarget.classList.contains('active')){
          event.currentTarget.classList.remove('active');
          const type = event.currentTarget.dataset.select;
          var idx = filters.indexOf(`[data-category="${type}"]`)
          if (idx != -1) filters.splice(idx, 1);
        } else {
        const type = event.currentTarget.dataset.select;
        filters.push(`[data-category="${type}"]`)
        event.currentTarget.classList.toggle('active');
        }
      } else if(event.currentTarget.classList.contains("checkbox-country")) {
        if(event.currentTarget.classList.contains('active')){
          event.currentTarget.classList.remove('active');
          const country = event.currentTarget.dataset.select;
          var idx = filters.indexOf(`[data-country="${country}"]`)
          if (idx != -1) filters.splice(idx, 1);
        } else {
        const country = event.currentTarget.dataset.select;
        filters.push(`[data-country="${country}"]`)
        event.currentTarget.classList.toggle('active');
        }
      } else if(event.currentTarget.classList.contains("checkbox-year")) {
        if(event.currentTarget.classList.contains('active')){
          event.currentTarget.classList.remove('active');
          const year = event.currentTarget.dataset.select;
          var idx = filters.indexOf(`[data-year="${year}"]`)
          if (idx != -1) filters.splice(idx, 1);
        } else {
          const year = event.currentTarget.dataset.select;
          filters.push(`[data-year="${year}"]`)
          event.currentTarget.classList.toggle('active');
        }
      }
      const cards = document.querySelectorAll('.card')
      let finalFilters = ``
      filters.forEach((filter) => {
        finalFilters += filter
      })
      if(finalFilters===``){
        cards.forEach(card => card.style.display = null)
      } else {
      const cardsType = document.querySelectorAll(`${finalFilters}`)
      cards.forEach(card => card.style.display = 'none')
      cardsType.forEach(card => card.style.display = null)
      }
    })
  })
  }
}

export {filterAll};

