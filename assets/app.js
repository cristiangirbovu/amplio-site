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

  // Tabelele .cmp pe telefon: capul de tabel e ascuns sub 640 px, asa ca fiecare celula primeste numele coloanei
  document.querySelectorAll('table.cmp').forEach(function(t){
    var h=[].map.call(t.querySelectorAll('thead th'),function(th){return th.textContent.trim()});
    t.querySelectorAll('tbody tr').forEach(function(tr){[].forEach.call(tr.children,function(td,i){if(h[i])td.setAttribute('data-label',h[i])})});
  });

  // Current year in footer
  var y=document.getElementById('yr');if(y)y.textContent=new Date().getFullYear();
})();

/* ============================================================
   Măsurare: Google Analytics 4 în modul de consimțământ Google (Consent Mode v2),
   Microsoft Clarity și semnalele pentru Google Ads.
   - Google Analytics se încarcă pe toate paginile. Fără acord nu salvează și nu
     citește cookie-uri; trimite doar semnale fără identificatori.
   - Statistică (GA4 cu cookie-uri, Microsoft Clarity): doar cu acord.
   - Marketing (Google Ads: ad_storage, ad_user_data, ad_personalization): doar cu acord.
   - Alegerea se păstrează 12 luni, apoi bannerul apare din nou.
   ============================================================ */
