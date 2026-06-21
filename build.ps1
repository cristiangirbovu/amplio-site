# ============================================================
#  AMPLIO - generator static pentru paginile repetitive
#  (servicii + solutii). Ruleaza:  powershell -File build.ps1
#  IMPORTANT: fisierul trebuie salvat UTF-8 cu BOM ca PowerShell
#  5.1 sa citeasca diacriticele corect.
# ============================================================
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot

# ---------- NAV (identic pe tot site-ul) ----------
$NAV = @'
<nav id="nav">
  <div class="wrap">
    <a class="logo" href="/" aria-label="AMPLIO, Acasă">
      <svg viewBox="0 0 192 192" aria-hidden="true"><rect width="192" height="192" rx="40" fill="#0E2240" stroke="#C9A227" stroke-width="5"/><polygon points="56,138 96,48 136,138" fill="none" stroke="#F7F5F0" stroke-width="13" stroke-linejoin="round"/><polygon points="80,138 96,102 112,138" fill="#C9A227"/></svg>
      <span class="wm">AMPLIO</span>
    </a>
    <ul class="navlinks">
      <li class="has-drop"><a href="/servicii/">Servicii</a>
        <div class="drop">
          <a href="/servicii/performance-ads/"><b>Performance Ads</b><small>Google, Meta, TikTok</small></a>
          <a href="/servicii/seo-geo/"><b>SEO + GEO</b><small>Vizibilitate Google și AI</small></a>
          <a href="/servicii/social-media/"><b>Social Media</b><small>Conținut și calendar</small></a>
          <a href="/servicii/email-automatizari/"><b>Email &amp; Automatizări</b><small>Fluxuri care vând</small></a>
          <a href="/servicii/landing-pages-cro/"><b>Landing &amp; CRO</b><small>Pagini care convertesc</small></a>
          <a href="/servicii/cmo-extern/"><b>CMO Extern</b><small>Strategie senioră</small></a>
          <a href="/servicii/abonament-corporate/"><b>Abonament Corporate</b><small>Externalizare completă</small></a>
          <a class="all" href="/servicii/">Vezi toate serviciile &rarr;</a>
        </div>
      </li>
      <li class="has-drop"><a href="/solutii/">Soluții</a>
        <div class="drop">
          <a href="/solutii/marketing-ecommerce/"><b>eCommerce</b><small>Magazine online</small></a>
          <a href="/solutii/marketing-clinici/"><b>Clinici medicale</b><small>Pacienți, nu like-uri</small></a>
          <a href="/solutii/marketing-b2b/"><b>Servicii B2B</b><small>Pipeline previzibil</small></a>
          <a href="/solutii/marketing-horeca/"><b>HoReCa</b><small>Restaurante, ospitalitate</small></a>
          <a href="/solutii/marketing-export/"><b>Producători &amp; Export</b><small>Piețe UE</small></a>
          <a href="/solutii/marketing-imobiliare/"><b>Imobiliare</b><small>Dezvoltatori</small></a>
          <a class="all" href="/solutii/">Vezi toate soluțiile &rarr;</a>
        </div>
      </li>
      <li><a href="/blog/">Blog</a></li>
      <li><a href="/despre/">Despre</a></li>
      <li><a href="/audit-gratuit/" class="navcta">Audit gratuit</a></li>
    </ul>
    <button class="burger" id="burger" aria-label="Deschide meniul" onclick="toggleMenu()"><span></span><span></span><span></span></button>
  </div>
  <div class="mmenu" id="mmenu">
    <a href="/servicii/" onclick="toggleMenu()">Servicii</a>
    <a class="sub" href="/servicii/performance-ads/" onclick="toggleMenu()">Performance Ads</a>
    <a class="sub" href="/servicii/seo-geo/" onclick="toggleMenu()">SEO + GEO</a>
    <a class="sub" href="/servicii/social-media/" onclick="toggleMenu()">Social Media</a>
    <a href="/solutii/" onclick="toggleMenu()">Soluții</a>
    <a class="sub" href="/solutii/marketing-ecommerce/" onclick="toggleMenu()">eCommerce</a>
    <a class="sub" href="/solutii/marketing-clinici/" onclick="toggleMenu()">Clinici</a>
    <a href="/blog/" onclick="toggleMenu()">Blog</a>
    <a href="/despre/" onclick="toggleMenu()">Despre</a>
    <a href="/audit-gratuit/" class="mcta" onclick="toggleMenu()">Cere auditul gratuit &rarr;</a>
  </div>
</nav>
'@

# ---------- FOOTER (identic pe tot site-ul) ----------
$FOOTER = @'
<footer>
  <div class="wrap">
    <div class="foot-top">
      <div>
        <a class="logo" href="/" aria-label="AMPLIO">
          <svg viewBox="0 0 192 192" aria-hidden="true"><rect width="192" height="192" rx="40" fill="#0E2240" stroke="#C9A227" stroke-width="5"/><polygon points="56,138 96,48 136,138" fill="none" stroke="#F7F5F0" stroke-width="13" stroke-linejoin="round"/><polygon points="80,138 96,102 112,138" fill="#C9A227"/></svg>
          <span class="wm">AMPLIO</span>
        </a>
        <p>Creștere proiectată, nu promisă.<br>București, România &middot; operăm în RO + UE</p>
      </div>
      <div class="foot-col">
        <h4>Servicii</h4>
        <a href="/servicii/performance-ads/">Performance Ads</a>
        <a href="/servicii/seo-geo/">SEO + GEO</a>
        <a href="/servicii/social-media/">Social Media</a>
        <a href="/servicii/email-automatizari/">Email &amp; Automatizări</a>
        <a href="/servicii/abonament-corporate/">Abonament Corporate</a>
      </div>
      <div class="foot-col">
        <h4>Soluții</h4>
        <a href="/solutii/marketing-ecommerce/">eCommerce</a>
        <a href="/solutii/marketing-clinici/">Clinici</a>
        <a href="/solutii/marketing-b2b/">Servicii B2B</a>
        <a href="/solutii/marketing-horeca/">HoReCa</a>
        <a href="/solutii/marketing-imobiliare/">Imobiliare</a>
      </div>
      <div class="foot-col">
        <h4>Resurse &amp; Companie</h4>
        <a href="/blog/">Blog</a>
        <a href="/scor-vizibilitate-ai/">Scor vizibilitate AI</a>
        <a href="/calculator-investitie/">Calculator investiție</a>
        <a href="/despre/">Despre</a>
        <a href="/contact/">Contact</a>
      </div>
    </div>
    <div class="foot-bot">
      <span>&copy; <span id="yr">2026</span> AMPLIO DIGITAL S.R.L.</span>
      <span><a href="/termeni/">Termeni</a> &middot; <a href="/confidentialitate/">Confidențialitate</a> &middot; <a href="/cookies/">Cookies</a></span>
    </div>
  </div>
</footer>
'@

# ---------- Wrapper HTML ----------
function Build-Page($p) {
  $canonical = "https://amplio.ro/$($p.path)/"
  $jsonld = ""
  if ($p.jsonld) { $jsonld = "<script type=""application/ld+json"">$($p.jsonld)</script>" }
  $html = @"
<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Security-Policy" content="default-src 'self'; img-src 'self' data:; media-src 'self'; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com; script-src 'self' 'unsafe-inline'; base-uri 'self'; form-action 'self' mailto:; object-src 'none'; frame-ancestors 'none'; upgrade-insecure-requests">
<meta name="referrer" content="strict-origin-when-cross-origin">
<title>$($p.title)</title>
<meta name="description" content="$($p.desc)">
<link rel="canonical" href="$canonical">
<link rel="icon" type="image/svg+xml" href="/favicon.svg">
<meta property="og:type" content="website">
<meta property="og:url" content="$canonical">
<meta property="og:title" content="$($p.title)">
<meta property="og:description" content="$($p.desc)">
<meta property="og:image" content="https://amplio.ro/assets/og-amplio.png">
<meta property="og:locale" content="ro_RO">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/assets/style.css">
<script type="application/ld+json">$($p.crumbsJson)</script>
$jsonld
</head>
<body id="top">
$NAV
$($p.body)
$FOOTER
<script src="/assets/app.js"></script>
</body>
</html>
"@
  $dir = Join-Path $root $p.path
  if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $out = Join-Path $dir "index.html"
  [System.IO.File]::WriteAllText($out, $html, (New-Object System.Text.UTF8Encoding($false)))
  Write-Host "  generat: $($p.path)/index.html"
}

# ---------- Helper: breadcrumb JSON-LD + HTML ----------
function Crumbs($trail) {
  $items = @()
  for ($i=0; $i -lt $trail.Count; $i++) {
    $u = $trail[$i][1]; if ($u -ne '/') { $u = $u.TrimEnd('/') + '/' }
    $items += "{""@type"":""ListItem"",""position"":$($i+1),""name"":""$($trail[$i][0])"",""item"":""https://amplio.ro$u""}"
  }
  return "{""@context"":""https://schema.org"",""@type"":""BreadcrumbList"",""itemListElement"":[$($items -join ',')]}"
}
function CrumbsHtml($trail) {
  $parts = @()
  for ($i=0; $i -lt $trail.Count; $i++) {
    if ($i -eq $trail.Count-1) { $parts += "<span aria-current=""page"">$($trail[$i][0])</span>" }
    else { $cu = $trail[$i][1]; if ($cu -ne '/') { $cu = $cu.TrimEnd('/') + '/' }; $parts += "<a href=""$cu"">$($trail[$i][0])</a>" }
  }
  return '<nav class="crumbs" aria-label="breadcrumb">' + ($parts -join '<span class="sep">&rsaquo;</span>') + '</nav>'
}

# Helper pentru o pagina de SERVICIU (layout standard)
function SvcBody($eyebrow,$h1a,$h1b,$lead,$crumbsHtml,$introHtml,$listItems,$price,$relatedHtml) {
  $li = ($listItems | ForEach-Object { "<li>$_</li>" }) -join "`n          "
  return @"
<section class="subhero">
  <div class="grid-bg"></div>
  <div class="wrap">
    $crumbsHtml
    <span class="eyebrow">$eyebrow</span>
    <h1>$h1a <span class="g">$h1b</span></h1>
    <p class="lead">$lead</p>
    <div class="hero-cta" style="margin-top:30px">
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
      <a class="btn btn-ghost" href="/servicii/">Toate serviciile</a>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="cols2">
      <div>
        $introHtml
      </div>
      <div class="panelcard">
        <h3>Ce primești</h3>
        <ul class="flist">
          $li
        </ul>
        <p class="price" style="margin-top:22px;font-size:15px">$price</p>
      </div>
    </div>
  </div>
</section>
<section class="bg-2">
  <div class="wrap rev">
    <div class="ctaband">
      <h2>Nu ești sigur ce ți se potrivește?</h2>
      <p class="lead center">Cere auditul gratuit. În 48 de ore primești o analiză personalizată și primii 3 pași, fără obligații.</p>
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
    </div>
    $relatedHtml
  </div>
</section>
"@
}

# Helper pentru o pagina de SOLUTIE (layout standard)
function SolBody($eyebrow,$h1a,$h1b,$lead,$crumbsHtml,$pain,$listItems,$proofNum,$proofText,$relatedHtml) {
  $li = ($listItems | ForEach-Object { "<li>$_</li>" }) -join "`n          "
  return @"
<section class="subhero">
  <div class="grid-bg"></div>
  <div class="wrap">
    $crumbsHtml
    <span class="eyebrow">$eyebrow</span>
    <h1>$h1a <span class="g">$h1b</span></h1>
    <p class="lead">$lead</p>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <blockquote style="border-left:3px solid var(--gold);padding:14px 20px;margin:0 0 24px;color:var(--gold2);font-style:italic;background:rgba(201,162,39,.08);border-radius:0 11px 11px 0">$pain</blockquote>
        <h2 style="font-size:clamp(24px,3.4vw,32px)">Ce facem pentru tine</h2>
        <ul class="flist" style="margin-top:18px">
          $li
        </ul>
      </div>
      <div class="panelcard" style="align-self:start">
        <div style="font-family:var(--display);font-weight:700;font-size:42px;color:var(--gold);line-height:1">$proofNum</div>
        <p style="margin:10px 0 18px;font-size:14.5px">$proofText</p>
        <div style="border-top:1px solid var(--line);padding-top:15px;font-size:14px;color:var(--txt);line-height:1.9">&#10003; KPI scriși în contract<br>&#10003; Clauză de ieșire la 90 de zile<br>&#10003; Conturile rămân ale tale</div>
        <a class="btn btn-primary" href="/audit-gratuit/" style="margin-top:20px;width:100%;justify-content:center">Cere auditul gratuit <span class="ar">&rarr;</span></a>
      </div>
    </div>
  </div>
</section>
<section class="bg-2">
  <div class="wrap rev">
    $relatedHtml
  </div>
</section>
"@
}

# Mic helper pentru blocul "servicii relevante"
function Related($title,$links) {
  $a = ($links | ForEach-Object { "<a class=""svc"" href=""$($_[1].TrimEnd('/'))/""><h3>$($_[0])</h3><span class=""more"">Vezi &rarr;</span></a>" }) -join "`n      "
  return @"
<h2 style="font-size:clamp(22px,2.6vw,28px);margin-bottom:4px">$title</h2>
    <div class="svc-grid">
      $a
    </div>
"@
}

# ============================================================
#  CONTINUTUL PAGINILOR  - editeaza aici
# ============================================================
$pages = @()

