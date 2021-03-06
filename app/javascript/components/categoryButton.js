const filterByType = () => {
  const btnsType = document.querySelectorAll('.btn-category');
  if (btnsType) {
  btnsType.forEach((btn) => {
    btn.addEventListener('click', (event) => {
      if(event.currentTarget.classList.contains('active')){
        event.currentTarget.classList.remove('active');
        const cards = document.querySelectorAll('.card');
        cards.forEach(card => card.style.display = null)
      } else {
      const type = event.currentTarget.dataset.btncategory;
      event.currentTarget.classList.toggle('active');
      const cards = document.querySelectorAll('.card')
      const cardsSpirit = document.querySelectorAll(`[data-category="Spiritueux"]`)
      if(type == "Spiritueux") {
        cards.forEach(card => card.style.display = 'none')
        cardsSpirit.forEach(card => card.style.display = null)
      } else {
        cards.forEach(card => card.style.display = null)
        cardsSpirit.forEach(card => card.style.display = 'none')
      }
    }
    })
  })
  }
}

export {filterByType};
