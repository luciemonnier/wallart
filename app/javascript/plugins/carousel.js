import $ from 'jquery';
import 'slick-carousel';

const slickCarousel = () => {
  $('.category-row').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3
  });
}

export { slickCarousel };