# ---- SERVICII ----
$pages += @{
  path='servicii/performance-ads'
  title='Administrare Google Ads, Meta și TikTok | Performance Ads | AMPLIO'
  desc='Agenție de performance ads pentru firme din România: Google Ads, Meta și TikTok administrate complet, cu creație AI, optimizare săptămânală și raport pe venit. De la 450 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Performance Ads','/servicii/performance-ads') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Administrare campanii publicitare (PPC)","provider":{"@type":"Organization","name":"AMPLIO"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"450"}}'
  body=(SvcBody 'Serviciu &middot; Performance Ads' 'Reclame care aduc vânzări,' 'nu doar afișări.' 'Administrăm complet Google Ads, Meta și TikTok: strategie, creație asistată de AI, optimizare săptămânală și raport pe venit real, nu pe impresii. Conturile rămân mereu ale tale.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Performance Ads','/servicii/performance-ads') )) '<h2>Bugetul tău de ads, condus de cifre</h2><p class="lead" style="margin-bottom:18px">Cele mai multe firme cheltuie pe ads fără să știe ce canal aduce vânzări. Noi pornim de la tracking corect și baseline semnat, apoi optimizăm săptămânal pe metrica ce contează: costul pe client nou și venitul generat.</p><p>Creația o producem rapid cu AI, sub control uman, ca să testăm mai multe variante decât o agenție clasică. Iar dacă are sens pentru tine, intrăm pe modelul de parteneriat: fee fix redus + procent doar din creșterea vânzărilor.</p>' @('<b>Strategie de canal:</b> unde merită bugetul tău (Google, Meta, TikTok)','<b>Creație AI</b> cu control uman: mai multe variante, testate constant','<b>Optimizare săptămânală</b> pe cost/client și ROAS','<b>Tracking corect</b> verificat cu teste reale înainte de spend','<b>Raport lunar pe venit</b>, nu pe afișări','<b>Conturile rămân ale tale</b>, transparență 100%') 'De la <strong style="color:var(--off)">450 &euro;/lună</strong> sau % din ad spend' (Related 'Merge mână în mână cu' @( ,@('Landing Pages &amp; CRO','/servicii/landing-pages-cro'); ,@('SEO + GEO','/servicii/seo-geo'); ,@('Email &amp; Automatizări','/servicii/email-automatizari') )))
}
$pages += @{
  path='servicii/social-media'
  title='Administrare social media și conținut | AMPLIO'
  desc='Servicii de social media pentru firme din România: calendar lunar, creație AI cu control uman, programare și raport. Pachete de la 350 EUR/lună. Vocea brandului tău, fără efortul tău.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Social Media','/servicii/social-media') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Administrare social media","provider":{"@type":"Organization","name":"AMPLIO"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"350"}}'
  body=(SvcBody 'Serviciu &middot; Social Media' 'Vocea brandului tău,' 'fără efortul tău.' 'Calendar lunar, creație cu AI sub control uman, programare și raport. Păstrăm tonul brandului tău și publicăm constant, ca să nu mai depindă totul de inspirația de moment.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Social Media','/servicii/social-media') )) '<h2>Constanța bate inspirația</h2><p class="lead" style="margin-bottom:18px">Problema social media nu e ideea de azi, e ritmul de fiecare săptămână. Noi construim un calendar editorial, producem conținutul și îl programăm, ca prezența ta să fie constantă și coerentă.</p><p>Creația o accelerăm cu AI, dar fiecare postare trece prin control uman și prin vocea brandului tău. Tu aprobi, noi publicăm și măsurăm.</p>' @('<b>Calendar editorial lunar</b> aliniat cu obiectivele tale','<b>Creație AI + control uman:</b> text și vizual','<b>Programare</b> pe toate platformele relevante','<b>Raport lunar</b> pe creștere și engagement','<b>Micro-influenceri &amp; UGC</b> prin rețeaua de parteneri (opțional)') 'Pachete <strong style="color:var(--off)">350 / 600 / 950 &euro;</strong>/lună' (Related 'Merge mână în mână cu' @( ,@('Performance Ads','/servicii/performance-ads'); ,@('SEO + GEO','/servicii/seo-geo') )))
}
$pages += @{
  path='servicii/email-automatizari'
  title='Email marketing și automatizări CRM | AMPLIO'
  desc='Email marketing și automatizări pentru firme din România: fluxuri de bun venit, coș abandonat și reactivare. În e-commerce, emailul aduce tipic 20-30% din venit. De la 250 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Email & Automatizări','/servicii/email-automatizari') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Email marketing si automatizari","provider":{"@type":"Organization","name":"AMPLIO"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"250"}}'
  body=(SvcBody 'Serviciu &middot; Email &amp; Automatizări' 'Fluxuri care vând' 'în timp ce dormi.' 'Bun venit, coș abandonat, reactivare: secvențe automate care aduc venit fără efort recurent. În e-commerce, emailul generează tipic 20-30% din venitul total.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Email & Automatizări','/servicii/email-automatizari') )) '<h2>Cel mai profitabil canal, neglijat de toată lumea</h2><p class="lead" style="margin-bottom:18px">Emailul nu are cost pe click și vorbește cu oameni care deja te cunosc. Bine făcut, e cel mai mare ROI din marketing. Noi construim fluxurile o dată și lucrează luni întregi.</p><p>Conectăm tot la CRM-ul tău, segmentăm și testăm subiecte și oferte, cu raport pe venitul generat de email.</p>' @('<b>Fluxuri automate:</b> bun venit, coș abandonat, reactivare, post-cumpărare','<b>Segmentare</b> și personalizare pe comportament','<b>Integrare CRM</b> (HubSpot, Klaviyo, Mailchimp etc.)','<b>Teste A/B</b> pe subiecte și oferte','<b>Raport pe venitul email</b>, nu pe rata de deschidere') 'De la <strong style="color:var(--off)">250 &euro;/lună</strong> sau % din venitul email' (Related 'Merge mână în mână cu' @( ,@('Performance Ads','/servicii/performance-ads'); ,@('Landing Pages &amp; CRO','/servicii/landing-pages-cro') )))
}
$pages += @{
  path='servicii/landing-pages-cro'
  title='Landing pages și optimizarea conversiei (CRO) | AMPLIO'
  desc='Landing pages care convertesc și optimizarea conversiei (CRO) pe date reale: heatmaps, înregistrări, teste A/B. Landing de la 450 EUR, CRO de la 400 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Landing & CRO','/servicii/landing-pages-cro') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Landing pages si optimizarea conversiei","provider":{"@type":"Organization","name":"AMPLIO"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"400"}}'
  body=(SvcBody 'Serviciu &middot; Landing &amp; CRO' 'Același trafic,' 'mai multe conversii.' 'Construim pagini făcute să convertească și le optimizăm continuu pe date reale: heatmaps, înregistrări de sesiune și teste A/B. Nu ghicim, măsurăm.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Landing & CRO','/servicii/landing-pages-cro') )) '<h2>Traficul costă. Risipa lui costă și mai mult</h2><p class="lead" style="margin-bottom:18px">Dacă aduci vizitatori pe o pagină care nu convertește, plătești de două ori. CRO scoate mai multe vânzări din același trafic, fără buget suplimentar de ads.</p><p>Pornim de la date: unde se opresc oamenii, unde dau scroll, unde abandonează. Apoi testăm ipoteze și păstrăm ce câștigă.</p>' @('<b>Landing pages</b> construite pe principii de conversie','<b>Heatmaps &amp; înregistrări</b> de sesiune','<b>Teste A/B</b> pe titluri, oferte, formulare','<b>Optimizarea formularelor</b> și a fluxului de checkout','<b>Raport pe rata de conversie</b> și impact în venit') 'Landing de la <strong style="color:var(--off)">450 &euro;</strong> &middot; CRO de la <strong style="color:var(--off)">400 &euro;</strong>/lună' (Related 'Merge mână în mână cu' @( ,@('Performance Ads','/servicii/performance-ads'); ,@('Email &amp; Automatizări','/servicii/email-automatizari') )))
}
$pages += @{
  path='servicii/cmo-extern'
  title='CMO Extern (director de marketing fracționat) | AMPLIO'
  desc='CMO extern pentru firme din România: director de marketing senior, fracționat. Strategie, coordonarea furnizorilor și raport de board, fără costul unui angajat full-time. 800-1500 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('CMO Extern','/servicii/cmo-extern') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Director de marketing fractionat (CMO extern)","provider":{"@type":"Organization","name":"AMPLIO"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"800"}}'
  body=(SvcBody 'Serviciu &middot; CMO Extern' 'Strategie de director,' 'fără salariu de director.' 'Un director de marketing senior, fracționat: pune strategia, coordonează furnizorii și livrează raport de board lunar. Maxim 5 clienți simultan, ca să primești atenție reală.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('CMO Extern','/servicii/cmo-extern') )) '<h2>Ai nevoie de strategie, nu de încă un executant</h2><p class="lead" style="margin-bottom:18px">Multe firme au oameni care fac marketing, dar nimeni care să decidă direcția. Un CMO full-time bun costă enorm. CMO-ul extern îți dă exact creierul strategic, fracționat.</p><p>Stabilim obiective, priorități și bugete, coordonăm echipa și furnizorii și raportăm lunar la nivel de board. Tu rămâi cu deciziile, noi ducem greul de coordonare.</p>' @('<b>Strategie de marketing</b> și plan pe trimestre','<b>Coordonarea furnizorilor</b> și a echipei interne','<b>Bugetare</b> și alocare pe canale','<b>Raport de board lunar</b> pe obiective și rezultate','<b>Maxim 5 clienți simultan</b>, atenție reală') '<strong style="color:var(--off)">800-1.500 &euro;</strong>/lună' (Related 'Merge mână în mână cu' @( ,@('Abonament Corporate','/servicii/abonament-corporate'); ,@('Performance Ads','/servicii/performance-ads') )))
}
$pages += @{
  path='servicii/abonament-corporate'
  title='Externalizare completă marketing | Abonament Corporate | AMPLIO'
  desc='Externalizare completă a marketingului pentru firme din România: toate canalele, un singur contact, un singur raport. Departamentul tău de marketing, fără angajări. Start 950, Growth 1900, Scale 3500 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Abonament Corporate','/servicii/abonament-corporate') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Externalizare completa marketing","provider":{"@type":"Organization","name":"AMPLIO"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"950"}}'
  body=(SvcBody 'Serviciu &middot; Abonament Corporate' 'Departamentul tău de marketing,' 'fără angajări.' 'Externalizare completă: toate canalele, un singur contact, un singur raport. Strategie, producție și execuție sub un singur contract. Trei niveluri, în funcție de ambiția ta.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Abonament Corporate','/servicii/abonament-corporate') )) '<h2>Tot marketingul, un singur partener</h2><p class="lead" style="margin-bottom:18px">În loc să angajezi 4 oameni și să coordonezi 3 freelanceri, ai o singură echipă care acoperă totul: ads, SEO/GEO, social, email, conținut și strategie. Un contract, un raport, un număr de telefon.</p><p>Pentru orice nu facem intern, producție video, foto, influenceri, integrări, folosim rețeaua noastră de parteneri verificați, pe care o coordonăm noi.</p>' @('<b>Start, 950 &euro;/lună:</b> canalele esențiale + strategie','<b>Growth, 1.900 &euro;/lună:</b> mix complet + ritm accelerat','<b>Scale, 3.500 &euro;/lună:</b> tot, plus producție și CMO extern inclus','<b>Un singur contact</b> și un raport unificat lunar','<b>Rețeaua de parteneri</b> pentru orice producție specială') '<strong style="color:var(--off)">Start 950 &euro; &middot; Growth 1.900 &euro; &middot; Scale 3.500 &euro;</strong>/lună' (Related 'Vezi și' @( ,@('CMO Extern','/servicii/cmo-extern'); ,@('Toate serviciile','/servicii') )))
}

# ---- SOLUTII HUB ----
$pages += @{
  path='solutii'
  title='Soluții de marketing pe industrie | AMPLIO'
  desc='Soluții de marketing digital adaptate pe industrie: eCommerce, clinici medicale, servicii B2B, HoReCa, producători și export, imobiliare. Alege-ți domeniul și vezi ce facem pentru tine.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii') ))
  jsonld=$null
  body=@"
<section class="subhero">
  <div class="grid-bg"></div>
  <div class="wrap">
    $(CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii') ))
    <span class="eyebrow">Personalizat pe afacerea ta</span>
    <h1>Nu facem marketing în general. <span class="g">Facem marketingul afacerii tale.</span></h1>
    <p class="lead">Fiecare industrie are durerile ei, canalele ei și felul ei de a măsura succesul. Alege-ți domeniul și vezi exact ce înseamnă AMPLIO pentru tine.</p>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="svc-grid">
      <a class="svc" href="/solutii/marketing-ecommerce/"><div class="ic">E</div><h3>Magazine online</h3><p>ROAS și venit, nu afișări. Ads + email + CRO pe paginile de produs, cu model de parteneriat.</p><span class="more">Soluția eCommerce &rarr;</span></a>
      <a class="svc" href="/solutii/marketing-clinici/"><div class="ic">C</div><h3>Clinici medicale</h3><p>Calendar plin cu pacienții potriviți: ads local, Google Business și SEO/GEO, raport în programări.</p><span class="more">Soluția pentru clinici &rarr;</span></a>
      <a class="svc" href="/solutii/marketing-b2b/"><div class="ic">B</div><h3>Servicii B2B</h3><p>Pipeline previzibil: LinkedIn ABM + SEO/GEO + nurture, cu lead calificat semnat în contract.</p><span class="more">Soluția B2B &rarr;</span></a>
      <a class="svc" href="/solutii/marketing-horeca/"><div class="ic">H</div><h3>HoReCa</h3><p>Social apetisant, ads local și micro-influenceri. Pachete fixe de la 350 &euro;/lună.</p><span class="more">Soluția HoReCa &rarr;</span></a>
      <a class="svc" href="/solutii/marketing-export/"><div class="ic">P</div><h3>Producători &amp; Export</h3><p>Site multilingv, SEO/GEO internațional și ABM pe 2-3 piețe UE selectate strategic.</p><span class="more">Soluția pentru export &rarr;</span></a>
      <a class="svc" href="/solutii/marketing-imobiliare/"><div class="ic">I</div><h3>Imobiliare</h3><p>Landing de proiect, CRM/nurture și bonus per unitate vândută peste ritmul planificat.</p><span class="more">Soluția imobiliare &rarr;</span></a>
    </div>
  </div>
</section>
"@
}

