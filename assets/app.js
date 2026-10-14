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

  // Video hero: doar pe ecrane late (>= 768px), fara „economisire date” si fara „miscare redusa”.
  // Pe telefon ramane imaginea (poster), ca pagina sa nu mai descarce 3 MB.
  var v=document.getElementById('herovid');
  if(v&&v.getAttribute('data-src')){
    var cn=navigator.connection||{};
    if(window.matchMedia('(min-width:768px)').matches&&!window.matchMedia('(prefers-reduced-motion:reduce)').matches&&!cn.saveData){
      var s=document.createElement('source');s.src=v.getAttribute('data-src');s.type='video/mp4';v.appendChild(s);
      v.autoplay=true;v.load();var pr=v.play&&v.play();if(pr&&pr.catch)pr.catch(function(){});
    }
  }

  // Current year in footer
  var y=document.getElementById('yr');if(y)y.textContent=new Date().getFullYear();
})();

/* ============================================================
   Măsurare: Google Analytics 4 + Microsoft Clarity
   Se încarcă DOAR după „Accept” în bannerul de cookie-uri.
   Fără acord (sau cu ID-urile goale) nu pleacă nimic spre Google
   sau Microsoft și nu se pune niciun cookie.
   ============================================================ */
(function(){
  var GA4_ID='G-YZSJLJ5TG2';
  var CLARITY_ID='yx5fclguw8';

  var KEY='amplio_cookie_consent';
  function citeste(k,s){try{return (s||localStorage).getItem(k)}catch(e){return null}}
  function scrie(k,v,s){try{(s||localStorage).setItem(k,v)}catch(e){}}
  function sterge(k,s){try{(s||localStorage).removeItem(k)}catch(e){}}

  // Eveniment către GA4 și, ca etichetă pe înregistrări, către Clarity
  window.amplioTrack=function(nume,param){
    if(window.gtag)window.gtag('event',nume,param||{});
    if(window.clarity)window.clarity('event',nume);
  };

  // Cererea de audit se numără o singură dată și doar dacă formularul chiar a fost trimis din acest tab
  var leadNou=null;
  if(location.pathname==='/multumim/'){
    try{leadNou=sessionStorage.getItem('amplio_lead');sessionStorage.removeItem('amplio_lead')}catch(e){}
  }

  function incarcaGA4(){
    if(!GA4_ID||window.__amplioGa)return;window.__amplioGa=true;
    window.dataLayer=window.dataLayer||[];
    window.gtag=function(){window.dataLayer.push(arguments)};
    window.gtag('consent','default',{analytics_storage:'granted',ad_storage:'denied',ad_user_data:'denied',ad_personalization:'denied'});
    window.gtag('js',new Date());
    window.gtag('config',GA4_ID);
    var s=document.createElement('script');s.async=true;s.src='https://www.googletagmanager.com/gtag/js?id='+GA4_ID;document.head.appendChild(s);
  }
  function incarcaClarity(){
    if(!CLARITY_ID||window.__amplioClarity)return;window.__amplioClarity=true;
    (function(c,l,a,r,i,t,y){c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};t=l.createElement(r);t.async=1;t.src='https://www.clarity.ms/tag/'+i;y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y)})(window,document,'clarity','script',CLARITY_ID);
    window.clarity('consentv2',{ad_Storage:'denied',analytics_Storage:'granted'});
  }
  function incarca(){
    incarcaGA4();incarcaClarity();
    if(leadNou){window.amplioTrack('generate_lead',{form_name:leadNou});leadNou=null}
  }

  // Unde se află linkul pe pagină
  function zona(a){
    if(a.closest('.fab'))return 'buton_flotant';
    if(a.closest('#mmenu'))return 'meniu_mobil';
    if(a.closest('nav'))return 'meniu';
    if(a.closest('footer'))return 'subsol';
    return 'continut';
  }
  document.addEventListener('click',function(e){
    if(!e.target.closest)return;
    var a=e.target.closest('a[href]');
    if(a){
      var h=a.getAttribute('href');
      if(h.indexOf('tel:')===0)window.amplioTrack('contact',{method:'telefon',link_location:zona(a)});
      else if(h.indexOf('wa.me')>-1)window.amplioTrack('contact',{method:'whatsapp',link_location:zona(a)});
      else if(h.indexOf('mailto:')===0)window.amplioTrack('contact',{method:'email',link_location:zona(a)});
      else if(h==='/audit-gratuit/'&&location.pathname!=='/audit-gratuit/')window.amplioTrack('cta_audit_click',{link_location:zona(a)});
      return;
    }
    // Scorul de vizibilitate AI: primul răspuns
    if(e.target.closest('.opt')&&!window.__amplioQuiz){window.__amplioQuiz=true;window.amplioTrack('quiz_start')}
  });
  // Calculatorul de investiție: prima bifă
  document.addEventListener('change',function(e){
    if(e.target.closest&&e.target.closest('.crow')&&!window.__amplioCalc){window.__amplioCalc=true;window.amplioTrack('calculator_use')}
  });

  // Retragerea acordului: șterge cookie-urile de analiză de pe toate variantele de domeniu
  function stergeCookieuri(){
    var d=location.hostname,dom=['',d,'.'+d,'.'+d.split('.').slice(-2).join('.')];
    document.cookie.split(';').forEach(function(c){
      var n=c.split('=')[0].trim();
      if(/^(_ga|_gid|_clck|_clsk)/.test(n))dom.forEach(function(x){document.cookie=n+'=; Max-Age=0; path=/'+(x?'; domain='+x:'')});
    });
  }

  function arataBanner(){
    if(document.querySelector('.cookie-banner'))return;
    var b=document.createElement('div');
    b.className='cookie-banner';
    b.setAttribute('role','dialog');
    b.setAttribute('aria-label','Preferințe cookie-uri');
    b.innerHTML='<p>Folosim cookie-uri de analiză (Google Analytics și Microsoft Clarity) ca să înțelegem cum este folosit site-ul. Sunt opționale și le poți refuza fără nicio consecință. Detalii în <a href="/cookies/">politica de cookies</a>.</p>'+
      '<div class="cookie-actions"><button type="button" class="btn btn-primary" data-cookie="accept">Accept</button><button type="button" class="btn btn-ghost" data-cookie="refuz">Doar necesare</button></div>';
    document.body.appendChild(b);
    b.addEventListener('click',function(e){
      var btn=e.target.closest('[data-cookie]');if(!btn)return;
      var opt=btn.getAttribute('data-cookie');
      scrie(KEY,opt);
      if(opt==='accept')incarca();
      b.remove();
    });
  }

  // Butonul „Schimbă opțiunea” din pagina de cookies
  document.addEventListener('click',function(e){
    if(!(e.target.closest&&e.target.closest('[data-cookie-reset]')))return;
    if(window.clarity)window.clarity('consent',false);
    sterge(KEY);stergeCookieuri();
    location.reload();
  });

  var r=citeste(KEY);
  if(r==='accept')incarca();
  else if(r!=='refuz')arataBanner();
})();
