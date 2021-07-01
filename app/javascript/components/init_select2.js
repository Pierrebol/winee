import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  const select22 = document.querySelector('.select2')
  if (select22){
  $('.select2').select2();
  }
};

export { initSelect2 };