# ---- SOLUTII ----
$pages += @{
  path='solutii/marketing-ecommerce'
  title='Marketing pentru magazine online (eCommerce) | AMPLIO'
  desc='Agenție de marketing pentru eCommerce în România: administrare ads pe ROAS și venit, fluxuri de email care aduc 20-30% din venit și CRO pe paginile de produs. Model de parteneriat disponibil.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('eCommerce','/solutii/marketing-ecommerce') ))
  jsonld=$null
  body=(SolBody 'Soluție &middot; eCommerce' 'Marketing pentru' 'magazine online.' 'Costurile de ads cresc, ROAS-ul scade și nimeni nu-și asumă cifra. Noi raportăm pe venit, construim fluxuri de email care vând singure și optimizăm paginile de produs.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('eCommerce','/solutii/marketing-ecommerce') )) '&bdquo;Costurile de ads cresc, ROAS-ul scade și nimeni nu-și asumă cifra de vânzări.&rdquo;' @('Administrare Google, Meta și TikTok cu raport pe ROAS și venit, nu pe afișări','Email &amp; automatizări care aduc 20-30% din venit (coș abandonat, reactivare)','CRO pe paginile de produs: același trafic, mai multe comenzi','Modelul de parteneriat: fee redus + procent doar din creșterea peste nivelul tău actual') '5-10%' 'din creșterea vânzărilor. Atât luăm peste fee-ul redus. Dacă nu crești, nu plătești procentul.' (Related 'Servicii folosite' @( ,@('Performance Ads','/servicii/performance-ads'); ,@('Email &amp; Automatizări','/servicii/email-automatizari'); ,@('Landing &amp; CRO','/servicii/landing-pages-cro') )))
}
$pages += @{
  path='solutii/marketing-clinici'
  title='Marketing pentru clinici și cabinete medicale | AMPLIO'
  desc='Marketing pentru clinici medicale în România: Google Ads local, profil Google Business optimizat și SEO/GEO. Raport în programări confirmate și cost per pacient nou, ton sobru și profesionist.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Clinici','/solutii/marketing-clinici') ))
  jsonld=$null
  body=(SolBody 'Soluție &middot; Clinici medicale' 'Marketing pentru' 'clinici medicale.' 'Vrei calendarul plin cu pacienții potriviți, fără să pari o clinică cu reclame agresive. Ads local, Google Business și SEO/GEO, cu raport în programări confirmate.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Clinici','/solutii/marketing-clinici') )) '&bdquo;Vreau calendarul plin cu pacienții potriviți, fără să par o clinică cu reclame agresive.&rdquo;' @('Google Ads local + profil Google Business optimizat: pacienți din zona ta, când caută','SEO + GEO: când cineva întreabă ChatGPT cea mai bună clinică din zonă, să apari tu','Raportare în programări confirmate și cost per pacient nou, nu în like-uri','Marketing la standardul actului tău medical: sobru, profesionist, discret') '50%' 'dintre pacienți încep să caute prin AI și Google. Îți arătăm gratuit cum apari acum față de 3 competitori.' (Related 'Servicii folosite' @( ,@('SEO + GEO','/servicii/seo-geo'); ,@('Performance Ads','/servicii/performance-ads'); ,@('Landing &amp; CRO','/servicii/landing-pages-cro') )))
}
$pages += @{
  path='solutii/marketing-b2b'
  title='Marketing pentru servicii B2B | AMPLIO'
  desc='Marketing B2B pentru firme de servicii din România: motor de lead-uri calificate prin LinkedIn ABM, SEO/GEO și nurture pe email, plus CMO extern. Definim lead calificat în contract și îl livrăm.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Servicii B2B','/solutii/marketing-b2b') ))
  jsonld=$null
  body=(SolBody 'Soluție &middot; Servicii B2B' 'Marketing pentru' 'firme de servicii B2B.' 'Firma crește doar cât rețeaua ta personală de contacte, și asta te sperie. Construim un motor de lead-uri calificate: LinkedIn ABM + SEO/GEO + nurture pe email.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Servicii B2B','/solutii/marketing-b2b') )) '&bdquo;Firma crește doar cât rețeaua mea personală de contacte. Și asta mă sperie.&rdquo;' @('Motor de lead-uri calificate: LinkedIn ABM + SEO/GEO + nurture pe email','Definim împreună lead calificat și îl semnăm în contract. Apoi îl livrăm','CMO Extern: strategie senioră și raport de board lunar, fără costul unui director','Zero postări de dragul postărilor: doar canale care aduc contracte în B2B') '2-3' 'lead-uri calificate pe lună schimbă complet matematica unei firme de servicii. Asta construim.' (Related 'Servicii folosite' @( ,@('SEO + GEO','/servicii/seo-geo'); ,@('CMO Extern','/servicii/cmo-extern'); ,@('Email &amp; Automatizări','/servicii/email-automatizari') )))
}
$pages += @{
  path='solutii/marketing-horeca'
  title='Marketing pentru restaurante și HoReCa | AMPLIO'
  desc='Marketing pentru restaurante și branduri de ospitalitate în România: social media apetisant, Google Business și ads local, micro-influenceri și UGC. Pachete fixe de la 350 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('HoReCa','/solutii/marketing-horeca') ))
  jsonld=$null
  body=(SolBody 'Soluție &middot; HoReCa' 'Marketing pentru' 'restaurante și ospitalitate.' 'Produsul tău e excelent, dar marțea și miercurea mesele stau goale. Social apetisant, ads local și micro-influenceri care aduc rezultate, nu mese gratis.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('HoReCa','/solutii/marketing-horeca') )) '&bdquo;Produsul meu e excelent, dar marțea și miercurea mesele stau goale.&rdquo;' @('Social media care arată ca produsul tău: apetisant, autentic, constant','Google Business + ads local: apari când localnicii și turiștii caută unde mâncăm','Micro-influenceri și UGC prin rețeaua noastră de parteneri, cu rezultate, nu mese gratis','Pachete fixe de la 350 &euro;/lună: știi exact cât investești') '350 &euro;' 'pe lună. De aici pornește pachetul care îți umple agenda de rezervări și feed-ul de conținut.' (Related 'Servicii folosite' @( ,@('Social Media','/servicii/social-media'); ,@('Performance Ads','/servicii/performance-ads') )))
}
$pages += @{
  path='solutii/marketing-export'
  title='Marketing pentru producători și export UE | AMPLIO'
  desc='Marketing pentru producători cu ambiții europene: site multilingv la standard occidental, SEO/GEO internațional, LinkedIn ABM pe piețele țintă și campanii pe 2-3 piețe UE selectate strategic.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Producători & Export','/solutii/marketing-export') ))
  jsonld=$null
  body=(SolBody 'Soluție &middot; Producători &amp; Export' 'Marketing pentru' 'producători cu ambiții UE.' 'Produci la nivel european, dar în afara României ești invizibil. Site multilingv, SEO/GEO internațional și campanii pe 2-3 piețe UE selectate strategic, nu peste tot și nicăieri.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Producători & Export','/solutii/marketing-export') )) '&bdquo;Produc la nivel european, dar în afara României sunt invizibil.&rdquo;' @('Site multilingv și materiale de prezentare la standard occidental','SEO/GEO internațional + LinkedIn ABM pe piețele tale țintă','Campanii pe 2-3 piețe UE selectate strategic, nu peste tot și nicăieri','Plan în etape pe 6-12 luni, cu praguri clare: prima cerere de ofertă, primul contract') '6-12' 'luni de la fundație la primele cereri de ofertă externe, cu plan scris și praguri măsurabile.' (Related 'Servicii folosite' @( ,@('SEO + GEO','/servicii/seo-geo'); ,@('CMO Extern','/servicii/cmo-extern'); ,@('Landing &amp; CRO','/servicii/landing-pages-cro') )))
}
$pages += @{
  path='solutii/marketing-imobiliare'
  title='Marketing pentru dezvoltatori imobiliari | AMPLIO'
  desc='Marketing pentru dezvoltatori rezidențiali din România: landing de proiect și campanii proprii, CRM și nurture pe ciclul lung de decizie, raport săptămânal pe lead-uri și viteza de absorbție.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Imobiliare','/solutii/marketing-imobiliare') ))
  jsonld=$null
  body=(SolBody 'Soluție &middot; Imobiliare' 'Marketing pentru' 'dezvoltatori imobiliari.' 'Fiecare lună cu apartamente nevândute te costă dobândă. Portalurile îți trimit curioși, nu cumpărători. Landing de proiect, campanii proprii și CRM pe ciclul lung de decizie.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Imobiliare','/solutii/marketing-imobiliare') )) '&bdquo;Portalurile îmi trimit curioși, nu cumpărători.&rdquo;' @('Landing de proiect + campanii proprii: lead-uri calificate la cost controlat, nu chirie pe portaluri','CRM + nurture automat pe ciclul lung de decizie al cumpărătorului','Raport săptămânal: lead-uri, vizionări programate, viteza de absorbție','Bonus per unitate vândută peste ritmul planificat: suntem motivați de viteza ta') '1 lună' 'de vânzare accelerată față de planul tău de absorbție îți plătește tot marketingul proiectului.' (Related 'Servicii folosite' @( ,@('Performance Ads','/servicii/performance-ads'); ,@('Landing &amp; CRO','/servicii/landing-pages-cro'); ,@('Email &amp; Automatizări','/servicii/email-automatizari') )))
}

# ---- DESPRE ----
$pages += @{
  path='despre'
  title='Despre AMPLIO | Agenție de marketing digital'
  desc='Despre AMPLIO: departamentul de marketing extern al firmelor medii și mici din România. AI în producție, strategie umană senioră și plată legată de rezultate.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Despre','/despre') ))
  jsonld=$null
  body=@"
<section class="subhero">
  <div class="grid-bg"></div>
  <div class="wrap">
    $(CrumbsHtml @( ,@('Acasă','/'); ,@('Despre','/despre') ))
    <span class="eyebrow">Despre AMPLIO</span>
    <h1>Creștem firme. <span class="g">Cu cifre, nu cu promisiuni.</span></h1>
    <p class="lead">AMPLIO este departamentul de marketing extern al firmelor medii și mici din România. Combinăm AI în producție cu strategie umană senioră, și, acolo unde are sens, ne legăm plata direct de vânzările pe care le generăm.</p>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="prose">
      <h2>De ce existăm</h2>
      <p>Prea multe firme bune plătesc lunar pentru marketing fără să știe ce funcționează. Agenții care raportează afișări și like-uri, freelanceri care apar și dispar, bugete de ads cheltuite fără nimeni care să-și asume cifra de vânzări. Am construit AMPLIO ca răspuns la exact această frustrare.</p>
      <h2>Cum lucrăm diferit</h2>
      <p>Trei lucruri ne separă de o agenție clasică:</p>
      <ul class="flist" style="margin-top:14px">
        <li><b>Ne asumăm rezultatul.</b> Pilot de 90 de zile cu KPI scriși în contract și clauză de ieșire fără penalități. Iar acolo unde are sens, model de parteneriat: fee fix redus + procent doar din creșterea vânzărilor.</li>
        <li><b>Transparență totală.</b> Conturile de ads și toate datele rămân ale tale. Mereu. Fără ostatici.</li>
        <li><b>Un singur partener pentru tot.</b> Serviciile de bază le facem intern; pentru restul (video, foto, influenceri, integrări) coordonăm o rețea verificată de parteneri. Tu ai un contract, un raport, un număr de telefon.</li>
      </ul>
      <h2>AI + oameni</h2>
      <p>Folosim inteligența artificială în producție ca să mergem mai repede și să testăm mai mult. Dar strategia, judecata și controlul calității rămân umane și seniore. AI-ul scrie schițe; oamenii decid direcția.</p>
      <div class="key" style="margin-top:30px">
        <p style="margin:0"><strong>AMPLIO DIGITAL S.R.L.</strong> · București, România · operăm în RO + UE · <a href="mailto:contact@amplio.ro">contact@amplio.ro</a></p>
      </div>
    </div>
    <div class="ctaband" style="margin-top:40px">
      <h2>Vrei să vezi cum ar arăta pentru tine?</h2>
      <p class="lead center">Cere auditul gratuit de vizibilitate. În 48 de ore, fără obligații.</p>
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
    </div>
  </div>
</section>
"@
}

# ---- LEGAL ----
$pages += @{
  path='termeni'
  title='Termeni și condiții | AMPLIO'
  desc='Termenii și condițiile de utilizare a site-ului amplio.ro și a serviciilor AMPLIO DIGITAL S.R.L.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Termeni și condiții','/termeni') ))
  jsonld=$null
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Termeni și condiții','/termeni') ))
  <span class="eyebrow">Legal</span><h1>Termeni și condiții</h1></div></section>
<section><div class="wrap rev"><div class="prose">
  <p class="meta">Ultima actualizare: iunie 2026</p>
  <p>Acest site, amplio.ro, este operat de AMPLIO DIGITAL S.R.L. Prin utilizarea site-ului ești de acord cu termenii de mai jos. Dacă nu ești de acord, te rugăm să nu folosești site-ul.</p>
  <h2>1. Despre serviciile noastre</h2>
  <p>AMPLIO oferă servicii de marketing digital pentru firme. Prețurile și pachetele afișate pe site sunt orientative; condițiile finale se stabilesc prin contract individual. Modelele de plată legate de rezultate (fee redus + procent din creșterea vânzărilor) se aplică doar acolo unde sunt agreate în scris, pe baza unui baseline documentat.</p>
  <h2>2. Conținutul site-ului</h2>
  <p>Conținutul (texte, logo, design) aparține AMPLIO DIGITAL S.R.L. și nu poate fi reprodus fără acord. Informațiile au caracter informativ și pot fi modificate fără notificare prealabilă.</p>
  <h2>3. Auditul gratuit</h2>
  <p>Auditul gratuit de vizibilitate este oferit fără obligații de cumpărare. Ne rezervăm dreptul de a stabili eligibilitatea și termenul de livrare (orientativ, 48 de ore lucrătoare).</p>
  <h2>4. Limitarea răspunderii</h2>
  <p>Rezultatele de marketing depind de mulți factori externi. Estimările și exemplele de pe site nu constituie o garanție de rezultat în afara a ceea ce este prevăzut explicit în contract.</p>
  <h2>5. Contact</h2>
  <p>Pentru orice întrebare legată de acești termeni: <a href="mailto:contact@amplio.ro">contact@amplio.ro</a>.</p>
  <p style="margin-top:24px"><em>Acest text este un model general și nu constituie consultanță juridică. Recomandăm revizuirea de către un avocat înainte de publicarea finală.</em></p>
