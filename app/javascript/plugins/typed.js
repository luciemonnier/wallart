import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["lobby", "restaurant", "boutique", "reception", "hotel", "couloir"],
    typeSpeed: 90,
    loop: true
  });
}

export { loadDynamicBannerText };