(function(){
  var GA4_ID='G-YZSJLJ5TG2';
  var CLARITY_ID='yx5fclguw8';
  var KEY='amplio_consent', VECHI='amplio_cookie_consent', ZILE=365;

  function citeste(k,s){try{return (s||localStorage).getItem(k)}catch(e){return null}}
  function scrie(k,v,s){try{(s||localStorage).setItem(k,v)}catch(e){}}
  function sterge(k,s){try{(s||localStorage).removeItem(k)}catch(e){}}

  // Alegerea veche acoperea doar statistica, așa că întrebăm din nou, cu ambele categorii
  sterge(VECHI);
  function alegereSalvata(){
    var r=citeste(KEY);if(!r)return null;
    try{var o=JSON.parse(r);if(!o||typeof o.t!=='number'||Date.now()-o.t>ZILE*864e5)return null;return {s:!!o.s,m:!!o.m}}catch(e){return null}
  }
  var ales=alegereSalvata();
  function stare(x){
    var s=x&&x.s?'granted':'denied',m=x&&x.m?'granted':'denied';
    return {analytics_storage:s,ad_storage:m,ad_user_data:m,ad_personalization:m};
  }

  // Google Analytics 4: se încarcă mereu, iar cookie-urile doar cu acord
  window.dataLayer=window.dataLayer||[];
  window.gtag=function(){window.dataLayer.push(arguments)};
  window.gtag('consent','default',stare(ales));
  window.gtag('set','ads_data_redaction',!(ales&&ales.m));
  window.gtag('js',new Date());
  window.gtag('config',GA4_ID);
  (function(){var s=document.createElement('script');s.async=true;s.src='https://www.googletagmanager.com/gtag/js?id='+GA4_ID;document.head.appendChild(s)})();

  // Microsoft Clarity: doar cu acord pentru Statistică
  function incarcaClarity(x){
    if(!CLARITY_ID||window.__amplioClarity)return;window.__amplioClarity=true;
    (function(c,l,a,r,i,t,y){c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};t=l.createElement(r);t.async=1;t.src='https://www.clarity.ms/tag/'+i;y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y)})(window,document,'clarity','script',CLARITY_ID);
    window.clarity('consentv2',{ad_Storage:x&&x.m?'granted':'denied',analytics_Storage:'granted'});
  }
  if(ales&&ales.s)incarcaClarity(ales);

  // Eveniment către GA4 și, ca etichetă pe înregistrări, către Clarity
  window.amplioTrack=function(nume,param){
    window.gtag('event',nume,param||{});
    if(window.clarity)window.clarity('event',nume);
  };

  // Cererea (audit sau mesaj) se numără o singură dată, pe pagina de mulțumire,
  // și doar dacă formularul chiar a fost trimis din acest tab
  document.addEventListener('submit',function(e){
    var f=e.target;
    if(f&&f.getAttribute&&f.getAttribute('data-lead')){try{sessionStorage.setItem('amplio_lead',f.getAttribute('data-lead'))}catch(x){}}
  },true);
  if(location.pathname.indexOf('/multumim/')===0){
    var lead=null;
    try{lead=sessionStorage.getItem('amplio_lead');sessionStorage.removeItem('amplio_lead')}catch(e){}
    if(lead)window.amplioTrack('generate_lead',{form_name:lead});
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

  // Retragerea acordului: șterge cookie-urile categoriei, de pe toate variantele de domeniu
  function stergeCookieuri(re){
    var d=location.hostname,dom=['',d,'.'+d,'.'+d.split('.').slice(-2).join('.')];
    document.cookie.split(';').forEach(function(c){
      var n=c.split('=')[0].trim();
      if(re.test(n))dom.forEach(function(x){document.cookie=n+'=; Max-Age=0; path=/'+(x?'; domain='+x:'')});
    });
  }

  function aplica(x){
    var aveaS=!!(ales&&ales.s),aveaM=!!(ales&&ales.m);
    scrie(KEY,JSON.stringify({s:x.s?1:0,m:x.m?1:0,t:Date.now()}));
    window.gtag('consent','update',stare(x));
    window.gtag('set','ads_data_redaction',!x.m);
    if(x.s&&!window.__amplioClarity)incarcaClarity(x);
    else if(window.clarity)window.clarity('consentv2',{ad_Storage:x.m?'granted':'denied',analytics_Storage:x.s?'granted':'denied'});
    ales={s:!!x.s,m:!!x.m};
    if((aveaS&&!x.s)||(aveaM&&!x.m)){
      if(aveaS&&!x.s){if(window.clarity)window.clarity('consent',false);stergeCookieuri(/^(_ga|_gid|_clck|_clsk)/)}
      if(aveaM&&!x.m)stergeCookieuri(/^_gcl_/);
      location.reload();
    }
  }

  function arataBanner(setari){
    var vechi=document.querySelector('.cookie-banner');if(vechi)vechi.remove();
    var x=ales||{s:false,m:false};
    var b=document.createElement('div');
    b.className='cookie-banner'+(setari?' prefs':'');
    b.setAttribute('role','dialog');
    b.setAttribute('aria-label','Preferințe cookie-uri');
    b.innerHTML='<p>Folosim cookie-uri de statistică (Google Analytics și Microsoft Clarity), ca să vedem cum este folosit site-ul, și, cu acordul tău, cookie-uri de marketing (Google Ads), ca să măsurăm cererile venite din reclame. Sunt opționale și le poți refuza fără nicio consecință. Detalii în <a href="/cookies/">politica de cookies</a>.</p>'+
      '<div class="cookie-prefs">'+
        '<label class="cookie-opt"><input type="checkbox" checked disabled><span><b>Necesare</b>Țin minte alegerea ta și protejează site-ul. Sunt mereu active.</span></label>'+
        '<label class="cookie-opt"><input type="checkbox" data-cat="s"'+(x.s?' checked':'')+'><span><b>Statistică</b>Google Analytics și Microsoft Clarity: cum este folosit site-ul.</span></label>'+
        '<label class="cookie-opt"><input type="checkbox" data-cat="m"'+(x.m?' checked':'')+'><span><b>Marketing</b>Google Ads: măsurarea cererilor venite din reclame și remarketing.</span></label>'+
      '</div>'+
      '<div class="cookie-actions">'+
        '<button type="button" class="btn btn-primary cookie-save" data-cookie="salveaza">Salvează alegerea</button>'+
        '<button type="button" class="btn btn-primary" data-cookie="toate">Accept toate</button>'+
        '<button type="button" class="btn btn-ghost" data-cookie="necesare">Doar necesare</button>'+
        '<button type="button" class="btn btn-ghost cookie-set" data-cookie="setari">Setări</button>'+
      '</div>';
    document.body.appendChild(b);
    document.body.classList.add('cb-open');
    b.addEventListener('click',function(e){
      var btn=e.target.closest('[data-cookie]');if(!btn)return;
      var o=btn.getAttribute('data-cookie');
      if(o==='setari'){b.classList.add('prefs');return}
      var r=o==='toate'?{s:true,m:true}:o==='necesare'?{s:false,m:false}:
        {s:!!b.querySelector('[data-cat="s"]').checked,m:!!b.querySelector('[data-cat="m"]').checked};
      b.remove();document.body.classList.remove('cb-open');
      aplica(r);
    });
  }

  // „Setări cookie-uri” din subsol și butonul din politica de cookies
  document.addEventListener('click',function(e){
    var t=e.target.closest&&e.target.closest('[data-cookie-settings],[data-cookie-reset]');
    if(!t)return;
    e.preventDefault();
    arataBanner(true);
  });

  if(!ales)arataBanner(false);
})();