</div></div></section>
"@
}
$pages += @{
  path='confidentialitate'
  title='Politică de confidențialitate (GDPR) | AMPLIO'
  desc='Politica de confidențialitate AMPLIO: ce date colectăm, cum le folosim și drepturile tale conform GDPR.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Confidențialitate','/confidentialitate') ))
  jsonld=$null
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Confidențialitate','/confidentialitate') ))
  <span class="eyebrow">Legal &middot; GDPR</span><h1>Politică de confidențialitate</h1></div></section>
<section><div class="wrap rev"><div class="prose">
  <p class="meta">Ultima actualizare: iunie 2026</p>
  <p>Operatorul datelor este AMPLIO DIGITAL S.R.L. Respectăm Regulamentul (UE) 2016/679 (GDPR). Datele tale sunt folosite exclusiv în scopurile descrise mai jos, fără liste de spam.</p>
  <h2>Ce date colectăm</h2>
  <p>Când completezi formularul de audit sau ne scrii pe email, colectăm: nume, adresă de email, numele firmei și site-ul, tipul afacerii și mesajul tău. Atât.</p>
  <h2>De ce le folosim</h2>
  <p>Pentru a-ți pregăti și trimite auditul de vizibilitate solicitat și pentru a comunica cu tine despre serviciile noastre. Nu vindem și nu cedăm datele tale unor terți în scopuri de marketing.</p>
  <h2>Cât le păstrăm</h2>
  <p>Păstrăm datele atât cât este necesar pentru scopul de mai sus sau până când ne ceri ștergerea lor.</p>
  <h2>Drepturile tale</h2>
  <p>Ai dreptul de acces, rectificare, ștergere, restricționare și portabilitate a datelor, precum și dreptul de a-ți retrage consimțământul. Le poți exercita scriindu-ne la <a href="mailto:contact@amplio.ro">contact@amplio.ro</a>. Ai de asemenea dreptul de a depune o plângere la ANSPDCP.</p>
  <p style="margin-top:24px"><em>Acest text este un model general și nu constituie consultanță juridică. Recomandăm revizuirea de către un specialist GDPR.</em></p>
</div></div></section>
"@
}
$pages += @{
  path='cookies'
  title='Politică de cookies | AMPLIO'
  desc='Politica de cookies a site-ului amplio.ro: ce cookies folosim și cum le poți controla.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Cookies','/cookies') ))
  jsonld=$null
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Cookies','/cookies') ))
  <span class="eyebrow">Legal</span><h1>Politică de cookies</h1></div></section>
<section><div class="wrap rev"><div class="prose">
  <p class="meta">Ultima actualizare: iunie 2026</p>
  <p>Cookies sunt fișiere mici stocate de browser. Site-ul amplio.ro folosește un minim de cookies, strict pentru funcționare și, eventual, pentru statistici anonime de trafic.</p>
  <h2>Ce tipuri folosim</h2>
  <ul class="flist" style="margin-top:14px">
    <li><b>Esențiale:</b> necesare pentru funcționarea de bază a site-ului.</li>
    <li><b>De analiză (dacă sunt activate):</b> ne ajută să înțelegem cum este folosit site-ul, în formă agregată și anonimă (ex. Google Analytics).</li>
  </ul>
  <h2>Cum le controlezi</h2>
  <p>Poți bloca sau șterge cookies din setările browserului tău. Reține că dezactivarea unora poate afecta funcționarea site-ului.</p>
  <h2>Contact</h2>
  <p>Întrebări legate de cookies: <a href="mailto:contact@amplio.ro">contact@amplio.ro</a>.</p>
  <p style="margin-top:24px"><em>Actualizează această politică în funcție de instrumentele de analiză pe care le instalezi efectiv pe site.</em></p>
</div></div></section>
"@
}

# ---- BLOG HUB ----
$pages += @{
  path='blog'
  title='Blog | Marketing digital, SEO, GEO și ads | AMPLIO'
  desc='Articole practice despre marketing digital pentru firme din România: SEO, GEO (optimizare pentru AI), Google Ads, email și creștere. Fără teorie goală.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog') ))
  jsonld=$null
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog') ))
  <span class="eyebrow">Blog</span>
  <h1>Marketing care <span class="g">aduce clienți.</span></h1>
  <p class="lead">Articole practice despre SEO, GEO, ads și creștere, scrise pentru fondatori și firme medii și mici din România. Fără teorie goală.</p>
</div></section>
<section><div class="wrap rev"><div class="bloglist">
  <a class="bcard" href="/blog/verifica-daca-apari-in-ai/"><div class="cat">Ghid · GEO</div><h3>Cum verifici dacă firma ta apare în ChatGPT și AI</h3><p>Tutorial pas cu pas: află în 10 minute dacă apari în ChatGPT, Perplexity și Google AI Overviews, și ce faci dacă ești invizibil. Fără cont, fără cost.</p><span class="more">Citește tutorialul &rarr;</span></a>
  <a class="bcard" href="/blog/ghid-geo/"><div class="cat">Ghid · GEO</div><h3>Ce este GEO și cum te optimizezi pentru motoarele AI</h3><p>Ghidul complet despre Generative Engine Optimization: cum ajungi să fii citat de ChatGPT, Perplexity și AI Overviews, nu doar listat în Google.</p><span class="more">Citește ghidul &rarr;</span></a>
  <a class="bcard" href="/blog/geo-vs-seo/"><div class="cat">GEO</div><h3>GEO vs SEO: care e diferența și de ce ai nevoie de ambele</h3><p>Nu sunt în competiție, sunt două straturi ale aceleiași strategii. Explicăm clar diferența și de unde începi.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/cum-aparii-in-chatgpt/"><div class="cat">GEO</div><h3>Cum apari în ChatGPT cu firma ta</h3><p>Pași concreți ca afacerea ta să fie recomandată când cineva întreabă un asistent AI „cea mai bună firmă din…”.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/cost-google-ads-romania/"><div class="cat">Performance Ads</div><h3>Cât costă Google Ads în România în 2026</h3><p>Bugete reale, cost-pe-click pe industrii și cum să nu arzi banii în primele luni de campanii.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/greseli-buget-google-ads/"><div class="cat">Performance Ads</div><h3>7 greșeli care îți ard bugetul de Google Ads</h3><p>Cele mai frecvente moduri în care firmele pierd bani pe ads, și cum le eviți pe fiecare.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/cum-alegi-agentie-marketing/"><div class="cat">Ghid</div><h3>Cum alegi o agenție de marketing (și ce întrebări să pui)</h3><p>Lista de întrebări care separă o agenție care livrează de una care doar raportează afișări. Plus semnalele de alarmă.</p><span class="more">Citește ghidul &rarr;</span></a>
  <a class="bcard" href="/blog/ce-este-llms-txt/"><div class="cat">GEO</div><h3>Ce este llms.txt și cum îl folosești</h3><p>Fișierul simplu care le spune modelelor AI ce ești și ce oferi. Ce conține și cum îl pui pe site.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/google-business-profil-local/"><div class="cat">SEO local</div><h3>Cum apari pe Google Maps cu profilul de business</h3><p>Pași concreți să apari când localnicii caută „lângă mine”, pentru clinici, restaurante și afaceri locale.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/cuvinte-cheie-de-la-zero/"><div class="cat">SEO</div><h3>Cum alegi cuvintele cheie când pornești de la zero</h3><p>De ce să nu țintești termenii mari de la început și cum găsești long-tail-ul care îți aduce primii clienți.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/google-ads-vs-meta-ads/"><div class="cat">Performance Ads</div><h3>Google Ads vs Meta Ads: cu care începi?</h3><p>Cele două canale rezolvă probleme diferite. Cum alegi în funcție de afacerea și obiectivul tău.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/marketing-magazin-online/"><div class="cat">eCommerce</div><h3>Marketing pentru magazin online: ghid de creștere a vânzărilor</h3><p>Cele trei pârghii care cresc vânzările unui magazin online, și în ce ordine le activezi.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/marketing-clinica-pacienti/"><div class="cat">Clinici</div><h3>Cum își umple o clinică agenda cu pacienții potriviți</h3><p>Marketing pentru clinici la standardul actului medical: pacienți din zonă, fără reclame agresive.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/marketing-b2b-pipeline/"><div class="cat">B2B</div><h3>Cum construiești un pipeline B2B previzibil</h3><p>Dincolo de rețeaua personală de contacte: motorul de lead-uri calificate pentru firme de servicii.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/conturi-ads-proprietate/"><div class="cat">POV</div><h3>De ce conturile de ads trebuie să rămână ale tale</h3><p>Cel mai important lucru pe care mulți antreprenori îl descoperă prea târziu, când vor să schimbe agenția.</p><span class="more">Citește articolul &rarr;</span></a>
</div></div></section>
"@
}

# ---- BLOG: PILON GEO ----
$pages += @{
  path='blog/ghid-geo'
  title='Ce este GEO? Ghid de optimizare pentru motoarele AI (2026) | AMPLIO'
  desc='Ghid complet despre GEO (Generative Engine Optimization): ce este, cum diferă de SEO și cum îți optimizezi site-ul ca să fii citat de ChatGPT, Perplexity și Google AI Overviews.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Ghid GEO','/blog/ghid-geo') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Ce este GEO? Ghid de optimizare pentru motoarele AI","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Ghid GEO','/blog/ghid-geo') ))
  <span class="eyebrow">Ghid &middot; GEO</span>
  <h1>Ce este GEO și cum te optimizezi <span class="g">pentru motoarele AI</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~6 min de citit</p>
  <p>Timp de 20 de ani, „a fi găsit online” a însemnat un singur lucru: să apari în Google. Asta se schimbă acum. Tot mai mulți oameni pun întrebări direct unui asistent AI, ChatGPT, Perplexity, Google AI Overviews, și primesc un singur răspuns, nu o listă de 10 linkuri. <strong>GEO (Generative Engine Optimization)</strong> este disciplina de a te face vizibil exact în acel răspuns.</p>
  <h2>SEO vs. GEO: care e diferența</h2>
  <p>SEO te ajută să urci în lista de rezultate Google. GEO te ajută să fii <em>citat și recomandat</em> de un model AI atunci când construiește un răspuns. Sunt înrudite, împart aceeași fundație de conținut clar și demn de încredere, dar optimizezi pentru doi „cititori” diferiți: un algoritm de ranking și un model de limbaj.</p>
  <blockquote>Când un client întreabă „care e cea mai bună clinică / agenție / firmă din zona mea?”, AI-ul numește câteva. Dacă nu ești tu acolo, nici nu exiști în acea conversație.</blockquote>
  <h2>De ce contează acum, nu peste 2 ani</h2>
  <p>Aproximativ jumătate dintre căutări încep deja să implice un strat de AI. Cei care își construiesc vizibilitatea AI acum prind un avantaj greu de recuperat mai târziu, exact ca firmele care au prins SEO la început. E mult spațiu liber: foarte puține firme din România lucrează intenționat pe GEO.</p>
  <h2>Cum te optimizezi pentru GEO: 5 piloni</h2>
  <ul class="flist" style="margin-top:14px">
    <li><b>Conținut structurat și citabil:</b> răspunsuri clare la întrebări reale, în formate pe care AI-ul le poate extrage ușor (definiții, liste, FAQ).</li>
    <li><b>Autoritate și semnale de încredere (E-E-A-T):</b> cine ești, de ce ești credibil, surse și dovezi.</li>
    <li><b>Schema markup:</b> date structurate care explică mașinii ce reprezintă fiecare pagină.</li>
    <li><b>Prezență în surse pe care AI le citează:</b> directoare, recenzii, mențiuni, de acolo își ia AI-ul „părerea”.</li>
    <li><b>llms.txt și conținut agent-readable:</b> un fișier care spune modelelor AI ce ești și ce oferi.</li>
  </ul>
  <h2>Primul pas practic</h2>
  <p>Înainte de orice optimizare, măsoară unde ești acum: întreabă ChatGPT și Perplexity despre domeniul tău și vezi dacă apari. Apoi compară-te cu 2-3 competitori. Exact asta facem noi în <a href="/audit-gratuit/">auditul gratuit de vizibilitate</a>.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Vrei să afli cum apari azi în Google și în AI?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a> sau vezi serviciul nostru de <a href="/servicii/seo-geo/">SEO + GEO</a>.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Fii citat de AI, nu invizibil.</h2>
    <p class="lead center">Auditul gratuit îți arată exact unde stai și primii 3 pași.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: post 1 ----
