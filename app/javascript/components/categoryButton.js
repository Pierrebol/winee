const filterByType = () => {
  const btnsType = document.querySelectorAll('.btn-category');

  btnsType.forEach((btn) => {
    btn.addEventListener('click', (event) => {
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
    })
  })
}

export {filterByType};
