import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["salon", "cuisine", "salle de bain", "hall", "chambre"],
    typeSpeed: 90,
    loop: true
  });
}

export { loadDynamicBannerText };
