const initCarrousel = () => {
  const carrousel = document.querySelector('.carousel')
  if (carrousel){
  $('.carousel').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 2000,
  });
  }
};

export { initCarrousel };