$pages += @{
  path='blog/cum-aparii-in-chatgpt'
  title='Cum apari în ChatGPT cu firma ta (ghid 2026) | AMPLIO'
  desc='Pași concreți ca afacerea ta să fie recomandată de ChatGPT și alte asistente AI: conținut citabil, autoritate, recenzii și prezență în sursele pe care AI le citează.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cum apari în ChatGPT','/blog/cum-aparii-in-chatgpt') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum apari în ChatGPT cu firma ta","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cum apari în ChatGPT','/blog/cum-aparii-in-chatgpt') ))
  <span class="eyebrow">GEO</span>
  <h1>Cum apari în ChatGPT <span class="g">cu firma ta</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~4 min de citit</p>
  <p>Tot mai mulți clienți nu mai caută pe Google, ci întreabă direct ChatGPT: „care e cea mai bună firmă de X din orașul meu?”. Iată cum crești șansa ca firma ta să fie numele recomandat.</p>
  <h2>1. Fii prezent acolo unde AI „citește”</h2>
  <p>Modelele AI își formează „părerea” din surse publice: site-ul tău, directoare, recenzii, articole, foruri. Dacă ești absent din aceste surse, AI-ul nu are de unde să te cunoască. Asigură-te că ai prezență consistentă (nume, descriere, servicii) în directoarele relevante din nișa ta.</p>
  <h2>2. Scrie conținut care răspunde la întrebări</h2>
  <p>AI-ul preferă conținut clar, structurat, care răspunde direct la o întrebare. Pagini de tip „ce este…”, „cât costă…”, „cum alegi…” sunt exact ce extrage un model când construiește un răspuns.</p>
  <h2>3. Construiește dovezi de încredere</h2>
  <p>Recenzii reale, studii de caz, date concrete și o identitate clară (cine ești, unde ești) cresc probabilitatea să fii recomandat. AI-ul evită să recomande surse pe care nu le poate „verifica”.</p>
  <h2>4. Adaugă date structurate</h2>
  <p>Schema markup (date structurate) ajută atât Google, cât și modelele AI să înțeleagă ce reprezintă firma și paginile tale. E un semnal tehnic care merită implementat.</p>
  <p>Vrei tot tabloul? Citește <a href="/blog/ghid-geo/">ghidul complet despre GEO</a> sau vezi serviciul de <a href="/servicii/seo-geo/">SEO + GEO</a>.</p>
  <div class="key" style="margin-top:30px"><p style="margin:0"><strong>Curios cum apari acum?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a>, îți arătăm cum te văd Google și ChatGPT față de 3 competitori.</p></div>
</article></div></section>
"@
}

# ---- BLOG: post 2 ----
$pages += @{
  path='blog/cost-google-ads-romania'
  title='Cât costă Google Ads în România în 2026? | AMPLIO'
  desc='Bugete reale pentru Google Ads în România: cost-pe-click pe industrii, buget minim recomandat și cum să nu arzi banii în primele luni. Ghid practic pentru firme.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cost Google Ads România','/blog/cost-google-ads-romania') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cât costă Google Ads în România în 2026","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cost Google Ads România','/blog/cost-google-ads-romania') ))
  <span class="eyebrow">Performance Ads</span>
  <h1>Cât costă Google Ads <span class="g">în România în 2026</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~5 min de citit</p>
  <p>„Cât trebuie să investesc în Google Ads?” e prima întrebare a oricărui antreprenor. Răspunsul scurt: depinde de industrie și de competiție. Răspunsul util e mai jos.</p>
  <h2>Două costuri, nu unul</h2>
  <p>Bugetul tău se împarte în: <strong>cheltuiala cu media</strong> (banii care merg la Google) și <strong>managementul</strong> (cine construiește și optimizează campaniile). Mulți uită de al doilea și se întreabă apoi de ce „ads-ul nu merge”.</p>
  <h2>Cost-pe-click orientativ pe industrii</h2>
  <p>În România, CPC-ul variază mult: de la câțiva cenți pentru nișe puțin competitive, până la 1-3 € (sau mai mult) în domenii ca servicii medicale, juridice, imobiliare sau B2B. Cu cât valoarea unui client e mai mare, cu atât e mai scump clickul.</p>
  <h2>Buget minim ca să ai date relevante</h2>
  <p>Sub un anumit prag, campaniile nu adună destule date ca să poată fi optimizate. Pentru cele mai multe firme mici, un punct de plecare rezonabil e un buget de media care să genereze cel puțin câteva zeci de conversii pe lună, altfel optimizezi „în ceață”.</p>
  <h2>Cum să nu arzi banii în prima lună</h2>
  <ul class="flist" style="margin-top:14px">
    <li><b>Tracking corect întâi:</b> nu cheltui un euro până nu măsori conversiile corect.</li>
    <li><b>Pornește focalizat:</b> 1-2 campanii pe intențiile cele mai profitabile, nu „peste tot”.</li>
    <li><b>Pagina de destinație contează:</b> ads bun + landing slab = bani pierduți. Vezi <a href="/servicii/landing-pages-cro/">CRO</a>.</li>
    <li><b>Optimizare săptămânală:</b> campaniile lăsate „pe pilot automat” se degradează.</li>
  </ul>
  <p>Așa administrăm noi <a href="/servicii/performance-ads/">Performance Ads</a>: tracking, focus, optimizare săptămânală și raport pe venit.</p>
  <div class="key" style="margin-top:30px"><p style="margin:0"><strong>Vrei o estimare pe cazul tău?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a> sau folosește <a href="/calculator-investitie/">calculatorul de investiție</a>.</p></div>
</article></div></section>
"@
}

# ---- BLOG: post 3 (tutorial verificare AI) ----
$pages += @{
  path='blog/verifica-daca-apari-in-ai'
  title='Cum verifici dacă firma ta apare în ChatGPT și AI (10 min) | AMPLIO'
  desc='Tutorial pas cu pas: verifică în 10 minute dacă afacerea ta apare în ChatGPT, Perplexity și Google AI Overviews, și ce să faci dacă ești invizibil. Fără cont, fără cost.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Verifică vizibilitatea AI','/blog/verifica-daca-apari-in-ai') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum verifici dacă firma ta apare în ChatGPT și în căutarea AI","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Verifică vizibilitatea AI','/blog/verifica-daca-apari-in-ai') ))
  <span class="eyebrow">Ghid &middot; GEO</span>
  <h1>Cum verifici dacă firma ta apare <span class="g">în ChatGPT și în căutarea AI</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~5 min de citit &middot; verificarea durează 10 minute</p>
  <p>Jumătate dintre clienții tăi nu mai încep căutarea pe Google. Întreabă direct ChatGPT, Perplexity sau citesc răspunsul generat de AI din capul paginii Google. Întrebarea reală nu e <em>dacă</em> apari acolo, ci dacă <strong>știi</strong> dacă apari. Majoritatea firmelor nu au verificat niciodată.</p>
  <p>Vestea bună: poți afla singur, acum, în zece minute, fără niciun instrument plătit. Iată exact cum.</p>

  <h2>De ce contează verificarea asta</h2>
  <p>Când un motor AI răspunde la &bdquo;care e cea mai bună firmă de X din orașul meu?", numește două-trei nume. Acelea primesc clientul. Restul nici nu există în conversație. Dacă nu te-ai verificat niciodată, probabil ești în &bdquo;restul" fără să știi, în timp ce concurența ta apare.</p>

  <h2>Pasul 1, Scrie întrebările pe care le pune clientul tău</h2>
  <p>Nu te căuta pe tine după nume (acolo apari oricum). Caută așa cum caută un client care <em>nu te cunoaște încă</em>. Notează 5 întrebări reale. Exemple pe industrie:</p>
  <ul class="flist" style="margin-top:14px">
    <li><b>Clinică:</b> &bdquo;cea mai bună clinică stomatologică din [oraș]"</li>
    <li><b>eCommerce:</b> &bdquo;de unde cumpăr [produsul tău] online în România"</li>
    <li><b>Servicii B2B:</b> &bdquo;ce firmă mă poate ajuta cu [serviciul tău]"</li>
    <li><b>HoReCa:</b> &bdquo;unde mănânc bine în [zonă / oraș]"</li>
    <li><b>Imobiliare:</b> &bdquo;proiecte rezidențiale noi în [zonă]"</li>
  </ul>

  <h2>Pasul 2, Întreabă ChatGPT</h2>
  <p>Pune fiecare întrebare în ChatGPT, exact cum ar face-o clientul. Notează: apari în răspuns? Ești recomandat clar, menționat în treacăt, sau lipsești complet? Reformulează ușor întrebarea și repetă, răspunsurile variază.</p>

  <h2>Pasul 3, Verifică în Perplexity (aici vezi sursele)</h2>
  <p>Perplexity arată sursele din care își ia răspunsul. E cel mai util test: vezi nu doar <em>dacă</em> apari, ci <strong>din ce surse</strong> te-ar putea cita un AI (și din ce surse o citează pe concurența ta). Acolo se decide vizibilitatea.</p>

  <h2>Pasul 4, Verifică Google AI Overviews</h2>
  <p>Caută pe Google aceleași întrebări și uită-te la răspunsul generat de AI din capul paginii (AI Overviews), nu doar la linkurile clasice. E tot mai des primul lucru pe care îl vede clientul, și de multe ori singurul.</p>

  <h2>Pasul 5, Compară-te cu 3 competitori</h2>
  <p>Rulează aceleași întrebări și notează cine apare. Dacă numele concurenței revine și al tău nu, ai răspunsul. Asta e cota de piață pe care o cedezi acum, în tăcere.</p>

  <h2>Cum interpretezi rezultatele</h2>
  <ul class="flist" style="margin-top:14px">
    <li><b>Apari recomandat:</b> ești înaintea pieței. Acum contează să consolidezi și să scalezi.</li>
    <li><b>Apari vag sau inconstant:</b> ai o bază, dar pierzi în detalii, surse insuficiente, conținut nestructurat. Cele mai rapide câștiguri sunt aici.</li>
    <li><b>Ești invizibil:</b> AI-ul nu are de unde să te cunoască. E urgent, dar reparabil, și cum majoritatea concurenței e în aceeași situație, ai timp să o iei înainte.</li>
  </ul>

  <h2>Ce faci mai departe</h2>
  <p>Verificarea îți arată <em>unde</em> ești. Pasul următor e <em>de ce</em> și <em>ce repari întâi</em>. Despre asta e <a href="/blog/ghid-geo/">ghidul nostru complet de GEO</a>, iar dacă vrei direct răspunsul pe cazul tău, îl primești prin <a href="/servicii/seo-geo/">serviciul de SEO + GEO</a>.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Vrei să sărim peste verificarea manuală?</strong> În <a href="/audit-gratuit/">auditul gratuit</a> facem noi analiza: cum apari azi în Google și în AI, față de 3 competitori, plus primii 3 pași. În 48 de ore, fără obligații.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Află cum te vede AI-ul, gratuit.</h2>
    <p class="lead center">Îți trimitem analiza de vizibilitate în Google și în motoarele AI, comparativ cu concurența.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: GEO vs SEO ----
