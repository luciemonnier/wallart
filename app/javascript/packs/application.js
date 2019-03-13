import "bootstrap";
import { loadDynamicBannerText } from '../plugins/typed';
import { slickCarousel } from '../plugins/carousel'
import "slick-carousel/slick/slick.css"
import "slick-carousel/slick/slick-theme.css"

const carousel = document.querySelector('.category-row')
if (carousel) {
  slickCarousel();
}

const banner = document.getElementById('banner-typed-text');
if (banner) {
  loadDynamicBannerText();
}
