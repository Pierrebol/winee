const filterDropdown = (selector) => {
  var checkList = document.getElementById(selector);
  if (checkList) {
  checkList.getElementsByClassName('anchor')[0].onclick = function(evt) {
    if (checkList.classList.contains('visible'))
      checkList.classList.remove('visible');
    else
      checkList.classList.add('visible');
  }
  }
}


export {filterDropdown};