$pages += @{
  path='blog/geo-vs-seo'
  title='GEO vs SEO: care e diferența și de ce ai nevoie de ambele | AMPLIO'
  desc='GEO vs SEO explicat simplu: ce face fiecare, prin ce diferă și de ce ai nevoie de amândouă în 2026. Plus de unde începi dacă pornești de la zero.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('GEO vs SEO','/blog/geo-vs-seo') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"GEO vs SEO: care e diferența și de ce ai nevoie de ambele","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('GEO vs SEO','/blog/geo-vs-seo') ))
  <span class="eyebrow">Ghid &middot; GEO</span>
  <h1>GEO vs SEO: care e diferența <span class="g">și de ce ai nevoie de ambele</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~5 min de citit</p>
  <p>Întrebarea apare des: &bdquo;acum că există AI, mai am nevoie de SEO sau trec pe GEO?". Răspunsul scurt: ai nevoie de amândouă. Nu sunt în competiție, sunt două straturi ale aceleiași strategii de vizibilitate. Iată diferența, fără jargon.</p>

  <h2>Ce face SEO</h2>
  <p>SEO (Search Engine Optimization) te ajută să urci în <strong>lista de rezultate</strong> Google: cele 10 linkuri albastre. Optimizezi pentru un algoritm care decide ce pagini afișează și în ce ordine. Câștigi când utilizatorul dă click pe rezultatul tău.</p>

  <h2>Ce face GEO</h2>
  <p>GEO (Generative Engine Optimization) te ajută să fii <strong>citat și recomandat în răspunsul</strong> pe care îl generează un AI, ChatGPT, Perplexity, Google AI Overviews. Aici nu mai e o listă de 10 opțiuni, ci un singur răspuns. Câștigi când AI-ul te numește pe tine.</p>

  <h2>Diferența pe scurt</h2>
  <ul class="flist" style="margin-top:14px">
    <li><b>SEO</b> = vizibilitate într-o listă de linkuri. Utilizatorul alege.</li>
    <li><b>GEO</b> = vizibilitate într-un răspuns sintetizat. AI-ul alege pentru utilizator.</li>
    <li><b>SEO</b> răsplătește cuvinte cheie, linkuri, viteză tehnică.</li>
    <li><b>GEO</b> răsplătește conținut clar și structurat, autoritate și prezență în surse credibile.</li>
  </ul>

  <h2>De ce ai nevoie de ambele</h2>
  <p>Mulți clienți încă încep pe Google clasic, deci SEO rămâne esențial. Dar o parte tot mai mare întreabă direct AI-ul, fără să mai vadă vreodată lista de linkuri, deci GEO devine obligatoriu. Dacă lucrezi doar SEO, ești invizibil exact în canalul care crește cel mai repede.</p>
  <blockquote>Vestea bună: SEO și GEO împart aceeași fundație, conținut clar, structurat și demn de încredere. O strategie bună le hrănește pe amândouă în paralel.</blockquote>

  <h2>De unde începi dacă pornești de la zero</h2>
  <p>Întâi măsoară unde ești în ambele lumi (vezi tutorialul: <a href="/blog/verifica-daca-apari-in-ai/">cum verifici dacă apari în AI</a>). Apoi repară fundația tehnică SEO și, în paralel, structurează conținutul ca să fie citabil de AI. Tot tabloul e în <a href="/blog/ghid-geo/">ghidul complet de GEO</a>.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Le facem pe amândouă, împreună.</strong> Vezi serviciul de <a href="/servicii/seo-geo/">SEO + GEO</a> sau cere <a href="/audit-gratuit/">auditul gratuit</a> ca să afli unde stai acum în Google și în AI.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Acoperă ambele canale, nu doar unul.</h2>
    <p class="lead center">Auditul gratuit îți arată cum apari azi în Google și în motoarele AI.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: 7 greseli buget ads ----
$pages += @{
  path='blog/greseli-buget-google-ads'
  title='7 greșeli care îți ard bugetul de Google Ads | AMPLIO'
  desc='Cele mai frecvente 7 greșeli prin care firmele pierd bani pe Google Ads și Meta Ads, și cum le eviți pe fiecare. Ghid practic pentru firme din România.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Greșeli buget ads','/blog/greseli-buget-google-ads') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"7 greșeli care îți ard bugetul de Google Ads","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Greșeli buget ads','/blog/greseli-buget-google-ads') ))
  <span class="eyebrow">Performance Ads</span>
  <h1>7 greșeli care <span class="g">îți ard bugetul de Google Ads</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~6 min de citit</p>
  <p>Cele mai multe firme nu au o problemă de buget la ads, au o problemă de risipă. Aceiași bani, cheltuiți corect, aduc de câteva ori mai mult. Iată cele 7 greșeli pe care le vedem cel mai des și cum le repari.</p>

  <h2>1. Cheltui înainte să măsori</h2>
  <p>Fără tracking corect al conversiilor, nu știi ce campanie aduce clienți și ce campanie doar arde bani. Regula noastră: niciun euro pe media până nu e verificat tracking-ul cu teste reale.</p>

  <h2>2. Trimiți traficul pe o pagină slabă</h2>
  <p>Un ad bun care duce spre o pagină care nu convertește e bani pierduți. Pagina de destinație face jumătate din rezultat. Vezi <a href="/servicii/landing-pages-cro/">landing pages și CRO</a>.</p>

  <h2>3. Targetezi prea larg</h2>
  <p>&bdquo;Toată România, toți, 18-65" pare că maximizează reach-ul, dar risipește bugetul pe oameni care nu cumpără. Mai bine focusat și profitabil decât larg și inutil.</p>

  <h2>4. Lași campaniile pe pilot automat</h2>
  <p>Campaniile neoptimizate se degradează în timp: cresc costurile, scade calitatea traficului. Au nevoie de mână de om săptămânal, ajustări de licitație, cuvinte cheie negative, creație nouă.</p>

  <h2>5. Ignori cuvintele cheie negative</h2>
  <p>Fără o listă de cuvinte cheie negative, plătești pentru căutări care nu au legătură cu oferta ta. E una dintre cele mai rapide reparații cu impact imediat pe cost.</p>

  <h2>6. Optimizezi pe metrici greșite</h2>
  <p>Click-uri ieftine și multe afișări sună bine, dar nu plătesc salarii. Singura metrică ce contează e costul pe client nou și venitul generat. Restul sunt indicatori, nu obiective.</p>

  <h2>7. Nu testezi creația</h2>
  <p>O singură variantă de ad înseamnă că nu vei ști niciodată dacă altceva mergea mai bine. Cu AI poți produce rapid mai multe variante și lași datele să decidă câștigătorul.</p>

  <h2>Concluzia</h2>
  <p>Niciuna dintre aceste greșeli nu cere buget în plus, doar disciplină și atenție săptămânală. Despre asta e <a href="/servicii/performance-ads/">serviciul nostru de Performance Ads</a>: tracking, focus, optimizare săptămânală, raport pe venit.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Suspectezi că arzi bani pe ads?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a>, ne uităm la contul tău și îți spunem unde pierzi, fără obligații.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Oprește risipa din contul tău de ads.</h2>
    <p class="lead center">Analizăm gratuit unde se duc banii și ce ai repara primul.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: cum alegi o agentie ----
$pages += @{
  path='blog/cum-alegi-agentie-marketing'
  title='Cum alegi o agenție de marketing (și ce întrebări să pui) | AMPLIO'
  desc='Ghid practic pentru a alege o agenție de marketing în România: întrebările pe care să le pui, semnalele de alarmă și cum recunoști o agenție care își asumă rezultatele.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cum alegi o agenție','/blog/cum-alegi-agentie-marketing') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum alegi o agenție de marketing","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cum alegi o agenție','/blog/cum-alegi-agentie-marketing') ))
  <span class="eyebrow">Ghid</span>
  <h1>Cum alegi o agenție de marketing <span class="g">(și ce întrebări să pui)</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~6 min de citit</p>
  <p>Mulți antreprenori au o poveste cu o agenție care a promis mult și a livrat rapoarte cu afișări. Diferența dintre o agenție care îți crește afacerea și una care doar îți consumă bugetul se vede din primele întrebări. Iată ce să întrebi și la ce să fii atent.</p>

  <h2>Întrebările care contează</h2>
  <ul class="flist" style="margin-top:14px">
    <li><b>&bdquo;Pe ce metrică raportați?"</b> Răspunsul corect e venit, lead-uri sau cost pe client nou, nu afișări și like-uri.</li>
    <li><b>&bdquo;Conturile și datele rămân ale mele?"</b> Trebuie să fie un &bdquo;da" clar. Dacă ezită, pleci.</li>
    <li><b>&bdquo;Ce se întâmplă dacă nu atingeți obiectivele?"</b> Caută angajament real, KPI scriși, clauză de ieșire, nu vorbe.</li>
    <li><b>&bdquo;Cum măsurați înainte să cheltuiți pe media?"</b> O agenție serioasă verifică tracking-ul și documentează baseline-ul întâi.</li>
    <li><b>&bdquo;Cine lucrează efectiv pe contul meu?"</b> Vrei oameni seniori implicați, nu doar un nume mare pe contract.</li>
  </ul>

  <h2>Semnale de alarmă</h2>
  <ul class="flist" style="margin-top:14px">
    <li>Garantează poziția 1 în Google sau rezultate &bdquo;sigure", nimeni serios nu poate garanta asta.</li>
    <li>Raportează doar vanity metrics (afișări, urmăritori) fără legătură cu vânzările.</li>
    <li>Refuză să-ți dea acces la propriile conturi de ads și analytics.</li>
    <li>Contract lung, fără nicio clauză de ieșire dacă nu livrează.</li>
    <li>Nu pune întrebări despre afacerea ta, aplică același &bdquo;pachet" tuturor.</li>
  </ul>

  <h2>Fee fix vs. plată legată de rezultate</h2>
  <p>Modelul clasic e fee fix lunar, indiferent de rezultat. Alternativa, tot mai întâlnită, e modelul de parteneriat: un fee fix redus + un procent din creșterea vânzărilor peste un baseline. Al doilea aliniază interesele, agenția câștigă mai mult doar dacă tu câștigi. Întreabă dacă agenția e dispusă să-și lege o parte din plată de rezultatele tale.</p>

  <h2>Un singur partener sau mai mulți furnizori?</h2>
  <p>Poți coordona singur 4-5 freelanceri, sau poți avea un singur partener care acoperă tot și răspunde de rezultat. Pentru o firmă fără departament de marketing intern, al doilea model economisește cel mai prețios lucru: timpul tău de coordonare.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Așa lucrăm noi:</strong> KPI scriși în contract, clauză de ieșire la 90 de zile, conturile rămân ale tale și, unde are sens, plată legată de rezultate. Vezi <a href="/despre/">cum gândim</a> sau cere <a href="/audit-gratuit/">auditul gratuit</a>.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Testează-ne cu o întrebare reală.</h2>
    <p class="lead center">Cere auditul gratuit și vezi cum gândim, înainte de orice contract.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: llms.txt ----
$pages += @{
  path='blog/ce-este-llms-txt'
  title='Ce este llms.txt și cum îl folosești | AMPLIO'
  desc='Ghid simplu despre llms.txt: ce este fișierul care le spune modelelor AI ce oferă site-ul tău, ce conține și cum îl adaugi. Parte din strategia ta de GEO.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Ce este llms.txt','/blog/ce-este-llms-txt') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Ce este llms.txt și cum îl folosești","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Ce este llms.txt','/blog/ce-este-llms-txt') ))
  <span class="eyebrow">Ghid &middot; GEO</span>
  <h1>Ce este llms.txt <span class="g">și cum îl folosești</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~4 min de citit</p>
  <p>Pe măsură ce tot mai mulți clienți întreabă asistenții AI în loc să caute pe Google, a apărut o întrebare practică: cum le spui clar acestor modele cine ești și ce oferi? Un răspuns simplu este <strong>llms.txt</strong>, un fișier text mic, pus la rădăcina site-ului tău.</p>
  <h2>Ce este, pe scurt</h2>
  <p>llms.txt este un fișier (similar ca idee cu robots.txt) care oferă modelelor de limbaj un rezumat clar, structurat, despre afacerea ta: ce faci, ce servicii oferi, cum te contactează cineva. În loc să lași AI-ul să ghicească din tot site-ul, îi dai un &bdquo;ghid de citire" curat.</p>
  <h2>Ce conține de obicei</h2>
  <ul class="flist" style="margin-top:14px">
    <li>O descriere scurtă a firmei și a propunerii de valoare</li>
    <li>Lista serviciilor sau produselor, cu linkuri</li>
    <li>Diferențiatorii cheie (ce te face diferit)</li>
    <li>Date de contact</li>
  </ul>
  <h2>Cum îl adaugi</h2>
  <p>Creezi un fișier numit <code>llms.txt</code>, îl completezi cu informația de mai sus în text simplu și îl urci la rădăcina site-ului (adică accesibil la adresa ta/llms.txt). Atât. E un câștig mic ca efort, dar parte dintr-o strategie GEO coerentă.</p>
  <p>Important: llms.txt singur nu te face vizibil, e o piesă dintr-un puzzle mai mare. Vezi <a href="/blog/ghid-geo/">ghidul complet de GEO</a> pentru tabloul întreg.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Vrei vizibilitate AI completă, nu doar un fișier?</strong> Vezi serviciul de <a href="/servicii/seo-geo/">SEO + GEO</a> sau cere <a href="/audit-gratuit/">auditul gratuit</a>.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Construiește-ți vizibilitatea în AI.</h2>
    <p class="lead center">Auditul gratuit îți arată unde stai și ce repari întâi.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: Google Business local ----
$pages += @{
  path='blog/google-business-profil-local'
  title='Cum apari pe Google Maps cu profilul de business | AMPLIO'
  desc='Ghid practic pentru afaceri locale: cum îți optimizezi profilul Google Business ca să apari pe Google Maps când localnicii caută „lângă mine”. Pentru clinici, HoReCa și servicii.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Google Business local','/blog/google-business-profil-local') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum apari pe Google Maps cu profilul de business","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Google Business local','/blog/google-business-profil-local') ))
  <span class="eyebrow">SEO local</span>
  <h1>Cum apari pe Google Maps <span class="g">cu profilul de business</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~5 min de citit</p>
  <p>Pentru o afacere locală, clinică, restaurant, atelier, cabinet, profilul Google Business este adesea cel mai profitabil canal de marketing. E gratuit, apare exact când cineva caută &bdquo;lângă mine" și aduce clienți gata să cumpere. Iată cum îl faci să lucreze.</p>
  <h2>Completează-l până la capăt</h2>
  <p>Un profil pe jumătate completat rankează prost. Adaugă categoria corectă, programul exact, telefon, adresă, site, servicii și o descriere clară. Cu cât mai complet, cu atât Google îl arată mai des.</p>
  <h2>Adaugă fotografii reale, constant</h2>
  <p>Profilurile cu fotografii recente și de calitate primesc mai multă încredere și mai multe vizite. Pentru un restaurant, fotografiile cu preparate; pentru o clinică, cabinetul și echipa.</p>
  <h2>Cere și răspunde la recenzii</h2>
  <p>Recenziile sunt al doilea cel mai puternic factor local. Cere-le sistematic clienților mulțumiți și răspunde la toate, și la cele bune, și la cele critice. Asta arată Google (și clienților) că ești activ și serios.</p>
  <h2>Folosește postările și întrebările</h2>
  <p>Profilul îți permite postări (oferte, noutăți) și o secțiune de întrebări și răspunsuri. Sunt subutilizate de majoritatea concurenței, deci o oportunitate ușoară de diferențiere.</p>
  <p>Profilul local lucrează cel mai bine împreună cu ads local și cu vizibilitate în AI. Vezi cum facem asta pentru <a href="/solutii/marketing-clinici/">clinici</a> și <a href="/solutii/marketing-horeca/">HoReCa</a>.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Vrei mai mulți clienți din zona ta?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a>, îți spunem cât de vizibil ești local și ce repari întâi.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Fii găsit de clienții din zona ta.</h2>
    <p class="lead center">Analizăm gratuit vizibilitatea ta locală și în AI.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: cuvinte cheie de la zero ----
$pages += @{
  path='blog/cuvinte-cheie-de-la-zero'
  title='Cum alegi cuvintele cheie când pornești de la zero | AMPLIO'
  desc='Ghid de cuvinte cheie pentru site-uri noi: de ce să eviți termenii mari la început, cum găsești long-tail-ul cu competiție mică și cum îl mapezi pe pagini.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cuvinte cheie de la zero','/blog/cuvinte-cheie-de-la-zero') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum alegi cuvintele cheie când pornești de la zero","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cuvinte cheie de la zero','/blog/cuvinte-cheie-de-la-zero') ))
  <span class="eyebrow">SEO</span>
  <h1>Cum alegi cuvintele cheie <span class="g">când pornești de la zero</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~5 min de citit</p>
  <p>Cea mai frecventă greșeală a unui site nou: țintește direct termenii mari, cei cu volum uriaș. Problema e că pe acolo se bat site-uri cu ani de autoritate. Rezultatul: muncești mult și nu apari nicăieri. Iată cum alegi inteligent de la zero.</p>
  <h2>Începe cu long-tail</h2>
  <p>În loc de &bdquo;agenție marketing", țintește termeni mai lungi și specifici: &bdquo;agenție marketing pentru clinici", &bdquo;marketing pentru magazin online România". Au volum mai mic, dar și competiție mult mai mică, și o intenție mai clară. Acolo prinzi primele poziții.</p>
  <h2>Caută intenția, nu doar volumul</h2>
  <p>Un cuvânt cu 100 de căutări pe lună de la oameni gata să cumpere valorează mai mult decât unul cu 5.000 de căutări informaționale. Întreabă-te: cine caută asta și ce vrea de fapt?</p>
  <h2>Mapează un cuvânt principal pe fiecare pagină</h2>
  <p>Nu încerca să rankezi o singură pagină pentru tot. Fiecare pagină țintește un cuvânt principal, clar, reflectat în titlu, H1 și URL. Așa eviți să concurezi cu tine însuți.</p>
  <h2>Folosește întrebările reale ale clienților</h2>
  <p>Cele mai bune cuvinte cheie vin din întrebările pe care ți le pun clienții. &bdquo;Cât costă…", &bdquo;cum aleg…", &bdquo;cea mai bună…" sunt aur curat, mai ales pentru conținut de blog.</p>
  <p>Vrei să vezi cum arată în practică? Strategia noastră de conținut pleacă fix de aici. Cere <a href="/audit-gratuit/">auditul gratuit</a> și îți arătăm pe ce cuvinte ai șanse reale.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>De la zero la primele poziții.</strong> Vezi serviciul de <a href="/servicii/seo-geo/">SEO + GEO</a> sau cere <a href="/audit-gratuit/">auditul gratuit</a>.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Pornește pe cuvintele corecte.</h2>
    <p class="lead center">Îți arătăm gratuit pe ce termeni ai șanse reale din poziția zero.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: Google Ads vs Meta Ads ----
$pages += @{
  path='blog/google-ads-vs-meta-ads'
  title='Google Ads vs Meta Ads: cu care începi? | AMPLIO'
  desc='Google Ads vs Meta Ads explicat pentru firme: ce problemă rezolvă fiecare, când funcționează mai bine și cum alegi în funcție de afacerea și obiectivul tău.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Google Ads vs Meta Ads','/blog/google-ads-vs-meta-ads') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Google Ads vs Meta Ads: cu care începi","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Google Ads vs Meta Ads','/blog/google-ads-vs-meta-ads') ))
  <span class="eyebrow">Performance Ads</span>
  <h1>Google Ads vs Meta Ads: <span class="g">cu care începi?</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~5 min de citit</p>
  <p>Nu e o întrecere în care unul câștigă. Google Ads și Meta Ads rezolvă probleme diferite. Întrebarea corectă nu e &bdquo;care e mai bun", ci &bdquo;care se potrivește obiectivului meu acum".</p>
  <h2>Google Ads prinde cererea existentă</h2>
  <p>Oamenii caută activ ceva: &bdquo;dentist Cluj", &bdquo;firmă mutări". Apari fix în acel moment de intenție. E ideal când clienții știu deja că au nevoie de ce oferi și caută un furnizor. Conversie de obicei mai rapidă, dar click mai scump.</p>
  <h2>Meta Ads creează cererea</h2>
  <p>Pe Facebook și Instagram, oamenii nu caută, navighează. Tu îi întrerupi cu o ofertă relevantă, pe baza intereselor și comportamentului. E ideal pentru produse vizuale, pentru a construi notorietate și pentru a ajunge la oameni care nu te caută încă.</p>
  <h2>Cum alegi</h2>
  <ul class="flist" style="margin-top:14px">
    <li><b>Clienții te caută deja?</b> (servicii, urgențe, B2B) &rarr; începe cu Google Ads.</li>
    <li><b>Produs vizual sau cerere de creat?</b> (modă, food, lifestyle, lansări) &rarr; începe cu Meta.</li>
    <li><b>Buget mic la început?</b> &rarr; un singur canal, bine făcut, bate două canale făcute pe jumătate.</li>
  </ul>
  <p>Pe termen lung, cele două se completează: Meta creează cererea, Google o culege. Așa le combinăm în <a href="/servicii/performance-ads/">Performance Ads</a>. Înainte de a porni, evită <a href="/blog/greseli-buget-google-ads/">cele 7 greșeli care ard bugetul</a>.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Nu știi cu care să începi?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a>, îți recomandăm canalul potrivit pentru afacerea ta.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Pune bugetul unde aduce vânzări.</h2>
    <p class="lead center">Îți spunem gratuit ce canal ți se potrivește și de ce.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: marketing magazin online ----
$pages += @{
  path='blog/marketing-magazin-online'
  title='Marketing pentru magazin online: ghid de creștere a vânzărilor | AMPLIO'
  desc='Cum crești vânzările unui magazin online: cele trei pârghii (mai mult trafic, conversie mai bună, valoare mai mare per client) și în ce ordine le activezi.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Marketing magazin online','/blog/marketing-magazin-online') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Marketing pentru magazin online: ghid de creștere a vânzărilor","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Marketing magazin online','/blog/marketing-magazin-online') ))
  <span class="eyebrow">eCommerce</span>
  <h1>Marketing pentru magazin online: <span class="g">ghid de creștere a vânzărilor</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~6 min de citit</p>
  <p>Vânzările unui magazin online cresc prin doar trei pârghii. Atât. Orice tactică se reduce la una dintre ele. Dacă le înțelegi, știi mereu unde să acționezi.</p>
  <h2>Pârghia 1, Mai mult trafic relevant</h2>
  <p>Mai mulți vizitatori potriviți: prin Google și Meta Ads, prin SEO/GEO și prin social. &bdquo;Relevant" e cuvântul cheie, trafic ieftin dar nepotrivit nu aduce comenzi, doar costuri.</p>
  <h2>Pârghia 2, Conversie mai bună</h2>
  <p>Din vizitatorii pe care îi ai deja, mai mulți să cumpere. Aici intră paginile de produs clare, viteza site-ului, recenziile, checkout simplu și testarea continuă. Aceeași vizitatori, mai multe comenzi, fără buget de ads în plus. Vezi <a href="/servicii/landing-pages-cro/">CRO</a>.</p>
  <h2>Pârghia 3, Valoare mai mare per client</h2>
  <p>Fiecare client să cumpere mai mult și mai des: prin email și automatizări (coș abandonat, recomandări, reactivare), upsell și programe de fidelitate. În e-commerce, emailul aduce tipic 20-30% din venit, e pârghia cel mai des ignorată.</p>
  <h2>În ce ordine</h2>
  <p>Contraintuitiv, nu începe cu mai mult trafic. Întâi repară conversia și activează emailul (pârghiile 2 și 3), altfel torni apă într-o găleată găurită. Apoi scalezi traficul, când fiecare vizitator valorează mai mult.</p>
  <p>Așa abordăm noi <a href="/solutii/marketing-ecommerce/">marketingul pentru magazine online</a>, cu raport pe ROAS și venit, nu pe afișări.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Vrei să știi care pârghie îți aduce cel mai repede vânzări?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a> al magazinului tău.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Scoate mai multe comenzi din același magazin.</h2>
    <p class="lead center">Analizăm gratuit unde pierzi vânzări și ce activezi întâi.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: marketing clinica ----
$pages += @{
  path='blog/marketing-clinica-pacienti'
  title='Cum își umple o clinică agenda cu pacienții potriviți | AMPLIO'
  desc='Marketing pentru clinici medicale la standardul actului medical: cum atragi pacienți din zona ta prin Google Business, ads local și SEO/GEO, fără reclame agresive.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Marketing clinică','/blog/marketing-clinica-pacienti') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum își umple o clinică agenda cu pacienții potriviți","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Marketing clinică','/blog/marketing-clinica-pacienti') ))
  <span class="eyebrow">Clinici medicale</span>
  <h1>Cum își umple o clinică agenda <span class="g">cu pacienții potriviți</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~5 min de citit</p>
  <p>Provocarea unei clinici nu e doar &bdquo;mai mulți pacienți", e pacienții potriviți, din zonă, fără ca marketingul să pară agresiv sau nepotrivit pentru un act medical. Se poate, și nu e complicat. Iată canalele care contează.</p>
  <h2>Profilul Google Business + ads local</h2>
  <p>Când cineva caută &bdquo;dentist" sau &bdquo;dermatolog" în zona ta, trebuie să apari. Un profil Google Business complet plus Google Ads local te pune în fața pacienților exact când au nevoie. Vezi cum <a href="/blog/google-business-profil-local/">optimizezi profilul local</a>.</p>
  <h2>SEO + GEO: să apari și în răspunsurile AI</h2>
  <p>Tot mai mulți pacienți întreabă ChatGPT &bdquo;cea mai bună clinică din...". Dacă nu apari acolo, pierzi pacienți pe care nici nu îi vezi. <a href="/servicii/seo-geo/">SEO + GEO</a> rezolvă exact asta.</p>
  <h2>Raportare în programări, nu în like-uri</h2>
  <p>Pentru o clinică, singura metrică ce contează e numărul de programări confirmate și costul per pacient nou. Nu afișări, nu urmăritori. Tot ce facem se măsoară în pacienți.</p>
  <h2>Ton la standardul actului tău medical</h2>
  <p>Marketingul medical bine făcut e sobru, profesionist, discret. Construiește încredere, nu zgomot. Pacienții aleg o clinică în care au încredere, iar tonul comunicării e parte din acea încredere.</p>
  <p>Așa construim <a href="/solutii/marketing-clinici/">marketingul pentru clinici</a>: pacienți din zonă, raport în programări, ton pe măsura profesiei.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Vrei agenda mai plină cu pacienții potriviți?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a>, îți arătăm cum apari acum față de 3 clinici concurente.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Umple-ți agenda cu pacienții potriviți.</h2>
    <p class="lead center">Analizăm gratuit vizibilitatea clinicii tale, comparativ cu concurența.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: marketing B2B pipeline ----
$pages += @{
  path='blog/marketing-b2b-pipeline'
  title='Cum construiești un pipeline B2B previzibil | AMPLIO'
  desc='Marketing B2B pentru firme de servicii: cum treci dincolo de rețeaua personală de contacte și construiești un motor de lead-uri calificate prin LinkedIn ABM, SEO/GEO și nurture.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Pipeline B2B','/blog/marketing-b2b-pipeline') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum construiești un pipeline B2B previzibil","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Pipeline B2B','/blog/marketing-b2b-pipeline') ))
  <span class="eyebrow">Servicii B2B</span>
  <h1>Cum construiești <span class="g">un pipeline B2B previzibil</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~6 min de citit</p>
  <p>Multe firme de servicii cresc doar cât rețeaua personală de contacte a fondatorului. Funcționează, până nu mai funcționează. Un pipeline previzibil înseamnă lead-uri calificate care vin constant, indiferent de cine pe cine cunoaște. Iată cum îl construiești.</p>
  <h2>Definește întâi „lead calificat”</h2>
  <p>Înainte de orice tactică, stabilește clar ce înseamnă un lead bun pentru tine: industrie, mărime, rol al persoanei, problemă. Fără definiție, generezi zgomot. Cu ea, fiecare canal știe pe cine să atragă.</p>
  <h2>LinkedIn ABM: țintește conturile, nu mulțimea</h2>
  <p>În B2B, nu vrei mii de click-uri, vrei câteva zeci de companii potrivite. Account-Based Marketing înseamnă să identifici conturile-țintă și să ajungi la decidenții din ele cu mesaj relevant.</p>
  <h2>SEO + GEO: să te găsească cei care caută soluții</h2>
  <p>Decidenții B2B caută răspunsuri înainte să caute furnizori. Conținut care răspunde la întrebările lor, vizibil în Google și în AI, te aduce în discuție devreme, ca autoritate.</p>
  <h2>Nurture pe email: ciclul B2B e lung</h2>
  <p>Rar cineva cumpără din prima. O secvență de email care educă și construiește încredere ține firma ta în minte până când prospectul e gata. Vezi <a href="/servicii/email-automatizari/">email și automatizări</a>.</p>
  <p>Zero &bdquo;postări de dragul postărilor". Doar canalele care aduc contracte. Așa construim <a href="/solutii/marketing-b2b/">marketingul B2B</a>, cu lead calificat definit și semnat în contract.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Vrei un pipeline care nu depinde de rețeaua ta personală?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a> sau un diagnostic de pipeline.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Construiește un pipeline previzibil.</h2>
    <p class="lead center">Îți arătăm gratuit de unde pot veni primele lead-uri calificate.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- BLOG: conturi ads proprietate ----
$pages += @{
  path='blog/conturi-ads-proprietate'
  title='De ce conturile de ads trebuie să rămână ale tale | AMPLIO'
  desc='De ce e esențial ca firma ta să dețină conturile de Google Ads, Meta și analytics, și ce riști când le ține agenția. Ghid pentru antreprenori.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Conturile rămân ale tale','/blog/conturi-ads-proprietate') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"De ce conturile de ads trebuie să rămână ale tale","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","name":"AMPLIO"},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Conturile rămân ale tale','/blog/conturi-ads-proprietate') ))
  <span class="eyebrow">Punct de vedere</span>
  <h1>De ce conturile de ads <span class="g">trebuie să rămână ale tale</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: iunie 2026 &middot; ~4 min de citit</p>
  <p>Mulți antreprenori descoperă asta prea târziu: când vor să schimbe agenția, află că nu dețin nimic. Conturile de Google Ads, pixelii, datele, istoricul campaniilor, toate sunt la agenția veche. E ca și cum ai construi o casă pe terenul altcuiva.</p>
  <h2>Ce înseamnă „proprietate” concret</h2>
  <ul class="flist" style="margin-top:14px">
    <li>Contul de Google Ads e creat pe firma ta, nu pe a agenției</li>
    <li>Contul de Meta Business Manager îți aparține; agenția primește doar acces</li>
    <li>Google Analytics și pixelii sunt pe proprietatea ta</li>
    <li>Tu poți, oricând, să retragi accesul agenției, și păstrezi tot</li>
  </ul>
  <h2>Ce riști când nu le deții</h2>
  <p>Pierzi tot istoricul de optimizare (care valorează luni de muncă), nu poți schimba agenția fără să o iei de la zero și rămâi ostatic. Unele agenții se bazează exact pe asta ca să te țină captiv.</p>
  <h2>Întrebarea de pus din prima</h2>
  <p>Înainte să semnezi cu orice agenție, întreabă: &bdquo;Conturile și datele rămân ale mele?". Dacă răspunsul nu e un &bdquo;da" clar și în scris, e un semnal de alarmă. Vezi și <a href="/blog/cum-alegi-agentie-marketing/">cum alegi o agenție de marketing</a>.</p>
  <p>La noi e simplu: conturile și datele rămân ale tale, mereu. Transparență 100%, fără ostatici. Așa <a href="/despre/">gândim</a>.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Lucrezi cu o agenție și nu ești sigur ce deții?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a>, te ajutăm să verifici, fără obligații.</p>
  </div>
