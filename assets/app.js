/* AMPLIO — shared interactions */
(function(){
  // Nav scroll state
  var nav=document.getElementById('nav');
  if(nav){window.addEventListener('scroll',function(){nav.classList.toggle('scrolled',window.scrollY>40)},{passive:true})}

  // Mobile menu
  window.toggleMenu=function(){
    var m=document.getElementById('mmenu'),b=document.getElementById('burger');
    if(m)m.classList.toggle('open');
    if(b)b.classList.toggle('x');
  };

  // Reveal on scroll
  if('IntersectionObserver' in window){
    var io=new IntersectionObserver(function(es){es.forEach(function(x){if(x.isIntersecting){x.target.classList.add('in');io.unobserve(x.target)}})},{threshold:.12});
    document.querySelectorAll('.rev').forEach(function(el){io.observe(el)});
  } else {
    document.querySelectorAll('.rev').forEach(function(el){el.classList.add('in')});
  }

  // Reduced motion: pause hero video
  if(window.matchMedia('(prefers-reduced-motion:reduce)').matches){
    var v=document.getElementById('herovid');if(v){v.removeAttribute('autoplay');v.pause&&v.pause()}
  }

  // Current year in footer
  var y=document.getElementById('yr');if(y)y.textContent=new Date().getFullYear();
})();