</article>
  <div class="ctaband" style="margin-top:40px;max-width:760px;margin-inline:auto">
    <h2>Marketingul tău, pe proprietatea ta.</h2>
    <p class="lead center">Transparență totală: conturile și datele rămân mereu ale tale.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
</div></section>
"@
}

# ---- COMPARAȚII (pagini vs) ----
$pages += @{
  path='comparatii/amplio-vs-doads'
  title='AMPLIO vs DoAds: ce agenție ți se potrivește? | AMPLIO'
  desc='Comparație onestă AMPLIO vs DoAds: servicii, model de plată, GEO/AI, preț și pentru cine e fiecare. Te ajutăm să alegi agenția potrivită pentru afacerea ta.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Comparații','/comparatii/amplio-vs-doads'); ,@('AMPLIO vs DoAds','/comparatii/amplio-vs-doads') ))
  jsonld='{"@context":"https://schema.org","@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Care e o alternativă la DoAds pentru IMM?","acceptedAnswer":{"@type":"Answer","text":"AMPLIO este o alternativă pentru firmele care vor un departament de marketing complet (ads, SEO, GEO, email, strategie) sub un singur partener, cu preț transparent și plată legată de rezultate, nu doar administrare de ads."}},{"@type":"Question","name":"Prin ce diferă AMPLIO de DoAds?","acceptedAnswer":{"@type":"Answer","text":"DoAds este axată pe paid ads, cu portofoliu mare și brand consacrat. AMPLIO acoperă tot marketingul, inclusiv SEO și vizibilitate în motoarele AI (GEO), cu preț transparent și model de parteneriat pe rezultate."}}]}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Comparații','/comparatii/amplio-vs-doads'); ,@('AMPLIO vs DoAds','/comparatii/amplio-vs-doads') ))
  <span class="eyebrow">Comparație onestă</span>
  <h1>AMPLIO vs DoAds: <span class="g">ce agenție ți se potrivește?</span></h1>
  <p class="lead">Pe scurt: DoAds e o agenție consacrată de paid ads, cu portofoliu mare și brand puternic. AMPLIO e departamentul tău de marketing complet (ads, SEO, GEO, email, strategie), cu preț transparent și plată legată de rezultate. Mai jos, comparația corectă, ca să alegi în cunoștință de cauză.</p>
</div></section>
<section><div class="wrap rev">
  <table class="cmp">
    <thead><tr><th>Dimensiune</th><th class="you">AMPLIO</th><th>DoAds</th></tr></thead>
    <tbody>
      <tr><td>Focus</td><td class="you">Departament de marketing complet, pentru IMM</td><td>Performance / paid ads</td></tr>
      <tr><td>Servicii</td><td class="you">Ads, SEO + GEO, social, email, CRO, CMO extern</td><td>Meta/Google/TikTok ads, email, web, design</td></tr>
      <tr><td>Vizibilitate în AI (GEO)</td><td class="you">Da, central</td><td>Nu</td></tr>
      <tr><td>SEO organic</td><td class="you">Da</td><td>Nu</td></tr>
      <tr><td>Model de plată</td><td class="you">Abonament transparent 350-3500 € sau parteneriat: fee redus + 5-10% din creșterea vânzărilor</td><td>Administrare ads pe fee (bugete de la ~300-1.000 €/lună)</td></tr>
      <tr><td>Transparență preț</td><td class="you">Calculator public pe site</td><td>Praguri de buget publice</td></tr>
      <tr><td>Dovadă / garanție</td><td class="you">Garanție contractuală: KPI scriși + clauză de ieșire la 90 de zile</td><td>Portofoliu mare: 600+ clienți, 250M€ vânzări generate</td></tr>
      <tr><td>Conturile rămân ale tale</td><td class="you">Da, explicit</td><td>Nespecificat public</td></tr>
    </tbody>
  </table>
  <div class="cols2" style="margin-top:44px">
    <div class="panelcard">
      <h3>Alege DoAds dacă…</h3>
      <ul class="flist" style="margin-top:8px">
        <li>Vrei în principal <b>paid ads</b> administrate de o echipă consacrată</li>
        <li>Cauți o agenție cu <b>portofoliu mare și dovezi</b> publice</li>
        <li>Brandul „ex-Facebook" și recunoașterea contează pentru tine</li>
      </ul>
    </div>
    <div class="panelcard">
      <h3>Alege AMPLIO dacă…</h3>
      <ul class="flist" style="margin-top:8px">
        <li>Vrei <b>tot marketingul sub un partener</b>, nu doar ads</li>
        <li>Vrei să fii găsit în Google <b>și în motoarele AI</b> (GEO)</li>
        <li>Vrei <b>preț transparent</b> + model pe rezultate + clauză de ieșire la 90 de zile</li>
        <li>Ești IMM și vrei să începi <b>accesibil</b> (de la 350 €)</li>
      </ul>
    </div>
  </div>
  <div class="prose" style="margin-top:46px">
    <h2>Diferența esențială</h2>
    <p>DoAds excelează la un lucru: paid ads la scară, cu dovezi solide. Dacă atât îți trebuie, e o alegere foarte bună. AMPLIO rezolvă o problemă diferită, a firmei care nu vrea să jongleze cu mai mulți furnizori: <strong>un singur partener pentru ads, SEO, GEO, email și strategie</strong>, cu plata legată de rezultatele tale și cu libertatea de a pleca după 90 de zile dacă nu livrăm.</p>
    <h2>Întrebări frecvente</h2>
    <h3>Care e o alternativă la DoAds pentru IMM?</h3>
    <p>AMPLIO, pentru firmele care vor un departament de marketing complet (ads, SEO, GEO, email, strategie) sub un singur partener, cu preț transparent și plată legată de rezultate, nu doar administrare de ads.</p>
    <h3>Prin ce diferă AMPLIO de DoAds?</h3>
    <p>DoAds e axată pe paid ads, cu portofoliu mare. AMPLIO acoperă tot marketingul, inclusiv SEO și vizibilitate în motoarele AI (GEO), cu preț transparent și model de parteneriat pe rezultate.</p>
  </div>
  <div class="ctaband" style="margin-top:44px;max-width:760px;margin-inline:auto">
    <h2>Nu ești sigur ce ți se potrivește?</h2>
    <p class="lead center">Cere auditul gratuit. Îți spunem onest dacă ai nevoie de un partener complet sau doar de ads, fără obligații.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
  <p class="center" style="margin-top:24px"><a href="/comparatii/amplio-vs-maximize/" style="color:var(--sky)">Vezi și: AMPLIO vs Maximize &rarr;</a> &middot; <a href="/blog/cum-alegi-agentie-marketing/" style="color:var(--sky)">Cum alegi o agenție de marketing</a></p>
</div></section>
"@
}
$pages += @{
  path='comparatii/amplio-vs-maximize'
  title='AMPLIO vs Maximize: ce agenție ți se potrivește? | AMPLIO'
  desc='Comparație onestă AMPLIO vs Maximize: model de plată pe rezultate, servicii, GEO/AI, preț și pentru cine e fiecare. Alege agenția potrivită afacerii tale.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Comparații','/comparatii/amplio-vs-maximize'); ,@('AMPLIO vs Maximize','/comparatii/amplio-vs-maximize') ))
  jsonld='{"@context":"https://schema.org","@type":"FAQPage","mainEntity":[{"@type":"Question","name":"AMPLIO are plata pe rezultate ca Maximize?","acceptedAnswer":{"@type":"Answer","text":"Da, AMPLIO oferă un model de parteneriat: fee fix redus plus 5-10% din creșterea vânzărilor peste un baseline semnat, cu KPI scriși în contract și clauză de ieșire la 90 de zile."}},{"@type":"Question","name":"Prin ce diferă AMPLIO de Maximize?","acceptedAnswer":{"@type":"Answer","text":"Maximize e centrată pe eCommerce și PPC, cu istoric de 8+ ani. AMPLIO e un departament de marketing complet, cu SEO și GEO (vizibilitate în AI) și preț transparent, plus un model de plată pe rezultate structurat contractual."}}]}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Comparații','/comparatii/amplio-vs-maximize'); ,@('AMPLIO vs Maximize','/comparatii/amplio-vs-maximize') ))
  <span class="eyebrow">Comparație onestă</span>
  <h1>AMPLIO vs Maximize: <span class="g">ce agenție ți se potrivește?</span></h1>
  <p class="lead">Pe scurt: Maximize e o agenție consacrată (8+ ani) cu „plata pe rezultate", centrată pe eCommerce și PPC, cu studii de caz. AMPLIO oferă același principiu de plată pe rezultate, dar structurat contractual, și ca departament de marketing complet, cu SEO și GEO, nu doar ads.</p>
</div></section>
<section><div class="wrap rev">
  <table class="cmp">
    <thead><tr><th>Dimensiune</th><th class="you">AMPLIO</th><th>Maximize</th></tr></thead>
    <tbody>
      <tr><td>Focus</td><td class="you">Departament de marketing complet, pentru IMM</td><td>eCommerce / PPC</td></tr>
      <tr><td>Servicii</td><td class="you">Ads, SEO + GEO, social, email, CRO, CMO extern</td><td>Ads/PPC, eCom, email, social</td></tr>
      <tr><td>Vizibilitate în AI (GEO)</td><td class="you">Da, central</td><td>Nu</td></tr>
      <tr><td>SEO organic</td><td class="you">Da</td><td>Limitat</td></tr>
      <tr><td>Plata pe rezultate</td><td class="you">Da, structurat: fee redus + 5-10% din creșterea peste baseline, KPI scriși + clauză de ieșire</td><td>Da, „plata pe rezultate" (structură nepublică)</td></tr>
      <tr><td>Transparență preț</td><td class="you">Calculator public, 350-3500 €</td><td>La cerere</td></tr>
      <tr><td>Dovadă / garanție</td><td class="you">Garanție contractuală: KPI + clauză de ieșire la 90 de zile</td><td>8+ ani, studii de caz cu procente</td></tr>
      <tr><td>Conturile rămân ale tale</td><td class="you">Da, explicit</td><td>Nespecificat public</td></tr>
    </tbody>
  </table>
  <div class="cols2" style="margin-top:44px">
    <div class="panelcard">
      <h3>Alege Maximize dacă…</h3>
      <ul class="flist" style="margin-top:8px">
        <li>Ești <b>eCommerce</b> și vrei focus pe ads/PPC și ROAS</li>
        <li>Cauți o agenție cu <b>istoric și studii de caz</b> cu procente</li>
        <li>Ești ok cu prețul oferit „la cerere"</li>
      </ul>
    </div>
    <div class="panelcard">
      <h3>Alege AMPLIO dacă…</h3>
      <ul class="flist" style="margin-top:8px">
        <li>Vrei <b>marketing complet</b> (ads + SEO + GEO + email + strategie), nu doar ads</li>
        <li>Vrei vizibilitate și în <b>motoarele AI</b> (GEO)</li>
        <li>Vrei plata pe rezultate <b>structurată</b> (baseline, KPI scriși, clauză de ieșire)</li>
        <li>Vrei <b>preț transparent</b> de la început</li>
      </ul>
    </div>
  </div>
  <div class="prose" style="margin-top:46px">
    <h2>Diferența esențială</h2>
    <p>Amândouă agențiile cred în plata legată de rezultate, ceea ce e rar și bun. Diferența e în <strong>amploare și structură</strong>: Maximize e specializată pe eCommerce și ads, cu un istoric solid. AMPLIO acoperă tot marketingul (inclusiv SEO și GEO), pune prețul transparent pe masă și scrie rezultatele așteptate în contract, cu o clauză de ieșire la 90 de zile.</p>
    <h2>Întrebări frecvente</h2>
    <h3>AMPLIO are plata pe rezultate ca Maximize?</h3>
    <p>Da. Model de parteneriat: fee fix redus + 5-10% din creșterea vânzărilor peste un baseline semnat, cu KPI scriși și clauză de ieșire la 90 de zile.</p>
    <h3>Prin ce diferă AMPLIO de Maximize?</h3>
    <p>Maximize e centrată pe eCommerce și PPC, cu 8+ ani istoric. AMPLIO e un departament de marketing complet, cu SEO și GEO și preț transparent, plus plata pe rezultate structurată contractual.</p>
  </div>
  <div class="ctaband" style="margin-top:44px;max-width:760px;margin-inline:auto">
    <h2>Vrei plata legată de rezultatele tale?</h2>
    <p class="lead center">Cere auditul gratuit și discutăm dacă modelul de parteneriat ți se potrivește, fără obligații.</p>
    <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
  </div>
  <p class="center" style="margin-top:24px"><a href="/comparatii/amplio-vs-doads/" style="color:var(--sky)">Vezi și: AMPLIO vs DoAds &rarr;</a> &middot; <a href="/blog/cum-alegi-agentie-marketing/" style="color:var(--sky)">Cum alegi o agenție de marketing</a></p>
</div></section>
"@
}

# ---------- RUN ----------
Write-Host "AMPLIO build - $($pages.Count) pagini..."
foreach ($p in $pages) { Build-Page $p }
Write-Host "Gata."
