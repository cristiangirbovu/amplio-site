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
          <a href="/servicii/google-ads/"><b>Google Ads</b><small>Reclame pe căutări</small></a>
          <a href="/servicii/facebook-ads/"><b>Facebook Ads</b><small>Facebook și Instagram</small></a>
          <a href="/servicii/seo-geo/"><b>SEO + GEO</b><small>Vizibilitate Google și AI</small></a>
          <a href="/servicii/geo/"><b>Optimizare GEO</b><small>ChatGPT, Perplexity, AI</small></a>
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
      <li><a href="/contact/">Contact</a></li>
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
    <a href="/contact/" onclick="toggleMenu()">Contact</a>
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
        <p class="foot-contact"><a href="mailto:contact@amplio.ro">contact@amplio.ro</a><br><a href="tel:+40728151558">0728 151 558</a> &middot; <a href="https://wa.me/40728151558" target="_blank" rel="noopener">WhatsApp</a></p>
        <div class="socials" aria-label="AMPLIO pe rețele sociale">
          <a href="https://www.facebook.com/profile.php?id=61591035806830" target="_blank" rel="noopener" aria-label="Facebook"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M22 12.06C22 6.5 17.52 2 12 2S2 6.5 2 12.06c0 5 3.66 9.15 8.44 9.94v-7.03H7.9v-2.9h2.54V9.85c0-2.51 1.49-3.9 3.78-3.9 1.09 0 2.24.2 2.24.2v2.46h-1.26c-1.24 0-1.63.77-1.63 1.56v1.88h2.78l-.44 2.9h-2.34V22c4.78-.79 8.44-4.94 8.44-9.94z"/></svg></a>
          <a href="https://www.instagram.com/amplio.ro/" target="_blank" rel="noopener" aria-label="Instagram"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 2c2.72 0 3.06.01 4.12.06 1.07.05 1.8.22 2.43.47.66.25 1.22.6 1.77 1.15.55.55.9 1.11 1.15 1.77.25.63.42 1.36.47 2.43.05 1.07.06 1.4.06 4.12s-.01 3.06-.06 4.12c-.05 1.07-.22 1.8-.47 2.43a4.9 4.9 0 01-1.15 1.77c-.55.55-1.11.9-1.77 1.15-.63.25-1.36.42-2.43.47-1.07.05-1.4.06-4.12.06s-3.06-.01-4.12-.06c-1.07-.05-1.8-.22-2.43-.47a4.9 4.9 0 01-1.77-1.15 4.9 4.9 0 01-1.15-1.77c-.25-.63-.42-1.36-.47-2.43C2.01 15.06 2 14.72 2 12s.01-3.06.06-4.12c.05-1.07.22-1.8.47-2.43.25-.66.6-1.22 1.15-1.77.55-.55 1.11-.9 1.77-1.15.63-.25 1.36-.42 2.43-.47C8.94 2.01 9.28 2 12 2zm0 1.8c-2.67 0-2.99.01-4.04.06-.98.04-1.51.21-1.86.35-.47.18-.8.4-1.15.75-.35.35-.57.68-.75 1.15-.14.35-.31.88-.35 1.86-.05 1.05-.06 1.37-.06 4.04s.01 2.99.06 4.04c.04.98.21 1.51.35 1.86.18.47.4.8.75 1.15.35.35.68.57 1.15.75.35.14.88.31 1.86.35 1.05.05 1.37.06 4.04.06s2.99-.01 4.04-.06c.98-.04 1.51-.21 1.86-.35.47-.18.8-.4 1.15-.75.35-.35.57-.68.75-1.15.14-.35.31-.88.35-1.86.05-1.05.06-1.37.06-4.04s-.01-2.99-.06-4.04c-.04-.98-.21-1.51-.35-1.86a3.1 3.1 0 00-.75-1.15 3.1 3.1 0 00-1.15-.75c-.35-.14-.88-.31-1.86-.35-1.05-.05-1.37-.06-4.04-.06zm0 3.06a5.14 5.14 0 110 10.28 5.14 5.14 0 010-10.28zm0 1.8a3.34 3.34 0 100 6.68 3.34 3.34 0 000-6.68zm5.34-.15a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"/></svg></a>
          <a href="https://www.linkedin.com/company/amplio-agen%C8%9Bie-de-marketing/" target="_blank" rel="noopener" aria-label="LinkedIn"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M19 3a2 2 0 012 2v14a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h14zM8.34 18.34V10.4H5.67v7.94h2.67zM7 9.24a1.55 1.55 0 100-3.1 1.55 1.55 0 000 3.1zm11.34 9.1v-4.36c0-2.33-1.25-3.42-2.9-3.42-1.34 0-1.94.74-2.27 1.25v-1.07h-2.67c.03.75 0 7.94 0 7.94h2.67v-4.43c0-.24.02-.48.09-.65.19-.48.63-.97 1.36-.97.96 0 1.35.73 1.35 1.8v4.25h2.67z"/></svg></a>
          <a href="https://share.google/HBHIPUHvtvdNUqUPn" target="_blank" rel="noopener" aria-label="Profil Google Business"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12.24 10.4v3.35h4.66c-.2 1.2-1.5 3.5-4.66 3.5-2.8 0-5.1-2.32-5.1-5.18s2.3-5.18 5.1-5.18c1.6 0 2.67.68 3.28 1.27l2.24-2.16C16.4 4.6 14.5 3.7 12.24 3.7c-4.6 0-8.34 3.73-8.34 8.34s3.74 8.34 8.34 8.34c4.82 0 8.02-3.39 8.02-8.16 0-.55-.06-.97-.13-1.39l-7.89-.03z"/></svg></a>
        </div>
      </div>
      <div class="foot-col">
        <h4>Servicii</h4>
        <a href="/servicii/performance-ads/">Performance Ads</a>
        <a href="/servicii/google-ads/">Google Ads</a>
        <a href="/servicii/facebook-ads/">Facebook Ads</a>
        <a href="/servicii/seo-geo/">SEO + GEO</a>
        <a href="/servicii/geo/">Optimizare GEO</a>
        <a href="/servicii/social-media/">Social Media</a>
        <a href="/servicii/email-automatizari/">Email &amp; Automatizări</a>
        <a href="/servicii/landing-pages-cro/">Landing &amp; CRO</a>
        <a href="/servicii/cmo-extern/">CMO Extern</a>
        <a href="/servicii/abonament-corporate/">Abonament Corporate</a>
      </div>
      <div class="foot-col">
        <h4>Soluții</h4>
        <a href="/solutii/marketing-ecommerce/">eCommerce</a>
        <a href="/solutii/marketing-clinici/">Clinici</a>
        <a href="/solutii/marketing-b2b/">Servicii B2B</a>
        <a href="/solutii/marketing-horeca/">HoReCa</a>
        <a href="/solutii/marketing-export/">Producători &amp; Export</a>
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
      <span>&copy; <span id="yr">2026</span> AMPLIO CREATIVE S.R.L.</span>
      <span><a href="/termeni/">Termeni</a> &middot; <a href="/confidentialitate/">Confidențialitate</a> &middot; <a href="/cookies/">Cookies</a> &middot; <a href="/cookies/" data-cookie-settings>Setări cookie-uri</a></span>
    </div>
    <p class="foot-legal">AMPLIO CREATIVE S.R.L. &middot; Sediu social: Bd. Dinicu Golescu nr. 7, Sector 1, 010871 București &middot; Nr. Reg. Com. J2026044340009 &middot; CUI 55206491</p>
  </div>
</footer>
'@

# ---------- Buton flotant Suna + WhatsApp (identic pe tot site-ul) ----------
$FAB = @'
<div class="fab" aria-label="Contact rapid">
  <a class="fab-wa" href="https://wa.me/40728151558" target="_blank" rel="noopener" aria-label="Scrie-ne pe WhatsApp" data-tip="Scrie pe WhatsApp">
    <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M17.47 14.38c-.3-.15-1.76-.87-2.03-.97-.27-.1-.47-.15-.67.15-.2.3-.77.97-.94 1.16-.17.2-.35.22-.64.08-.3-.15-1.26-.47-2.39-1.48-.88-.79-1.48-1.76-1.65-2.06-.17-.3-.02-.46.13-.61.13-.13.3-.35.45-.52.15-.17.2-.3.3-.5.1-.2.05-.37-.02-.52-.08-.15-.67-1.61-.92-2.21-.24-.58-.49-.5-.67-.51l-.57-.01c-.2 0-.52.07-.79.37-.27.3-1.04 1.02-1.04 2.48 0 1.46 1.06 2.88 1.21 3.07.15.2 2.1 3.2 5.08 4.49.71.31 1.26.49 1.69.63.71.22 1.36.19 1.87.12.57-.09 1.76-.72 2.01-1.41.25-.69.25-1.29.17-1.41-.07-.12-.27-.2-.57-.35M12.05 21.79h-.01a9.87 9.87 0 01-5.03-1.38l-.36-.21-3.74.98 1-3.65-.24-.37a9.86 9.86 0 01-1.51-5.26c0-5.45 4.44-9.88 9.89-9.88 2.64 0 5.12 1.03 6.99 2.9a9.83 9.83 0 012.89 6.99c0 5.45-4.44 9.88-9.89 9.88M20.46 3.49A11.82 11.82 0 0012.05 0C5.5 0 .16 5.34.16 11.89c0 2.1.55 4.14 1.59 5.95L.06 24l6.3-1.65a11.88 11.88 0 005.69 1.45h.01c6.55 0 11.89-5.34 11.89-11.89a11.82 11.82 0 00-3.49-8.42"/></svg>
  </a>
  <a class="fab-call" href="tel:+40728151558" aria-label="Sună-ne" data-tip="Sună acum">
    <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M6.62 10.79c1.44 2.83 3.76 5.14 6.59 6.59l2.2-2.2c.27-.27.67-.36 1.02-.24 1.12.37 2.33.57 3.57.57.55 0 1 .45 1 1V20c0 .55-.45 1-1 1-9.39 0-17-7.61-17-17 0-.55.45-1 1-1h3.5c.55 0 1 .45 1 1 0 1.25.2 2.45.57 3.57.11.35.03.74-.25 1.02l-2.2 2.2z"/></svg>
  </a>
</div>
'@

# ---------- Wrapper HTML ----------
function Build-Page($p) {
  $canonical = "https://amplio.ro/$($p.path)/"
  $jsonld = ""
  if ($p.jsonld) {
    $ld = $p.jsonld
    if ($ld -like '*"@type":"Service",*' -and $ld -notlike '*"url":"https://amplio.ro/s*') { $ld = $ld.Replace('"@type":"Service",', '"@type":"Service","url":"' + $canonical + '",') }
    if ($ld -like '*"@type":"Article",*' -and $ld -notlike '*"mainEntityOfPage"*') { $ld = $ld.Replace('"@type":"Article",', '"@type":"Article","mainEntityOfPage":"' + $canonical + '","image":"https://amplio.ro/assets/og-amplio.jpg",') }
    $jsonld = "<script type=""application/ld+json"">$ld</script>"
  }
  $html = @"
<!DOCTYPE html>
<html lang="ro">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="referrer" content="strict-origin-when-cross-origin">
<title>$($p.title)</title>
<meta name="description" content="$($p.desc)">
<link rel="canonical" href="$canonical">
<link rel="icon" href="/favicon.ico" sizes="32x32">
<link rel="icon" type="image/svg+xml" href="/favicon.svg">
<meta property="og:type" content="website">
<meta property="og:url" content="$canonical">
<meta property="og:title" content="$($p.title)">
<meta property="og:description" content="$($p.desc)">
<meta property="og:image" content="https://amplio.ro/assets/og-amplio.jpg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:image:alt" content="AMPLIO, agenție de marketing digital">
<meta property="og:site_name" content="AMPLIO">
<meta property="og:locale" content="ro_RO">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="$($p.title)">
<meta name="twitter:description" content="$($p.desc)">
<meta name="twitter:image" content="https://amplio.ro/assets/og-amplio.jpg">
<link rel="preload" href="/assets/fonts/space-grotesk-latin.woff2" as="font" type="font/woff2" crossorigin>
<link rel="preload" href="/assets/fonts/inter-latin.woff2" as="font" type="font/woff2" crossorigin>
<link rel="stylesheet" href="/assets/style.css">
<script type="application/ld+json">$($p.crumbsJson)</script>
$jsonld
</head>
<body id="top">
$NAV
$($p.body)
$($p.extra)
$FOOTER
$FAB
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
      <p class="lead center">Cere auditul gratuit. În 24 de ore primești o analiză personalizată și primii 3 pași, fără obligații.</p>
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

# Helper pentru blocul "Articole utile" de sub serviciu
function Articole($links) {
  $a = ($links | ForEach-Object { "<a class=""svc"" href=""$($_[1])""><h3>$($_[0])</h3><span class=""more"">Citește &rarr;</span></a>" }) -join "`n      "
  return @"
<section>
  <div class="wrap rev">
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-bottom:4px">Articole utile</h2>
    <div class="svc-grid">
      $a
    </div>
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
  title='Agenție performance marketing: Google, Meta, TikTok | AMPLIO'
  desc='Agenție de performance marketing: Google Ads, Facebook, Instagram și TikTok Ads administrate complet, cu raport pe venit. De la 450 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Performance Ads','/servicii/performance-ads') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Administrare campanii publicitare (PPC)","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"450"}}'
  extra=(Articole @( ,@('Cât costă Google Ads în România în 2026','/blog/cost-google-ads-romania/'); ,@('7 greșeli care îți ard bugetul de Google Ads','/blog/greseli-buget-google-ads/'); ,@('Google Ads vs Meta Ads: cu care începi?','/blog/google-ads-vs-meta-ads/') ))
  body=(SvcBody 'Serviciu &middot; Performance Ads' 'Administrare Google Ads,' 'Meta și TikTok Ads.' '<strong>Reclame care aduc vânzări, nu doar afișări.</strong> Administrăm complet Google Ads, Meta și TikTok: strategie, creație asistată de AI, optimizare săptămânală și raport pe venit real, nu pe impresii. Conturile rămân mereu ale tale.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Performance Ads','/servicii/performance-ads') )) '<h2>Bugetul tău de ads, condus de cifre</h2><p class="lead" style="margin-bottom:18px">Cele mai multe firme cheltuie pe ads fără să știe ce canal aduce vânzări. Noi pornim de la tracking corect și baseline semnat, apoi optimizăm săptămânal pe metrica ce contează: costul pe client nou și venitul generat.</p><p>Creația o producem rapid cu AI, sub control uman, ca să testăm mai multe variante decât o agenție clasică. Iar dacă are sens pentru tine, intrăm pe modelul de parteneriat: fee fix redus + procent doar din creșterea vânzărilor.</p><p style="margin-top:18px">Pentru fiecare canal avem o pagină dedicată: <a href="/servicii/google-ads/" style="color:var(--sky)">Google Ads</a> și <a href="/servicii/facebook-ads/" style="color:var(--sky)">Facebook și Instagram Ads</a>.</p>' @('<b>Strategie de canal:</b> unde merită bugetul tău (Google, Meta, TikTok)','<b>Creație AI</b> cu control uman: mai multe variante, testate constant','<b>Optimizare săptămânală</b> pe cost/client și ROAS','<b>Tracking corect</b> verificat cu teste reale înainte de spend','<b>Raport lunar pe venit</b>, nu pe afișări','<b>Conturile rămân ale tale</b>, transparență 100%') 'De la <strong style="color:var(--off)">450 &euro;/lună</strong> sau % din ad spend' (Related 'Merge mână în mână cu' @( ,@('Landing Pages &amp; CRO','/servicii/landing-pages-cro'); ,@('SEO + GEO','/servicii/seo-geo'); ,@('Email &amp; Automatizări','/servicii/email-automatizari') )))
}
$pages += @{
  path='servicii/social-media'
  title='Agenție social media: administrare pagini | AMPLIO'
  desc='Administrare social media pentru firme din România: calendar lunar, creație AI cu control uman, programare și raport. Pachete de la 350 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Social Media','/servicii/social-media') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Administrare social media","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"350"}}'
  extra=(Articole @( ,@('Google Ads vs Meta Ads: cu care începi?','/blog/google-ads-vs-meta-ads/'); ,@('Cum alegi o agenție de marketing (și ce întrebări să pui)','/blog/cum-alegi-agentie-marketing/'); ,@('De ce conturile de ads trebuie să rămână ale tale','/blog/conturi-ads-proprietate/') ))
  body=(SvcBody 'Serviciu &middot; Social Media' 'Administrare social media' 'pentru firme.' '<strong>Vocea brandului tău, fără efortul tău.</strong> Calendar lunar, creație cu AI sub control uman, programare și raport. Păstrăm tonul brandului tău și publicăm constant, ca să nu mai depindă totul de inspirația de moment.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Social Media','/servicii/social-media') )) '<h2>Constanța bate inspirația</h2><p class="lead" style="margin-bottom:18px">Problema social media nu e ideea de azi, e ritmul de fiecare săptămână. Noi construim un calendar editorial, producem conținutul și îl programăm, ca prezența ta să fie constantă și coerentă.</p><p>Creația o accelerăm cu AI, dar fiecare postare trece prin control uman și prin vocea brandului tău. Tu aprobi, noi publicăm și măsurăm.</p>' @('<b>Calendar editorial lunar</b> aliniat cu obiectivele tale','<b>Creație AI + control uman:</b> text și vizual','<b>Programare</b> pe toate platformele relevante','<b>Raport lunar</b> pe creștere și engagement','<b>Micro-influenceri &amp; UGC</b> prin rețeaua de parteneri (opțional)') 'Pachete <strong style="color:var(--off)">350 / 600 / 950 &euro;</strong>/lună' (Related 'Merge mână în mână cu' @( ,@('Performance Ads','/servicii/performance-ads'); ,@('SEO + GEO','/servicii/seo-geo') )))
}
$pages += @{
  path='servicii/email-automatizari'
  title='Agenție email marketing și automatizări | AMPLIO'
  desc='Email marketing și automatizări pentru firme din România: fluxuri de bun venit, coș abandonat și reactivare, legate de CRM. De la 250 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Email & Automatizări','/servicii/email-automatizari') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Email marketing si automatizari","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"250"}}'
  extra=(Articole @( ,@('Marketing pentru magazin online: ghid de creștere a vânzărilor','/blog/marketing-magazin-online/'); ,@('Cum construiești un pipeline B2B previzibil','/blog/marketing-b2b-pipeline/') ))
  body=(SvcBody 'Serviciu &middot; Email &amp; Automatizări' 'Email marketing' 'și automatizări.' '<strong>Fluxuri care vând în timp ce dormi.</strong> Bun venit, coș abandonat, reactivare: secvențe automate care aduc venit fără efort recurent. În e-commerce, emailul generează tipic 20-30% din venitul total.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Email & Automatizări','/servicii/email-automatizari') )) '<h2>Cel mai profitabil canal, neglijat de toată lumea</h2><p class="lead" style="margin-bottom:18px">Emailul nu are cost pe click și vorbește cu oameni care deja te cunosc. Bine făcut, e cel mai mare ROI din marketing. Noi construim fluxurile o dată și lucrează luni întregi.</p><p>Conectăm tot la CRM-ul tău, segmentăm și testăm subiecte și oferte, cu raport pe venitul generat de email.</p>' @('<b>Fluxuri automate:</b> bun venit, coș abandonat, reactivare, post-cumpărare','<b>Segmentare</b> și personalizare pe comportament','<b>Integrare CRM</b> (HubSpot, Klaviyo, Mailchimp etc.)','<b>Teste A/B</b> pe subiecte și oferte','<b>Raport pe venitul email</b>, nu pe rata de deschidere') 'De la <strong style="color:var(--off)">250 &euro;/lună</strong> sau % din venitul email' (Related 'Merge mână în mână cu' @( ,@('Performance Ads','/servicii/performance-ads'); ,@('Landing Pages &amp; CRO','/servicii/landing-pages-cro') )))
}
$pages += @{
  path='servicii/landing-pages-cro'
  title='Creare landing page și optimizarea conversiei | AMPLIO'
  desc='Creare landing page și optimizarea conversiei (CRO) pe date reale: heatmaps, înregistrări, teste A/B. Landing de la 450 EUR, CRO de la 400 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Landing & CRO','/servicii/landing-pages-cro') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Landing pages si optimizarea conversiei","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"400"}}'
  extra=(Articole @( ,@('7 greșeli care îți ard bugetul de Google Ads','/blog/greseli-buget-google-ads/'); ,@('Marketing pentru magazin online: ghid de creștere a vânzărilor','/blog/marketing-magazin-online/'); ,@('Cât costă Google Ads în România în 2026','/blog/cost-google-ads-romania/') ))
  body=(SvcBody 'Serviciu &middot; Landing &amp; CRO' 'Landing pages și optimizarea' 'conversiei (CRO).' '<strong>Același trafic, mai multe conversii.</strong> Construim pagini făcute să convertească și le optimizăm continuu pe date reale: heatmaps, înregistrări de sesiune și teste A/B. Nu ghicim, măsurăm.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Landing & CRO','/servicii/landing-pages-cro') )) '<h2>Traficul costă. Risipa lui costă și mai mult</h2><p class="lead" style="margin-bottom:18px">Dacă aduci vizitatori pe o pagină care nu convertește, plătești de două ori. CRO scoate mai multe vânzări din același trafic, fără buget suplimentar de ads.</p><p>Pornim de la date: unde se opresc oamenii, unde dau scroll, unde abandonează. Apoi testăm ipoteze și păstrăm ce câștigă.</p>' @('<b>Landing pages</b> construite pe principii de conversie','<b>Heatmaps &amp; înregistrări</b> de sesiune','<b>Teste A/B</b> pe titluri, oferte, formulare','<b>Optimizarea formularelor</b> și a fluxului de checkout','<b>Raport pe rata de conversie</b> și impact în venit') 'Landing de la <strong style="color:var(--off)">450 &euro;</strong> &middot; CRO de la <strong style="color:var(--off)">400 &euro;</strong>/lună' (Related 'Merge mână în mână cu' @( ,@('Performance Ads','/servicii/performance-ads'); ,@('Email &amp; Automatizări','/servicii/email-automatizari') )))
}
$pages += @{
  path='servicii/cmo-extern'
  title='CMO extern și consultanță de marketing | AMPLIO'
  desc='CMO extern pentru firme din România: director de marketing senior, fracționat. Strategie, coordonarea furnizorilor și raport de board. 800-1.500 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('CMO Extern','/servicii/cmo-extern') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Director de marketing fractionat (CMO extern)","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"800"}}'
  extra=(Articole @( ,@('Cum alegi o agenție de marketing (și ce întrebări să pui)','/blog/cum-alegi-agentie-marketing/'); ,@('Cum construiești un pipeline B2B previzibil','/blog/marketing-b2b-pipeline/'); ,@('De ce conturile de ads trebuie să rămână ale tale','/blog/conturi-ads-proprietate/') ))
  body=(SvcBody 'Serviciu &middot; CMO Extern' 'CMO extern:' 'director de marketing fracționat.' '<strong>Strategie de director, fără salariu de director.</strong> Un director de marketing senior, fracționat: pune strategia, coordonează furnizorii și livrează raport de board lunar. Maxim 5 clienți simultan, ca să primești atenție reală.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('CMO Extern','/servicii/cmo-extern') )) '<h2>Ai nevoie de strategie, nu de încă un executant</h2><p class="lead" style="margin-bottom:18px">Multe firme au oameni care fac marketing, dar nimeni care să decidă direcția. Un CMO full-time bun costă enorm. CMO-ul extern îți dă exact creierul strategic, fracționat.</p><p>Stabilim obiective, priorități și bugete, coordonăm echipa și furnizorii și raportăm lunar la nivel de board. Tu rămâi cu deciziile, noi ducem greul de coordonare.</p>' @('<b>Strategie de marketing</b> și plan pe trimestre','<b>Coordonarea furnizorilor</b> și a echipei interne','<b>Bugetare</b> și alocare pe canale','<b>Raport de board lunar</b> pe obiective și rezultate','<b>Maxim 5 clienți simultan</b>, atenție reală') '<strong style="color:var(--off)">800-1.500 &euro;</strong>/lună' (Related 'Merge mână în mână cu' @( ,@('Abonament Corporate','/servicii/abonament-corporate'); ,@('Performance Ads','/servicii/performance-ads') )))
}
$pages += @{
  path='servicii/abonament-corporate'
  title='Externalizare marketing: abonament corporate | AMPLIO'
  desc='Externalizare completă a marketingului: toate canalele, un singur contact, un singur raport. Start 950, Growth 1.900, Scale 3.500 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Abonament Corporate','/servicii/abonament-corporate') ))
  jsonld='{"@context":"https://schema.org","@type":"Service","serviceType":"Externalizare completa marketing","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"Romania"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"950"}}'
  extra=(Articole @( ,@('Cum alegi o agenție de marketing (și ce întrebări să pui)','/blog/cum-alegi-agentie-marketing/'); ,@('De ce conturile de ads trebuie să rămână ale tale','/blog/conturi-ads-proprietate/') ))
  body=(SvcBody 'Serviciu &middot; Abonament Corporate' 'Externalizare completă' 'a marketingului.' '<strong>Departamentul tău de marketing, fără angajări.</strong> Externalizare completă: toate canalele, un singur contact, un singur raport. Strategie, producție și execuție sub un singur contract. Trei niveluri, în funcție de ambiția ta.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Abonament Corporate','/servicii/abonament-corporate') )) '<h2>Tot marketingul, un singur partener</h2><p class="lead" style="margin-bottom:18px">În loc să angajezi 4 oameni și să coordonezi 3 freelanceri, ai o singură echipă care acoperă totul: ads, SEO/GEO, social, email, conținut și strategie. Un contract, un raport, un număr de telefon.</p><p>Pentru orice nu facem intern, producție video, foto, influenceri, integrări, folosim rețeaua noastră de parteneri verificați, pe care o coordonăm noi.</p>' @('<b>Start, 950 &euro;/lună:</b> canalele esențiale + strategie','<b>Growth, 1.900 &euro;/lună:</b> mix complet + ritm accelerat','<b>Scale, 3.500 &euro;/lună:</b> tot, plus producție și CMO extern inclus','<b>Un singur contact</b> și un raport unificat lunar','<b>Rețeaua de parteneri</b> pentru orice producție specială') '<strong style="color:var(--off)">Start 950 &euro; &middot; Growth 1.900 &euro; &middot; Scale 3.500 &euro;</strong>/lună' (Related 'Vezi și' @( ,@('CMO Extern','/servicii/cmo-extern'); ,@('Toate serviciile','/servicii') )))
}

# ---- SERVICII PE CANALE (Google Ads, Facebook Ads) ----
$pages += @{
  path='servicii/google-ads'
  title='Agenție Google Ads București: administrare campanii | AMPLIO'
  desc='Agenție Google Ads pentru firme din România: campanii pe căutări cu intenție de cumpărare, tracking verificat și raport pe cereri. De la 450 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Google Ads','/servicii/google-ads') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Administrare Google Ads","serviceType":"Administrare campanii Google Ads","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"450"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Cât buget minim îmi trebuie pentru Google Ads?","acceptedAnswer":{"@type":"Answer","text":"Nu există o sumă fixă: depinde de cât costă un clic în domeniul tău și de câte cereri vrei. Bugetul trebuie să aducă destule clicuri ca să ai date de optimizat; îl calculăm împreună din costul pe clic și din rata de conversie a site-ului."}},{"@type":"Question","name":"În cât timp apar primele cereri?","acceptedAnswer":{"@type":"Answer","text":"De obicei în primele săptămâni după lansare, dacă există cerere pe frazele tale și pagina de destinație e bună. Prima lună servește și ca să aflăm ce funcționează."}},{"@type":"Question","name":"Contul de Google Ads e al meu?","acceptedAnswer":{"@type":"Answer","text":"Da. Contul e pe firma ta, iar bugetul de reclame se plătește din el, direct către Google. Dacă pleci, contul și tot istoricul rămân la tine."}},{"@type":"Question","name":"Preluați și un cont care rulează deja?","acceptedAnswer":{"@type":"Answer","text":"Da. Îl auditam întâi și păstrăm ce funcționează. Nu reconstruim totul de la zero doar ca să avem ce raporta."}},{"@type":"Question","name":"Faceți și paginile de destinație?","acceptedAnswer":{"@type":"Answer","text":"Da, prin serviciul de landing pages și optimizarea conversiei. Un anunț bun care trimite pe o pagină slabă înseamnă bani pierduți."}},{"@type":"Question","name":"Google Ads sau Facebook Ads?","acceptedAnswer":{"@type":"Answer","text":"Google Ads prinde cererea existentă: oameni care caută deja. Facebook și Instagram creează cerere: oameni care încă nu caută. Dacă clienții te caută deja, începem cu Google Ads."}}]}]}'
  extra=(Articole @( ,@('Cât costă Google Ads în România în 2026','/blog/cost-google-ads-romania/'); ,@('7 greșeli care îți ard bugetul de Google Ads','/blog/greseli-buget-google-ads/'); ,@('Google Ads vs Meta Ads: cu care începi?','/blog/google-ads-vs-meta-ads/') ))
  body=@"
<section class="subhero">
  <div class="grid-bg"></div>
  <div class="wrap">
    $(CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Google Ads','/servicii/google-ads') ))
    <span class="eyebrow">Serviciu &middot; Google Ads</span>
    <h1>Agenție Google Ads: <span class="g">campanii care aduc cereri, nu doar clicuri.</span></h1>
    <p class="lead">Administrăm campanii de Google Ads pentru firme din România: pe căutările cu intenție de cumpărare, cu tracking verificat înainte de primul leu cheltuit și cu raport pe cereri și vânzări. Contul rămâne al tău.</p>
    <div class="hero-cta" style="margin-top:30px">
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
      <a class="btn btn-ghost" href="/calculator-investitie/">Calculează investiția</a>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Când are sens Google Ads</h2>
        <p class="lead" style="margin-bottom:18px">Google Ads te pune în fața oamenilor exact când caută ce vinzi: „firmă de curățenie birouri”, „contabil București”, „implant dentar preț”. Cererea există deja; trebuie doar să fii tu cel pe care îl aleg.</p>
        <p style="margin-bottom:18px">Spre deosebire de SEO, aduce cereri din primele săptămâni. În schimb, plătești fiecare clic, așa că rezultatul depinde de trei lucruri: pe ce fraze apari, ce promite anunțul și ce găsește omul după clic.</p>
        <p>Merge cel mai bine pentru servicii căutate activ, pentru magazine online cu produse căutate după nume sau categorie și pentru firmele B2B care vând contracte de valoare. Dacă produsul tău trebuie mai întâi arătat, începem de obicei cu <a href="/servicii/facebook-ads/" style="color:var(--sky)">Facebook și Instagram Ads</a>.</p>
      </div>
      <div class="panelcard">
        <h3>Ce primești</h3>
        <ul class="flist">
          <li><b>Audit al contului</b> existent sau structură nouă, pe intenții de căutare</li>
          <li><b>Tracking de conversii</b> verificat cu teste reale, în GA4 și Google Ads</li>
          <li><b>Cuvinte cheie și cuvinte negative</b> gestionate săptămânal</li>
          <li><b>Anunțuri testate constant</b>, scrise cu AI și verificate de oameni</li>
          <li><b>Pagina de destinație</b> verificată sau construită pentru campanie</li>
          <li><b>Raport lunar</b> pe cereri, cost pe client și venit</li>
          <li><b>Contul rămâne al tău</b>, cu acces complet</li>
        </ul>
        <p class="price" style="margin-top:22px;font-size:15px">De la <strong style="color:var(--off)">450 &euro;/lună</strong> sau % din bugetul de reclame</p>
      </div>
    </div>
  </div>
</section>

<section class="bg-2">
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Ce campanii facem</h2>
      <p class="lead">Alegem tipul de campanie după obiectiv și după datele pe care le ai, nu după ce e la modă.</p>
    </div>
    <div class="svc-grid">
      <div class="svc"><h3>Căutare</h3><p>Anunțuri text la frazele cu intenție de cumpărare. Baza oricărui cont și locul unde controlezi cel mai bine pe ce plătești.</p></div>
      <div class="svc"><h3>Performance Max</h3><p>Campanii automate pe toate rețelele Google: căutare, YouTube, Display, Gmail și Maps. Le pornim când contul are destule conversii din care să învețe.</p></div>
      <div class="svc"><h3>Shopping</h3><p>Pentru magazine online: produsele, cu poză și preț, direct în rezultatele Google, din feedul magazinului.</p></div>
      <div class="svc"><h3>Campanii locale</h3><p>Pentru firmele cu clienți din zonă: anunțuri cu adresă, apel direct și indicații spre locație.</p></div>
      <div class="svc"><h3>Remarketing</h3><p>Readucem vizitatorii care n-au cerut încă o ofertă, cu un mesaj potrivit pasului la care au rămas.</p></div>
      <div class="svc"><h3>YouTube</h3><p>Când ai clipuri bune, le folosim pentru remarketing și notorietate. Filmările le coordonăm prin rețeaua noastră de parteneri.</p></div>
    </div>
  </div>
</section>

<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Cât costă Google Ads</h2>
      <p class="lead">Sunt două costuri: bugetul de reclame, plătit direct către Google din contul tău, și administrarea. Bugetul depinde de cât costă un clic în domeniul tău, așa că pornim de la date reale, nu de la o sumă fixă.</p>
    </div>
    <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px;margin-top:40px">Cât costă un clic: exemple reale</h3>
    <table class="cmp">
      <thead><tr><th>Fraza căutată</th><th>Căutări pe lună</th><th>Licitare pentru primele poziții</th></tr></thead>
      <tbody>
        <tr><td>firmă curățenie București</td><td>1.000-10.000</td><td>3,69-11,39 lei</td></tr>
        <tr><td>curățenie birouri București</td><td>100-1.000</td><td>4,52-23,30 lei</td></tr>
        <tr><td>contabilitate București</td><td>100-1.000</td><td>5,15-20,25 lei</td></tr>
        <tr><td>contabilitate online</td><td>100-1.000</td><td>4,24-24,84 lei</td></tr>
        <tr><td>agenție Google Ads</td><td>100-1.000</td><td>8,37-47,72 lei</td></tr>
        <tr><td>promovare site Google</td><td>100-1.000</td><td>15,66-157,26 lei</td></tr>
      </tbody>
    </table>
    <p style="margin-top:14px;font-size:13.5px;color:var(--txt-dim)">Sursa: Google Keyword Planner, România, septembrie 2025 - august 2026. Intervalul arată cât licitează firmele ca să apară în partea de sus a paginii; costul real pe clic depinde și de calitatea anunțului și a paginii.</p>
    <div class="cols2" style="margin-top:40px">
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Cât buget îți trebuie</h3>
        <p style="margin-top:12px">Pornim de la costul unei cereri. Un exemplu: dacă un clic costă în jur de 10 lei și unul din 20 de vizitatori cere o ofertă, o cerere costă în jur de 200 de lei. Pentru 20 de cereri pe lună ai nevoie de aproximativ 4.000 de lei buget. Apoi lucrăm să scadă costul pe cerere: anunțuri mai bune, cuvinte negative, o pagină care convertește mai bine.</p>
      </div>
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Cât costă administrarea</h3>
        <p style="margin-top:12px">Administrarea pornește de la 450 € pe lună sau un procent din bugetul de reclame. Acolo unde are sens, propunem modelul de parteneriat: o taxă fixă redusă și un procent doar din creșterea vânzărilor peste nivelul de pornire semnat. Poți estima totul în <a href="/calculator-investitie/" style="color:var(--sky)">calculatorul de investiție</a> sau citi ghidul <a href="/blog/cost-google-ads-romania/" style="color:var(--sky)">Cât costă Google Ads în România</a>.</p>
      </div>
    </div>
  </div>
</section>

<section class="bg-2">
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Primele 90 de zile</h2>
      <p class="lead">KPI scriși în contract și clauză de ieșire la 90 de zile. Riscul e al nostru, nu al tău.</p>
    </div>
    <div class="tl">
      <div class="tstep"><span class="n">01</span><div class="day">ZILELE 1-14</div><h3>Fundația</h3><p>Accese, auditul contului, tracking de conversii verificat cu teste reale și cifrele de pornire documentate.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">ZILELE 15-30</div><h3>Lansarea</h3><p>Pornim focalizat, pe 1-2 campanii cu intenția cea mai profitabilă, și urmărim primele cereri.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">ZILELE 31-60</div><h3>Optimizarea</h3><p>Săptămânal: termeni de căutare, cuvinte negative, licitări, anunțuri și pagina de destinație.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">ZILELE 61-90</div><h3>Verdictul</h3><p>Comparăm cifrele cu KPI-urile din contract. Le-am atins: extindem. Nu le-am atins: pleci fără penalități.</p></div>
    </div>
  </div>
</section>

<section>
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Ce vezi în raportul lunar</h2>
        <ul class="flist" style="margin-top:18px">
          <li>Cât ai cheltuit și pe ce campanii</li>
          <li>Câte cereri și vânzări au venit și cât a costat fiecare</li>
          <li>Ce fraze aduc clienți și ce fraze am oprit</li>
          <li>Ce am schimbat luna aceasta și ce testăm luna viitoare</li>
        </ul>
        <p style="margin-top:18px">Contul e al tău, cu acces complet: vezi aceleași cifre ca noi, oricând.</p>
      </div>
      <div class="panelcard" style="align-self:start">
        <h3>Google Ads și SEO, împreună</h3>
        <p style="margin-top:10px">Google Ads aduce cereri din prima lună; SEO scade, în timp, costul pe client, pentru că apari și fără să plătești clicul. Frazele care convertesc în Ads ne arată ce pagini merită construite pentru SEO.</p>
        <a class="btn btn-ghost" href="/servicii/seo-geo/" style="margin-top:20px">Vezi serviciile SEO</a>
      </div>
    </div>
  </div>
</section>

<section class="bg-2">
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Greșelile care ard cel mai des bugetul</h2>
        <ul class="flist" style="margin-top:18px">
          <li><b>Fraze largi fără cuvinte negative:</b> plătești clicuri de la oameni care caută altceva.</li>
          <li><b>Conversii nemăsurate sau numărate greșit:</b> Google optimizează pe date false.</li>
          <li><b>Toate anunțurile trimit pe prima pagină,</b> nu pe pagina serviciului căutat.</li>
          <li><b>Un singur grup de anunțuri pentru toate serviciile,</b> cu același mesaj pentru toată lumea.</li>
          <li><b>Performance Max pornit fără date de conversie:</b> bugetul se duce unde e mai ieftin, nu unde sunt clienții.</li>
        </ul>
        <p style="margin-top:18px">Pe larg, în articolul <a href="/blog/greseli-buget-google-ads/" style="color:var(--sky)">7 greșeli care îți ard bugetul de Google Ads</a>.</p>
      </div>
      <div>
        <h2>Pentru cine lucrăm</h2>
        <div style="display:flex;flex-direction:column;gap:14px;margin-top:18px">
          <a class="svc" href="/solutii/marketing-ecommerce/" style="padding:20px 22px"><h3>Magazine online</h3><p>Shopping și Performance Max pe feedul magazinului, cu raport pe ROAS și venit.</p><span class="more">Vezi soluția &rarr;</span></a>
          <a class="svc" href="/solutii/marketing-clinici/" style="padding:20px 22px"><h3>Clinici și servicii locale</h3><p>Căutări cu oraș și urgență, campanii locale și apel direct din anunț.</p><span class="more">Vezi soluția &rarr;</span></a>
          <a class="svc" href="/solutii/marketing-b2b/" style="padding:20px 22px"><h3>Servicii B2B</h3><p>Fraze de nișă, scumpe, cu decizie lungă: măsurăm cererile calificate, nu clicurile.</p><span class="more">Vezi soluția &rarr;</span></a>
        </div>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="wrap rev">
    <div class="sec-head"><h2>Întrebări frecvente despre Google Ads</h2></div>
    <div class="faq">
      <details><summary>Cât buget minim îmi trebuie pentru Google Ads?</summary><p>Nu există o sumă fixă: depinde de cât costă un clic în domeniul tău și de câte cereri vrei. Bugetul trebuie să aducă destule clicuri ca să ai date de optimizat; îl calculăm împreună din costul pe clic și din rata de conversie a site-ului.</p></details>
      <details><summary>În cât timp apar primele cereri?</summary><p>De obicei în primele săptămâni după lansare, dacă există cerere pe frazele tale și pagina de destinație e bună. Prima lună servește și ca să aflăm ce funcționează.</p></details>
      <details><summary>Contul de Google Ads e al meu?</summary><p>Da. Contul e pe firma ta, iar bugetul de reclame se plătește din el, direct către Google. Dacă pleci, contul și tot istoricul rămân la tine.</p></details>
      <details><summary>Preluați și un cont care rulează deja?</summary><p>Da. Îl auditam întâi și păstrăm ce funcționează. Nu reconstruim totul de la zero doar ca să avem ce raporta.</p></details>
      <details><summary>Faceți și paginile de destinație?</summary><p>Da, prin serviciul de landing pages și optimizarea conversiei. Un anunț bun care trimite pe o pagină slabă înseamnă bani pierduți. Vezi <a href="/servicii/landing-pages-cro/">Landing pages și CRO</a>.</p></details>
      <details><summary>Google Ads sau Facebook Ads?</summary><p>Google Ads prinde cererea existentă: oameni care caută deja. Facebook și Instagram creează cerere: oameni care încă nu caută. Dacă clienții te caută deja, începem cu Google Ads. Pe larg, în <a href="/blog/google-ads-vs-meta-ads/">Google Ads vs Meta Ads</a>.</p></details>
    </div>
  </div>
</section>

<section>
  <div class="wrap rev">
    <div class="ctaband">
      <h2>Vrei să vezi ce poate aduce Google Ads pentru firma ta?</h2>
      <p class="lead center">Cere auditul gratuit: în 24 de ore primești o analiză a vizibilității tale și primii 3 pași, fără obligații.</p>
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
    </div>
  </div>
</section>
"@
}
$pages += @{
  path='servicii/facebook-ads'
  title='Agenție Facebook Ads: reclame Facebook și Instagram | AMPLIO'
  desc='Agenție Facebook Ads pentru firme din România: reclame pe Facebook și Instagram, creație testată constant și raport pe cereri. De la 450 EUR/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Facebook Ads','/servicii/facebook-ads') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Administrare Facebook Ads","serviceType":"Administrare reclame Facebook și Instagram (Meta Ads)","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"450"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Cât buget îmi trebuie pentru Facebook Ads?","acceptedAnswer":{"@type":"Answer","text":"Cât să aducă, în primele săptămâni, destule cereri ca să vezi ce funcționează. Pornim cu un buget de test, aflăm cât costă o cerere în cazul tău și creștem doar pe ce merge."}},{"@type":"Question","name":"Facebook sau Instagram?","acceptedAnswer":{"@type":"Answer","text":"De obicei amândouă: aceeași campanie rulează pe ambele, iar Meta mută bugetul acolo unde o cerere costă mai puțin. Le separăm doar când publicul sau formatul o cer."}},{"@type":"Question","name":"Faceți voi reclamele, adică pozele și video-urile?","acceptedAnswer":{"@type":"Answer","text":"Da. Textele și grafica le producem noi, cu AI și control uman; pentru filmări și ședințe foto coordonăm partenerii noștri. Tu aprobi fiecare variantă."}},{"@type":"Question","name":"Contul de reclame e al meu?","acceptedAnswer":{"@type":"Answer","text":"Da. Business Manager-ul și contul de reclame sunt pe firma ta, iar bugetul se plătește direct către Meta. Noi lucrăm cu acces de partener."}},{"@type":"Question","name":"Postările obișnuite de pe pagină intră aici?","acceptedAnswer":{"@type":"Answer","text":"Nu. Postările țin de serviciul de social media; aici e vorba de reclame plătite, cu buget și obiectiv de vânzare."}},{"@type":"Question","name":"Faceți și TikTok Ads?","acceptedAnswer":{"@type":"Answer","text":"Da, în cadrul serviciului Performance Ads, când publicul tău e acolo. De obicei pornim însă cu Meta sau Google, unde datele de conversie sunt mai sigure."}}]}]}'
  extra=(Articole @( ,@('Google Ads vs Meta Ads: cu care începi?','/blog/google-ads-vs-meta-ads/'); ,@('De ce conturile de ads trebuie să rămână ale tale','/blog/conturi-ads-proprietate/'); ,@('Marketing pentru magazin online: ghid de creștere a vânzărilor','/blog/marketing-magazin-online/') ))
  body=@"
<section class="subhero">
  <div class="grid-bg"></div>
  <div class="wrap">
    $(CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Facebook Ads','/servicii/facebook-ads') ))
    <span class="eyebrow">Serviciu &middot; Facebook Ads</span>
    <h1>Agenție Facebook Ads: <span class="g">reclame pe Facebook și Instagram, măsurate în vânzări.</span></h1>
    <p class="lead">Administrăm reclamele pe Facebook și Instagram (Meta Ads) pentru firme din România: publicul ales pe date, creație testată constant și tracking corect, cu raport pe cereri și vânzări, nu pe like-uri.</p>
    <div class="hero-cta" style="margin-top:30px">
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
      <a class="btn btn-ghost" href="/calculator-investitie/">Calculează investiția</a>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Când are sens Facebook Ads</h2>
        <p class="lead" style="margin-bottom:18px">Pe Facebook și Instagram oamenii nu caută ce vinzi. Îi găsești tu: după interese, după comportament și după asemănarea cu clienții pe care îi ai deja.</p>
        <p style="margin-bottom:18px">Funcționează cel mai bine când produsul se înțelege dintr-o imagine sau dintr-un video scurt: magazine online, restaurante, imobiliare, clinici, servicii pentru persoane, evenimente. Tot aici readuci oamenii care ți-au vizitat site-ul și n-au decis încă.</p>
        <p>Dacă clienții te caută deja pe Google, începem de obicei cu <a href="/servicii/google-ads/" style="color:var(--sky)">Google Ads</a> și folosim Meta pentru remarketing și notorietate.</p>
      </div>
      <div class="panelcard">
        <h3>Ce primești</h3>
        <ul class="flist">
          <li><b>Strategie de public</b>: clienți actuali, vizitatori, publicuri asemănătoare</li>
          <li><b>Creație pentru feed, Stories și Reels</b>, în mai multe variante, testate constant</li>
          <li><b>Meta Pixel verificat</b> cu teste reale și evenimentele corecte</li>
          <li><b>Campanii pe obiectivul corect</b>: vânzări, cereri sau mesaje</li>
          <li><b>Optimizare săptămânală</b> pe costul pe cerere și pe vânzare</li>
          <li><b>Raport lunar</b> pe cereri, vânzări și cost, nu pe like-uri</li>
          <li><b>Contul de reclame rămâne al tău</b></li>
        </ul>
        <p class="price" style="margin-top:22px;font-size:15px">De la <strong style="color:var(--off)">450 &euro;/lună</strong> sau % din bugetul de reclame</p>
      </div>
    </div>
  </div>
</section>

<section class="bg-2">
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Ce campanii facem</h2>
      <p class="lead">Obiectivul campaniei îi spune lui Meta pe cine să caute. De aceea îl alegem după ce vrei să obții, nu după ce aduce cele mai multe like-uri.</p>
    </div>
    <div class="svc-grid">
      <div class="svc"><h3>Vânzări pe site</h3><p>Pentru magazine online: campanii optimizate pe comenzi, cu catalogul de produse și reclame dinamice pentru cei care au văzut deja un produs.</p></div>
      <div class="svc"><h3>Formulare de cerere</h3><p>Omul își lasă datele direct în Facebook sau Instagram, fără să iasă din aplicație. Potrivit pentru servicii și imobiliare.</p></div>
      <div class="svc"><h3>Mesaje</h3><p>Reclame care deschid o conversație pe WhatsApp, Messenger sau Instagram, pentru firmele care vând prin discuție.</p></div>
      <div class="svc"><h3>Remarketing</h3><p>Readucem oamenii care au vizitat site-ul sau au interacționat cu pagina, cu mesajul potrivit pasului la care au rămas.</p></div>
      <div class="svc"><h3>Notorietate locală</h3><p>Pentru restaurante, clinici și magazine fizice: reclama ajunge de mai multe ori la oamenii din zona ta.</p></div>
      <div class="svc"><h3>Reels și video scurt</h3><p>Format vertical, gândit pentru telefon. Primele două secunde decid dacă reclama e văzută sau sărită.</p></div>
    </div>
  </div>
</section>

<section>
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Creația face diferența</h2>
        <p class="lead" style="margin-bottom:18px">Pe Meta, algoritmul alege publicul tot mai bine singur. Diferența dintre o campanie scumpă și una profitabilă o face reclama: imaginea, primele secunde din video, oferta.</p>
        <p>De aceea producem mai multe variante (imagini, video scurt, texte) și le testăm constant, păstrând ce aduce cereri. Creația o accelerăm cu AI, dar fiecare variantă trece prin control uman și prin vocea brandului tău. Tu aprobi, noi publicăm. Pentru filmări și ședințe foto coordonăm rețeaua noastră de parteneri.</p>
      </div>
      <div>
        <h2>Tracking corect, înainte de buget</h2>
        <p class="lead" style="margin-bottom:18px">Meta optimizează după ce îi raportezi. Dacă Pixelul numără greșit, algoritmul caută oamenii greșiți.</p>
        <p>Verificăm cu teste reale că fiecare cerere și fiecare comandă ajung în contul de reclame, iar unde platforma site-ului permite, adăugăm și Conversions API, ca datele să fie complete.</p>
      </div>
    </div>
  </div>
</section>

<section class="bg-2">
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Cât costă Facebook Ads</h2>
      <p class="lead">Și aici sunt două costuri: bugetul de reclame, plătit direct către Meta din contul tău, și administrarea.</p>
    </div>
    <div class="cols2" style="margin-top:30px">
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Bugetul de reclame</h3>
        <p style="margin-top:12px">Costul reclamelor variază cu publicul, sezonul și calitatea reclamei, așa că nu există un preț pe clic valabil pentru toți. De aceea pornim cu un buget de test, aflăm cât costă o cerere sau o comandă în cazul tău și creștem doar pe ce funcționează.</p>
      </div>
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Administrarea</h3>
        <p style="margin-top:12px">Pornește de la 450 € pe lună sau un procent din bugetul de reclame. Acolo unde are sens, propunem modelul de parteneriat: taxă fixă redusă și un procent doar din creșterea vânzărilor peste nivelul de pornire semnat. Poți estima investiția în <a href="/calculator-investitie/" style="color:var(--sky)">calculator</a>.</p>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Primele 90 de zile</h2>
      <p class="lead">KPI scriși în contract și clauză de ieșire la 90 de zile.</p>
    </div>
    <div class="tl">
      <div class="tstep"><span class="n">01</span><div class="day">ZILELE 1-14</div><h3>Fundația</h3><p>Accese în Business Manager, Pixelul verificat cu teste reale, publicul și cifrele de pornire documentate.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">ZILELE 15-30</div><h3>Testarea</h3><p>Pornim cu 3-5 variante de reclamă pe 1-2 publicuri și aflăm cât costă o cerere.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">ZILELE 31-60</div><h3>Ritmul</h3><p>Creație nouă constant, bugetul mutat pe ce aduce cereri, remarketing pentru cei care n-au decis încă.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">ZILELE 61-90</div><h3>Verdictul</h3><p>Comparăm cifrele cu KPI-urile din contract. Le-am atins: creștem. Nu le-am atins: pleci fără penalități.</p></div>
    </div>
  </div>
</section>

<section class="bg-2">
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Greșelile care ard cel mai des bugetul</h2>
        <ul class="flist" style="margin-top:18px">
          <li><b>Butonul „Promovează postarea”</b> în loc de campanii cu obiectiv de vânzare.</li>
          <li><b>Obiectiv de interacțiune când vrei cereri:</b> Meta îți aduce like-uri, nu clienți.</li>
          <li><b>Aceeași reclamă luni la rând:</b> costul crește pe măsură ce publicul o vede iar și iar.</li>
          <li><b>Pixel lipsă sau greșit:</b> algoritmul nu știe cine cumpără.</li>
          <li><b>Public prea îngust, ales manual:</b> azi algoritmul găsește mai bine oamenii, dacă îi dai date corecte.</li>
        </ul>
        <p style="margin-top:18px">Vezi și <a href="/blog/google-ads-vs-meta-ads/" style="color:var(--sky)">Google Ads vs Meta Ads: cu care începi?</a></p>
      </div>
      <div>
        <h2>Pentru cine lucrăm</h2>
        <div style="display:flex;flex-direction:column;gap:14px;margin-top:18px">
          <a class="svc" href="/solutii/marketing-ecommerce/" style="padding:20px 22px"><h3>Magazine online</h3><p>Vânzări din catalog, reclame dinamice și remarketing pentru coșurile abandonate.</p><span class="more">Vezi soluția &rarr;</span></a>
          <a class="svc" href="/solutii/marketing-horeca/" style="padding:20px 22px"><h3>Restaurante și HoReCa</h3><p>Notorietate locală, oferte pentru zilele slabe și rezervări prin mesaje.</p><span class="more">Vezi soluția &rarr;</span></a>
          <a class="svc" href="/solutii/marketing-imobiliare/" style="padding:20px 22px"><h3>Imobiliare</h3><p>Formulare de cerere pe proiect și remarketing pe ciclul lung de decizie.</p><span class="more">Vezi soluția &rarr;</span></a>
        </div>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="wrap rev">
    <div class="sec-head"><h2>Întrebări frecvente despre Facebook Ads</h2></div>
    <div class="faq">
      <details><summary>Cât buget îmi trebuie pentru Facebook Ads?</summary><p>Cât să aducă, în primele săptămâni, destule cereri ca să vezi ce funcționează. Pornim cu un buget de test, aflăm cât costă o cerere în cazul tău și creștem doar pe ce merge.</p></details>
      <details><summary>Facebook sau Instagram?</summary><p>De obicei amândouă: aceeași campanie rulează pe ambele, iar Meta mută bugetul acolo unde o cerere costă mai puțin. Le separăm doar când publicul sau formatul o cer.</p></details>
      <details><summary>Faceți voi reclamele, adică pozele și video-urile?</summary><p>Da. Textele și grafica le producem noi, cu AI și control uman; pentru filmări și ședințe foto coordonăm partenerii noștri. Tu aprobi fiecare variantă.</p></details>
      <details><summary>Contul de reclame e al meu?</summary><p>Da. Business Manager-ul și contul de reclame sunt pe firma ta, iar bugetul se plătește direct către Meta. Noi lucrăm cu acces de partener.</p></details>
      <details><summary>Postările obișnuite de pe pagină intră aici?</summary><p>Nu. Postările țin de serviciul de social media; aici e vorba de reclame plătite, cu buget și obiectiv de vânzare. Vezi <a href="/servicii/social-media/">Social media</a>.</p></details>
      <details><summary>Faceți și TikTok Ads?</summary><p>Da, în cadrul serviciului Performance Ads, când publicul tău e acolo. De obicei pornim însă cu Meta sau Google, unde datele de conversie sunt mai sigure. Vezi <a href="/servicii/performance-ads/">Performance Ads</a>.</p></details>
    </div>
  </div>
</section>

<section>
  <div class="wrap rev">
    <div class="ctaband">
      <h2>Vrei să afli cât te-ar costa o cerere din Facebook și Instagram?</h2>
      <p class="lead center">Cere auditul gratuit: îți spunem cu ce canal să începi și primii 3 pași, în 24 de ore.</p>
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
    </div>
  </div>
</section>
"@
}

$pages += @{
  path='servicii/geo'
  title='Optimizare GEO: apari în ChatGPT și în AI | AMPLIO'
  desc='Optimizare GEO pentru firme din România: informații clare și surse de încredere, ca ChatGPT, Perplexity și Google AI să te recomande. Se adaugă la SEO.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Optimizare GEO','/servicii/geo') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Optimizare GEO","serviceType":"Generative Engine Optimization (GEO)","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"GEO înlocuiește SEO?","acceptedAnswer":{"@type":"Answer","text":"Nu. Au aceeași fundație: conținut clar și de încredere. De aceea GEO se adaugă la SEO, nu îl înlocuiește."}},{"@type":"Question","name":"Puteți garanta că ChatGPT mă recomandă?","acceptedAnswer":{"@type":"Answer","text":"Nu. Nimeni nu controlează răspunsurile unui model AI. Putem crește șansele, cu informații clare și cu surse care te confirmă, și măsurăm lunar efectul."}},{"@type":"Question","name":"Cât durează până se vede?","acceptedAnswer":{"@type":"Answer","text":"De obicei câteva luni: motoarele AI preiau schimbările cu întârziere, iar sursele externe se construiesc în timp."}},{"@type":"Question","name":"Cum aflu unde sunt acum?","acceptedAnswer":{"@type":"Answer","text":"Fă testul de vizibilitate AI de pe site sau cere auditul gratuit: îți arătăm ce răspund ChatGPT și Perplexity la întrebările clienților tăi."}}]}]}'
  extra=(Articole @( ,@('Ce este GEO? Ghid de optimizare pentru motoarele AI','/blog/ghid-geo/'); ,@('Cum verifici dacă firma ta apare în ChatGPT și în căutarea AI','/blog/verifica-daca-apari-in-ai/'); ,@('Ce este llms.txt și cum îl folosești','/blog/ce-este-llms-txt/') ))
  body=@"
<section class="subhero">
  <div class="grid-bg"></div>
  <div class="wrap">
    $(CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Optimizare GEO','/servicii/geo') ))
    <span class="eyebrow">Serviciu &middot; GEO</span>
    <h1>Optimizare GEO: <span class="g">fii recomandat de ChatGPT și de Google AI.</span></h1>
    <p class="lead">Tot mai mulți clienți întreabă un asistent AI în loc să caute pe Google și primesc un singur răspuns, cu câteva nume. GEO (Generative Engine Optimization) lucrează ca numele tău să fie printre ele.</p>
    <div class="hero-cta" style="margin-top:30px">
      <a class="btn btn-primary" href="/scor-vizibilitate-ai/">Testează-ți scorul AI <span class="ar">&rarr;</span></a>
      <a class="btn btn-ghost" href="/audit-gratuit/">Cere auditul gratuit</a>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Ce este GEO, pe scurt</h2>
        <p class="lead" style="margin-bottom:18px">SEO te aduce în lista de rezultate. GEO te face citat în răspunsul generat: în ChatGPT, Perplexity, Gemini și în rezumatele AI din Google.</p>
        <p style="margin-bottom:18px">Modelele AI recomandă firmele despre care găsesc informații clare, consecvente și confirmate de mai multe surse: site-ul tău, directoare, recenzii, articole. Dacă informația lipsește sau se contrazice, te omit sau te confundă cu altcineva.</p>
        <p>Am văzut asta recent într-un audit: rezumatul AI al Google amesteca o firmă de curățenie din București cu o curățătorie cu nume asemănător din alt oraș. Pentru un client care întreabă, cele două deveniseră aceeași firmă.</p>
      </div>
      <div class="panelcard">
        <h3>Ce primești</h3>
        <ul class="flist">
          <li><b>Test de vizibilitate</b> în ChatGPT, Perplexity și Google AI, cu întrebările clienților tăi</li>
          <li><b>Informații clare despre firmă:</b> pagini care răspund direct la întrebări, date structurate, llms.txt</li>
          <li><b>Aceleași date peste tot:</b> site, fișa Google, directoare, rețele</li>
          <li><b>Prezență în sursele</b> pe care AI-ul le citează: directoare, articole, recenzii</li>
          <li><b>Raport lunar</b> cu mențiunile în AI, pe aceleași întrebări</li>
        </ul>
        <p class="price" style="margin-top:22px;font-size:15px">Se adaugă la <a href="/servicii/seo-geo/" style="color:var(--sky)">serviciul SEO</a></p>
      </div>
    </div>
  </div>
</section>

<section class="bg-2">
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Cum lucrăm</h2>
      <p class="lead">Pornim de la ce răspund azi motoarele AI, nu de la presupuneri.</p>
    </div>
    <div class="tl">
      <div class="tstep"><span class="n">01</span><div class="day">PASUL 1</div><h3>Testul</h3><p>Punem în ChatGPT, Perplexity și Google întrebările pe care le-ar pune clienții tăi și notăm cine e recomandat.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">PASUL 2</div><h3>Fundația</h3><p>Site-ul spune clar cine ești, ce faci și unde: pagini care răspund la întrebări, date structurate, llms.txt.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">PASUL 3</div><h3>Sursele</h3><p>Aceleași date pe fișa Google, în directoare și pe rețele, plus prezență în articolele și listele pe care AI-ul le citește.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">LUNAR</div><h3>Măsurarea</h3><p>Repetăm aceleași întrebări și vedem dacă și unde ești pomenit.</p></div>
    </div>
  </div>
</section>

<section>
  <div class="wrap rev">
    <div class="sec-head"><h2>Întrebări frecvente despre GEO</h2></div>
    <div class="faq">
      <details><summary>GEO înlocuiește SEO?</summary><p>Nu. Au aceeași fundație: conținut clar și de încredere. De aceea GEO se adaugă la SEO, nu îl înlocuiește.</p></details>
      <details><summary>Puteți garanta că ChatGPT mă recomandă?</summary><p>Nu. Nimeni nu controlează răspunsurile unui model AI. Putem crește șansele, cu informații clare și cu surse care te confirmă, și măsurăm lunar efectul.</p></details>
      <details><summary>Cât durează până se vede?</summary><p>De obicei câteva luni: motoarele AI preiau schimbările cu întârziere, iar sursele externe se construiesc în timp.</p></details>
      <details><summary>Cum aflu unde sunt acum?</summary><p>Fă testul de vizibilitate AI de pe site sau cere auditul gratuit: îți arătăm ce răspund ChatGPT și Perplexity la întrebările clienților tăi.</p></details>
    </div>
  </div>
</section>

<section class="bg-2">
  <div class="wrap rev">
    <div class="ctaband">
      <h2>Vezi ce răspunde azi ChatGPT despre domeniul tău.</h2>
      <p class="lead center">Cere auditul gratuit: în 24 de ore primești capturile din motoarele AI și primii 3 pași.</p>
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
    </div>
  </div>
</section>
"@
}

# ---- SOLUTII HUB ----
$pages += @{
  path='solutii'
  title='Soluții de marketing pe industrie | AMPLIO'
  desc='Soluții de marketing digital pe industrie: magazine online, clinici, servicii B2B, HoReCa, producători și export, imobiliare. Vezi ce facem pentru tine.'
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
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-bottom:4px">Alege domeniul tău</h2>
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
  desc='Marketing pentru magazine online: Google Shopping, Meta Ads, email automat și pagini de produs care convertesc, cu raport pe venit și marjă, nu pe clicuri.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('eCommerce','/solutii/marketing-ecommerce') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Marketing pentru magazine online (eCommerce)","serviceType":"Marketing digital","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Lucrați cu Shopify, WooCommerce sau GoMag?","acceptedAnswer":{"@type":"Answer","text":"Da, cu platformele folosite de magazinele din România. Pentru tracking și feeduri verificăm întâi ce permite platforma ta."}},{"@type":"Question","name":"Cât din venit poate veni din email?","acceptedAnswer":{"@type":"Answer","text":"În e-commerce, emailul aduce tipic 20-30% din venit, când fluxurile automate sunt construite corect. Cifra ta depinde de lista de clienți și de cât de des se cumpără."}},{"@type":"Question","name":"Ce înseamnă modelul de parteneriat pentru un magazin?","acceptedAnswer":{"@type":"Answer","text":"O taxă fixă redusă și un procent doar din creșterea vânzărilor peste nivelul de pornire semnat. Plătești mai mult doar dacă vinzi mai mult."}}]}]}'
  extra=@"
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>De ce e diferit marketingul pentru un magazin online</h2>
      <p class="lead">La un magazin online, fiecare leu de reclamă se vede în comenzi. Problema nu e lipsa datelor, ci faptul că sunt împrăștiate: Google Ads raportează un ROAS, Meta altul, iar contabilitatea vede altă cifră. Pornim de la venitul real și de la marja pe produs, apoi decidem unde merită pus bugetul.</p>
    </div>
    <div class="cols2" style="margin-top:40px">
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Problemele tipice</h3>
        <ul class="flist" style="margin-top:16px">
          <li><b>ROAS în scădere:</b> costurile de reclamă cresc mai repede decât vânzările, iar nimeni nu își asumă cifra.</li>
          <li><b>Coșuri abandonate fără urmă:</b> fără fluxuri de email, clienții care au pus produse în coș nu mai sunt contactați.</li>
          <li><b>Pagini de produs care nu convertesc:</b> trafic plătit trimis pe pagini lente, fără recenzii sau fără informațiile care decid cumpărarea.</li>
          <li><b>Dependență de un singur canal:</b> tot venitul vine din reclame, iar SEO și emailul lipsesc.</li>
        </ul>
      </div>
      <div class="panelcard" style="align-self:start">
        <h3>Ce măsurăm</h3>
        <ul class="flist">
          <li>Venitul și marja din fiecare canal</li>
          <li>ROAS-ul și costul pe comandă</li>
          <li>Venitul adus de email</li>
          <li>Rata de conversie a paginilor de produs</li>
        </ul>
        <p style="margin-top:16px;font-size:14.5px">KPI-urile intră în contract, cu clauză de ieșire la 90 de zile.</p>
      </div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Primele 90 de zile</h2>
    <div class="tl" style="margin-top:28px">
      <div class="tstep"><span class="n">01</span><div class="day">ZILELE 1-14</div><h3>Fundația</h3><p>Accese, tracking de comenzi verificat cu teste reale, feedul de produse și cifrele de pornire: venit, marjă, ROAS.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">ZILELE 15-30</div><h3>Primul câștig</h3><p>Shopping și remarketing pe produsele cu marjă bună, plus fluxul pentru coșurile abandonate.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">ZILELE 31-60</div><h3>Ritmul</h3><p>Optimizare săptămânală pe ROAS, creație nouă pe Meta și teste pe paginile de produs care vând cel mai mult.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">ZILELE 61-90</div><h3>Verdictul</h3><p>Comparăm venitul și marja cu KPI-urile din contract și decidem unde crește bugetul.</p></div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px;margin-bottom:4px">Canalele potrivite</h2>
    <div class="svc-grid">
      <a class="svc" href="/servicii/google-ads/"><h3>Google Ads</h3><p>Shopping și Performance Max pe feedul magazinului, pentru cei care caută deja produsul.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/facebook-ads/"><h3>Facebook Ads</h3><p>Catalog, reclame dinamice și remarketing pentru cei care au văzut un produs.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/email-automatizari/"><h3>Email și automatizări</h3><p>Bun venit, coș abandonat, reactivare: venit fără cost pe clic.</p><span class="more">Vezi serviciul &rarr;</span></a>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Întrebări frecvente</h2>
    <div class="faq">
      <details><summary>Lucrați cu Shopify, WooCommerce sau GoMag?</summary><p>Da, cu platformele folosite de magazinele din România. Pentru tracking și feeduri verificăm întâi ce permite platforma ta.</p></details>
      <details><summary>Cât din venit poate veni din email?</summary><p>În e-commerce, emailul aduce tipic 20-30% din venit, când fluxurile automate sunt construite corect. Cifra ta depinde de lista de clienți și de cât de des se cumpără.</p></details>
      <details><summary>Ce înseamnă modelul de parteneriat pentru un magazin?</summary><p>O taxă fixă redusă și un procent doar din creșterea vânzărilor peste nivelul de pornire semnat. Plătești mai mult doar dacă vinzi mai mult.</p></details>
    </div>
  </div>
</section>
"@
  body=(SolBody 'Soluție &middot; eCommerce' 'Marketing pentru' 'magazine online.' 'Costurile de ads cresc, ROAS-ul scade și nimeni nu-și asumă cifra. Noi raportăm pe venit, construim fluxuri de email care vând singure și optimizăm paginile de produs.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('eCommerce','/solutii/marketing-ecommerce') )) '&bdquo;Costurile de ads cresc, ROAS-ul scade și nimeni nu-și asumă cifra de vânzări.&rdquo;' @('Administrare Google, Meta și TikTok cu raport pe ROAS și venit, nu pe afișări','Email &amp; automatizări care aduc 20-30% din venit (coș abandonat, reactivare)','CRO pe paginile de produs: același trafic, mai multe comenzi','Modelul de parteneriat: fee redus + procent doar din creșterea peste nivelul tău actual') '5-10%' 'din creșterea vânzărilor. Atât luăm peste fee-ul redus. Dacă nu crești, nu plătești procentul.' (Related 'Servicii folosite' @( ,@('Performance Ads','/servicii/performance-ads'); ,@('Email &amp; Automatizări','/servicii/email-automatizari'); ,@('Landing &amp; CRO','/servicii/landing-pages-cro') )))
}
$pages += @{
  path='solutii/marketing-clinici'
  title='Marketing pentru clinici și cabinete medicale | AMPLIO'
  desc='Marketing pentru clinici și cabinete medicale: Google Ads local, fișa Google, recenzii și SEO pe proceduri, cu raport pe programări confirmate.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Clinici','/solutii/marketing-clinici') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Marketing pentru clinici și cabinete medicale","serviceType":"Marketing digital","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Țineți cont de regulile pentru publicitatea medicală?","acceptedAnswer":{"@type":"Answer","text":"Da. Nu promitem rezultate medicale și nu folosim mesaje alarmiste, iar orice text medical îl aprobă clinica înainte de publicare."}},{"@type":"Question","name":"Cum creșteți numărul de recenzii?","acceptedAnswer":{"@type":"Answer","text":"Cu o cerere scurtă, trimisă după vizită, cu linkul direct spre fișa Google. Fără recenzii cumpărate sau scrise de noi."}},{"@type":"Question","name":"Lucrați și cu cabinete mici?","acceptedAnswer":{"@type":"Answer","text":"Da, inclusiv cu cabinete cu un singur medic. Pentru ele pornim de obicei cu fișa Google, recenziile și câteva pagini pe proceduri."}}]}]}'
  extra=@"
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>De ce e diferit marketingul pentru o clinică</h2>
      <p class="lead">Pacienții aleg o clinică pe încredere: recenzii, medici, cât de ușor faci o programare. Reclamele agresive fac mai mult rău decât bine. Lucrăm pe tonul sobru pe care îl cere domeniul medical și măsurăm în programări confirmate, nu în clicuri.</p>
    </div>
    <div class="cols2" style="margin-top:40px">
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Problemele tipice</h3>
        <ul class="flist" style="margin-top:16px">
          <li><b>Puține recenzii față de concurenți:</b> chiar cu cea mai bună notă, clinica apare după cele cu mai multe recenzii.</li>
          <li><b>Invizibilă în ChatGPT:</b> pacienții întreabă un asistent AI ce clinică să aleagă și primesc alte nume.</li>
          <li><b>Programări pierdute pe drum:</b> telefoane la care nu răspunde nimeni, formulare fără confirmare.</li>
          <li><b>Pagini prea generale:</b> o singură pagină de servicii în loc de pagini pe proceduri, acolo unde un pacient valorează mult.</li>
        </ul>
      </div>
      <div class="panelcard" style="align-self:start">
        <h3>Ce măsurăm</h3>
        <ul class="flist">
          <li>Programările confirmate, nu doar cererile</li>
          <li>Costul pe pacient nou</li>
          <li>Recenziile noi pe lună</li>
          <li>Pozițiile pe procedurile importante</li>
        </ul>
        <p style="margin-top:16px;font-size:14.5px">KPI-urile intră în contract, cu clauză de ieșire la 90 de zile.</p>
      </div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Primele 90 de zile</h2>
    <div class="tl" style="margin-top:28px">
      <div class="tstep"><span class="n">01</span><div class="day">ZILELE 1-14</div><h3>Fundația</h3><p>Fișa Google pusă la punct, tracking pe programări și apeluri, cifrele de pornire documentate.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">ZILELE 15-30</div><h3>Primul câștig</h3><p>Campanii locale pe 2-3 proceduri importante și primele cereri de recenzie după vizită.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">ZILELE 31-60</div><h3>Ritmul</h3><p>Pagini noi pe proceduri și optimizare săptămânală pe costul pe programare.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">ZILELE 61-90</div><h3>Verdictul</h3><p>Comparăm programările confirmate și costul pe pacient nou cu KPI-urile din contract.</p></div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px;margin-bottom:4px">Canalele potrivite</h2>
    <div class="svc-grid">
      <a class="svc" href="/servicii/google-ads/"><h3>Google Ads</h3><p>Căutări cu oraș și procedură, anunțuri cu apel direct și programare.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/seo-geo/"><h3>SEO și GEO</h3><p>Pagini pe proceduri, SEO local și prezența în recomandările AI.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/landing-pages-cro/"><h3>Landing pages și CRO</h3><p>Pagini de programare simple, care funcționează pe telefon.</p><span class="more">Vezi serviciul &rarr;</span></a>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Întrebări frecvente</h2>
    <div class="faq">
      <details><summary>Țineți cont de regulile pentru publicitatea medicală?</summary><p>Da. Nu promitem rezultate medicale și nu folosim mesaje alarmiste, iar orice text medical îl aprobă clinica înainte de publicare.</p></details>
      <details><summary>Cum creșteți numărul de recenzii?</summary><p>Cu o cerere scurtă, trimisă după vizită, cu linkul direct spre fișa Google. Fără recenzii cumpărate sau scrise de noi.</p></details>
      <details><summary>Lucrați și cu cabinete mici?</summary><p>Da, inclusiv cu cabinete cu un singur medic. Pentru ele pornim de obicei cu fișa Google, recenziile și câteva pagini pe proceduri.</p></details>
    </div>
  </div>
</section>
"@
  body=(SolBody 'Soluție &middot; Clinici medicale' 'Marketing pentru' 'clinici medicale.' 'Vrei calendarul plin cu pacienții potriviți, fără să pari o clinică cu reclame agresive. Ads local, Google Business și SEO/GEO, cu raport în programări confirmate.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Clinici','/solutii/marketing-clinici') )) '&bdquo;Vreau calendarul plin cu pacienții potriviți, fără să par o clinică cu reclame agresive.&rdquo;' @('Google Ads local + profil Google Business optimizat: pacienți din zona ta, când caută','SEO + GEO: când cineva întreabă ChatGPT cea mai bună clinică din zonă, să apari tu','Raportare în programări confirmate și cost per pacient nou, nu în like-uri','Marketing la standardul actului tău medical: sobru, profesionist, discret') '50%' 'dintre pacienți încep să caute prin AI și Google. Îți arătăm gratuit cum apari acum față de 3 competitori.' (Related 'Servicii folosite' @( ,@('SEO + GEO','/servicii/seo-geo'); ,@('Performance Ads','/servicii/performance-ads'); ,@('Landing &amp; CRO','/servicii/landing-pages-cro') )))
}
$pages += @{
  path='solutii/marketing-b2b'
  title='Marketing pentru servicii B2B | AMPLIO'
  desc='Marketing pentru firme de servicii B2B: lead-uri calificate după o definiție semnată în contract, SEO pe nișă, Google Ads și strategie de CMO extern.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Servicii B2B','/solutii/marketing-b2b') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Marketing pentru servicii B2B","serviceType":"Marketing digital","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Ce este un lead calificat?","acceptedAnswer":{"@type":"Answer","text":"Unul care îndeplinește criteriile stabilite împreună la început: tipul de firmă, mărimea, nevoia, bugetul. Definiția intră în contract, ca să măsurăm același lucru."}},{"@type":"Question","name":"Cât durează până apar primele cereri?","acceptedAnswer":{"@type":"Answer","text":"Din Google Ads, de obicei în primele săptămâni; din SEO și conținut, după câteva luni. Planul le combină pe amândouă."}},{"@type":"Question","name":"Lucrați și pentru piețe externe?","acceptedAnswer":{"@type":"Answer","text":"Da. Pentru producători și firmele care vând în alte țări din UE avem o soluție separată, pe 2-3 piețe alese pe date."}}]}]}'
  extra=@"
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>De ce e diferit marketingul B2B</h2>
      <p class="lead">În B2B, o singură vânzare poate valora cât un an de marketing, dar decizia durează luni și o iau mai mulți oameni. Contează mai puțin volumul de lead-uri și mai mult calitatea lor. De aceea definim împreună ce înseamnă un lead calificat și scriem definiția în contract.</p>
    </div>
    <div class="cols2" style="margin-top:40px">
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Problemele tipice</h3>
        <ul class="flist" style="margin-top:16px">
          <li><b>Creșterea depinde de rețeaua fondatorului:</b> fără un canal care aduce cereri noi, firma crește cât îi cunoaște proprietarul.</li>
          <li><b>Site-ul nu răspunde decidenților:</b> pagini generale, fără industrii, fără exemple, fără prețuri orientative.</li>
          <li><b>Cereri nelucrate:</b> lead-urile vin, dar nu există un sistem care să le urmărească până la ofertă.</li>
          <li><b>Invizibil în căutările de nișă:</b> exact frazele rare și scumpe pe care le caută cumpărătorii serioși.</li>
        </ul>
      </div>
      <div class="panelcard" style="align-self:start">
        <h3>Ce măsurăm</h3>
        <ul class="flist">
          <li>Lead-urile calificate, după definiția din contract</li>
          <li>Costul pe lead calificat</li>
          <li>Ofertele trimise și valoarea lor</li>
          <li>Durata de la cerere la contract</li>
        </ul>
        <p style="margin-top:16px;font-size:14.5px">KPI-urile intră în contract, cu clauză de ieșire la 90 de zile.</p>
      </div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Primele 90 de zile</h2>
    <div class="tl" style="margin-top:28px">
      <div class="tstep"><span class="n">01</span><div class="day">ZILELE 1-14</div><h3>Fundația</h3><p>Definiția lead-ului calificat, semnată; tracking pe cereri și cifrele de pornire.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">ZILELE 15-30</div><h3>Primul câștig</h3><p>Google Ads pe frazele de nișă și primele pagini pe servicii și industrii.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">ZILELE 31-60</div><h3>Ritmul</h3><p>Articole pentru decidenți, optimizare pe costul pe lead calificat, cererile urmărite până la ofertă.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">ZILELE 61-90</div><h3>Verdictul</h3><p>Comparăm lead-urile calificate și ofertele trimise cu KPI-urile din contract.</p></div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px;margin-bottom:4px">Canalele potrivite</h2>
    <div class="svc-grid">
      <a class="svc" href="/servicii/seo-geo/"><h3>SEO și GEO</h3><p>Pagini pe servicii și industrii, articole pentru decidenți și prezență în recomandările AI.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/google-ads/"><h3>Google Ads</h3><p>Fraze de nișă, scumpe, cu intenție clară: plătim doar pentru căutările relevante.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/cmo-extern/"><h3>CMO extern</h3><p>Strategie și coordonare: clientul ideal, mesajul, canalele și bugetul.</p><span class="more">Vezi serviciul &rarr;</span></a>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Întrebări frecvente</h2>
    <div class="faq">
      <details><summary>Ce este un lead calificat?</summary><p>Unul care îndeplinește criteriile stabilite împreună la început: tipul de firmă, mărimea, nevoia, bugetul. Definiția intră în contract, ca să măsurăm același lucru.</p></details>
      <details><summary>Cât durează până apar primele cereri?</summary><p>Din Google Ads, de obicei în primele săptămâni; din SEO și conținut, după câteva luni. Planul le combină pe amândouă.</p></details>
      <details><summary>Lucrați și pentru piețe externe?</summary><p>Da. Pentru producători și firmele care vând în alte țări din UE avem o soluție separată, pe 2-3 piețe alese pe date.</p></details>
    </div>
  </div>
</section>
"@
  body=(SolBody 'Soluție &middot; Servicii B2B' 'Marketing pentru' 'firme de servicii B2B.' 'Firma crește doar cât rețeaua ta personală de contacte, și asta te sperie. Construim un motor de lead-uri calificate: LinkedIn ABM + SEO/GEO + nurture pe email.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Servicii B2B','/solutii/marketing-b2b') )) '&bdquo;Firma crește doar cât rețeaua mea personală de contacte. Și asta mă sperie.&rdquo;' @('Motor de lead-uri calificate: LinkedIn ABM + SEO/GEO + nurture pe email','Definim împreună lead calificat și îl semnăm în contract. Apoi îl livrăm','CMO Extern: strategie senioră și raport de board lunar, fără costul unui director','Zero postări de dragul postărilor: doar canale care aduc contracte în B2B') '2-3' 'lead-uri calificate pe lună schimbă complet matematica unei firme de servicii. Asta construim.' (Related 'Servicii folosite' @( ,@('SEO + GEO','/servicii/seo-geo'); ,@('CMO Extern','/servicii/cmo-extern'); ,@('Email &amp; Automatizări','/servicii/email-automatizari') )))
}
$pages += @{
  path='solutii/marketing-horeca'
  title='Marketing pentru restaurante și HoReCa | AMPLIO'
  desc='Marketing pentru restaurante și HoReCa: social media care face poftă, reclame locale pentru zilele slabe, fișa Google și rezervări directe.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('HoReCa','/solutii/marketing-horeca') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Marketing pentru restaurante și HoReCa","serviceType":"Marketing digital","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Cât costă pentru un restaurant?","acceptedAnswer":{"@type":"Answer","text":"Pachetele de social media pornesc de la 350 € pe lună; bugetul pentru reclamele locale se stabilește după zonă și obiectiv."}},{"@type":"Question","name":"Lucrați cu influenceri?","acceptedAnswer":{"@type":"Answer","text":"Da, cu micro-influenceri locali și conținut făcut de clienți (UGC), prin rețeaua noastră de parteneri."}},{"@type":"Question","name":"Faceți și fotografiile?","acceptedAnswer":{"@type":"Answer","text":"Pentru ședințe foto și filmări coordonăm partenerii noștri; restul conținutului îl producem noi, iar tu aprobi fiecare postare."}}]}]}'
  extra=@"
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>De ce e diferit marketingul pentru un restaurant</h2>
      <p class="lead">Un restaurant trăiește din ocupare: mesele pline de vineri nu compensează marțea goală. Marketingul bun pentru HoReCa e local, vizual și constant: oamenii din zonă trebuie să te vadă des, cu ceva care le face poftă.</p>
    </div>
    <div class="cols2" style="margin-top:40px">
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Problemele tipice</h3>
        <ul class="flist" style="margin-top:16px">
          <li><b>Zilele slabe:</b> marți și miercuri mesele stau goale, deși produsul e bun.</li>
          <li><b>Fișa Google neîngrijită:</b> program greșit, poze vechi, meniul lipsă, recenzii fără răspuns.</li>
          <li><b>Postări fără ritm:</b> câteva postări bune, apoi luni de pauză.</li>
          <li><b>Dependență de platformele de livrare:</b> comisioane mari și clienți care nu ajung niciodată la tine direct.</li>
        </ul>
      </div>
      <div class="panelcard" style="align-self:start">
        <h3>Ce măsurăm</h3>
        <ul class="flist">
          <li>Rezervările și comenzile directe</li>
          <li>Ocuparea în zilele slabe</li>
          <li>Costul pe rezervare din reclame</li>
          <li>Recenziile și nota de pe Google</li>
        </ul>
        <p style="margin-top:16px;font-size:14.5px">KPI-urile intră în contract, cu clauză de ieșire la 90 de zile.</p>
      </div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Primele 90 de zile</h2>
    <div class="tl" style="margin-top:28px">
      <div class="tstep"><span class="n">01</span><div class="day">ZILELE 1-14</div><h3>Fundația</h3><p>Fișa Google la zi, meniul pe site, tracking pe rezervări și ocuparea de pornire.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">ZILELE 15-30</div><h3>Primul câștig</h3><p>Calendar de postări și primele reclame locale pentru zilele slabe.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">ZILELE 31-60</div><h3>Ritmul</h3><p>Conținut constant, colaborări cu micro-influenceri locali și oferte testate.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">ZILELE 61-90</div><h3>Verdictul</h3><p>Comparăm rezervările și ocuparea din zilele slabe cu KPI-urile din contract.</p></div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px;margin-bottom:4px">Canalele potrivite</h2>
    <div class="svc-grid">
      <a class="svc" href="/servicii/social-media/"><h3>Social media</h3><p>Conținut care face poftă, cu ritm constant, pe Instagram și Facebook.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/facebook-ads/"><h3>Facebook Ads</h3><p>Notorietate locală și oferte pentru zilele slabe, oamenilor din zona ta.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/seo-geo/"><h3>SEO și GEO</h3><p>Fișa Google, meniul pe site și căutările de tipul „restaurant în…”.</p><span class="more">Vezi serviciul &rarr;</span></a>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Întrebări frecvente</h2>
    <div class="faq">
      <details><summary>Cât costă pentru un restaurant?</summary><p>Pachetele de social media pornesc de la 350 € pe lună; bugetul pentru reclamele locale se stabilește după zonă și obiectiv.</p></details>
      <details><summary>Lucrați cu influenceri?</summary><p>Da, cu micro-influenceri locali și conținut făcut de clienți (UGC), prin rețeaua noastră de parteneri.</p></details>
      <details><summary>Faceți și fotografiile?</summary><p>Pentru ședințe foto și filmări coordonăm partenerii noștri; restul conținutului îl producem noi, iar tu aprobi fiecare postare.</p></details>
    </div>
  </div>
</section>
"@
  body=(SolBody 'Soluție &middot; HoReCa' 'Marketing pentru' 'restaurante și ospitalitate.' 'Produsul tău e excelent, dar marțea și miercurea mesele stau goale. Social apetisant, ads local și micro-influenceri care aduc rezultate, nu mese gratis.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('HoReCa','/solutii/marketing-horeca') )) '&bdquo;Produsul meu e excelent, dar marțea și miercurea mesele stau goale.&rdquo;' @('Social media care arată ca produsul tău: apetisant, autentic, constant','Google Business + ads local: apari când localnicii și turiștii caută unde mâncăm','Micro-influenceri și UGC prin rețeaua noastră de parteneri, cu rezultate, nu mese gratis','Pachete fixe de la 350 &euro;/lună: știi exact cât investești') '350 &euro;' 'pe lună. De aici pornește pachetul care îți umple agenda de rezervări și feed-ul de conținut.' (Related 'Servicii folosite' @( ,@('Social Media','/servicii/social-media'); ,@('Performance Ads','/servicii/performance-ads') )))
}
$pages += @{
  path='solutii/marketing-export'
  title='Marketing pentru producători și export UE | AMPLIO'
  desc='Marketing pentru producători și export în UE: site multilingv, SEO și GEO internațional, campanii pe 2-3 piețe alese pe date, plan în etape.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Producători & Export','/solutii/marketing-export') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Marketing pentru producători și export UE","serviceType":"Marketing digital","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"În ce limbi lucrați?","acceptedAnswer":{"@type":"Answer","text":"În limbile piețelor alese. Conținutul pentru fiecare piață e scris sau verificat de vorbitori nativi, nu tradus automat."}},{"@type":"Question","name":"Câte piețe recomandați la început?","acceptedAnswer":{"@type":"Answer","text":"Două sau trei, alese după cerere, concurență și potrivirea cu produsul tău. Extindem după primele contracte."}},{"@type":"Question","name":"Cât durează?","acceptedAnswer":{"@type":"Answer","text":"Planul are de obicei 6-12 luni de la fundație la primele cereri de ofertă externe, cu praguri clare pe drum."}}]}]}'
  extra=@"
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>De ce e diferit marketingul pentru export</h2>
      <p class="lead">Un cumpărător din Germania sau din Franța te caută în limba lui, pe Google-ul lui, și te compară cu furnizori locali. Un site doar în română sau o traducere automată te scot din discuție din primul minut. Pornim cu 2-3 piețe alese pe date și construim prezența acolo, în etape.</p>
    </div>
    <div class="cols2" style="margin-top:40px">
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Problemele tipice</h3>
        <ul class="flist" style="margin-top:16px">
          <li><b>Site doar în română sau tradus automat:</b> cumpărătorul străin nu are încredere și pleacă.</li>
          <li><b>Invizibil în piețele țintă:</b> nicio pagină care să răspundă la ce caută distribuitorii și importatorii.</li>
          <li><b>Prea multe piețe deodată:</b> bugetul se împrăștie și nu apare niciun contract.</li>
          <li><b>Materiale sub nivelul produsului:</b> cataloage și prezentări care nu arată calitatea reală.</li>
        </ul>
      </div>
      <div class="panelcard" style="align-self:start">
        <h3>Ce măsurăm</h3>
        <ul class="flist">
          <li>Cererile de ofertă din fiecare piață</li>
          <li>Vizitele și pozițiile în țările țintă</li>
          <li>Contactele cu distribuitori și importatori</li>
          <li>Pragurile din plan: prima cerere, primul contract</li>
        </ul>
        <p style="margin-top:16px;font-size:14.5px">KPI-urile intră în contract, cu clauză de ieșire la 90 de zile.</p>
      </div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Primele 90 de zile</h2>
    <div class="tl" style="margin-top:28px">
      <div class="tstep"><span class="n">01</span><div class="day">ZILELE 1-14</div><h3>Fundația</h3><p>Alegem 2-3 piețe pe date: cerere, concurență și potrivirea cu produsul tău.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">ZILELE 15-30</div><h3>Primul câștig</h3><p>Paginile în limba primei piețe și primele campanii pe frazele distribuitorilor.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">ZILELE 31-60</div><h3>Ritmul</h3><p>Conținut pentru piețele alese și primele contacte cu distribuitori și importatori.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">ZILELE 61-90</div><h3>Verdictul</h3><p>Verificăm pragurile din plan și decidem ritmul pentru următoarele luni.</p></div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px;margin-bottom:4px">Canalele potrivite</h2>
    <div class="svc-grid">
      <a class="svc" href="/servicii/seo-geo/"><h3>SEO și GEO internațional</h3><p>Site în limbile piețelor, pagini pe piețe și semnalele corecte pentru fiecare țară.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/google-ads/"><h3>Google Ads</h3><p>Campanii pe țări, în limba cumpărătorului, pe frazele distribuitorilor.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/cmo-extern/"><h3>CMO extern</h3><p>Alegerea piețelor și planul în etape, cu praguri măsurabile.</p><span class="more">Vezi serviciul &rarr;</span></a>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Întrebări frecvente</h2>
    <div class="faq">
      <details><summary>În ce limbi lucrați?</summary><p>În limbile piețelor alese. Conținutul pentru fiecare piață e scris sau verificat de vorbitori nativi, nu tradus automat.</p></details>
      <details><summary>Câte piețe recomandați la început?</summary><p>Două sau trei, alese după cerere, concurență și potrivirea cu produsul tău. Extindem după primele contracte.</p></details>
      <details><summary>Cât durează?</summary><p>Planul are de obicei 6-12 luni de la fundație la primele cereri de ofertă externe, cu praguri clare pe drum.</p></details>
    </div>
  </div>
</section>
"@
  body=(SolBody 'Soluție &middot; Producători &amp; Export' 'Marketing pentru' 'producători cu ambiții UE.' 'Produci la nivel european, dar în afara României ești invizibil. Site multilingv, SEO/GEO internațional și campanii pe 2-3 piețe UE selectate strategic, nu peste tot și nicăieri.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Producători & Export','/solutii/marketing-export') )) '&bdquo;Produc la nivel european, dar în afara României sunt invizibil.&rdquo;' @('Site multilingv și materiale de prezentare la standard occidental','SEO/GEO internațional + LinkedIn ABM pe piețele tale țintă','Campanii pe 2-3 piețe UE selectate strategic, nu peste tot și nicăieri','Plan în etape pe 6-12 luni, cu praguri clare: prima cerere de ofertă, primul contract') '6-12' 'luni de la fundație la primele cereri de ofertă externe, cu plan scris și praguri măsurabile.' (Related 'Servicii folosite' @( ,@('SEO + GEO','/servicii/seo-geo'); ,@('CMO Extern','/servicii/cmo-extern'); ,@('Landing &amp; CRO','/servicii/landing-pages-cro') )))
}
$pages += @{
  path='solutii/marketing-imobiliare'
  title='Marketing pentru dezvoltatori imobiliari | AMPLIO'
  desc='Marketing imobiliar pentru dezvoltatori și agenții: pagini de proiect, campanii proprii, urmărirea cumpărătorilor și raport săptămânal pe vânzări.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Imobiliare','/solutii/marketing-imobiliare') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Marketing pentru dezvoltatori imobiliari","serviceType":"Marketing digital","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Lucrați și pentru agenții imobiliare, nu doar pentru dezvoltatori?","acceptedAnswer":{"@type":"Answer","text":"Da. Pentru agenții, accentul cade pe paginile de proprietăți, pe căutările locale și pe încrederea în agenție."}},{"@type":"Question","name":"Cât de des raportați?","acceptedAnswer":{"@type":"Answer","text":"Săptămânal: lead-uri, vizionări și ritmul vânzărilor, pentru că deciziile în imobiliare nu pot aștepta o lună."}},{"@type":"Question","name":"Cum lucrați cu portalurile?","acceptedAnswer":{"@type":"Answer","text":"Nu le înlocuim peste noapte: construim în paralel canalul propriu și mutăm treptat bugetul pe ce aduce cumpărători."}}]}]}'
  extra=@"
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>De ce e diferit marketingul imobiliar</h2>
      <p class="lead">Un apartament nevândut costă în fiecare lună. Portalurile aduc mult trafic, dar și mulți curioși, iar decizia de cumpărare durează luni. Construim un canal propriu: pagina proiectului, campanii care aduc oameni cu buget și intenție, și un sistem care îi ține aproape până la vizionare.</p>
    </div>
    <div class="cols2" style="margin-top:40px">
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Problemele tipice</h3>
        <ul class="flist" style="margin-top:16px">
          <li><b>Dependență de portaluri:</b> plătești pentru o vizibilitate pe care o împarți cu toți concurenții.</li>
          <li><b>Lead-uri reci:</b> mulți cer prețul și dispar; fără urmărire, se pierd.</li>
          <li><b>Pagina proiectului nu vinde:</b> lipsesc planurile, prețurile orientative, zona și stadiul construcției.</li>
          <li><b>Raport lunar, decizii lente:</b> ritmul vânzărilor se schimbă de la o săptămână la alta.</li>
        </ul>
      </div>
      <div class="panelcard" style="align-self:start">
        <h3>Ce măsurăm</h3>
        <ul class="flist">
          <li>Lead-urile calificate și costul lor</li>
          <li>Vizionările programate</li>
          <li>Viteza de absorbție: unități vândute pe lună</li>
          <li>Costul de marketing pe unitate vândută</li>
        </ul>
        <p style="margin-top:16px;font-size:14.5px">KPI-urile intră în contract, cu clauză de ieșire la 90 de zile.</p>
      </div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Primele 90 de zile</h2>
    <div class="tl" style="margin-top:28px">
      <div class="tstep"><span class="n">01</span><div class="day">ZILELE 1-14</div><h3>Fundația</h3><p>Pagina proiectului, tracking pe cereri și vizionări, cifrele de pornire documentate.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">ZILELE 15-30</div><h3>Primul câștig</h3><p>Campanii pe zonă și tip de locuință și primul flux de urmărire pentru cumpărători.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">ZILELE 31-60</div><h3>Ritmul</h3><p>Raport săptămânal, buget mutat pe ce aduce vizionări, remarketing pe ciclul lung de decizie.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">ZILELE 61-90</div><h3>Verdictul</h3><p>Comparăm vizionările și unitățile vândute cu KPI-urile din contract.</p></div>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px;margin-bottom:4px">Canalele potrivite</h2>
    <div class="svc-grid">
      <a class="svc" href="/servicii/google-ads/"><h3>Google Ads</h3><p>Căutări pe zonă și tip de locuință, campanii pe fiecare proiect.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/landing-pages-cro/"><h3>Landing pages și CRO</h3><p>Pagina proiectului: planuri, prețuri orientative, zonă, programare la vizionare.</p><span class="more">Vezi serviciul &rarr;</span></a>
      <a class="svc" href="/servicii/email-automatizari/"><h3>Email și automatizări</h3><p>Urmărirea cumpărătorilor pe ciclul lung de decizie, cu mesaje la momentul potrivit.</p><span class="more">Vezi serviciul &rarr;</span></a>
    </div>
    <h2 style="font-size:clamp(22px,2.6vw,28px);margin-top:56px">Întrebări frecvente</h2>
    <div class="faq">
      <details><summary>Lucrați și pentru agenții imobiliare, nu doar pentru dezvoltatori?</summary><p>Da. Pentru agenții, accentul cade pe paginile de proprietăți, pe căutările locale și pe încrederea în agenție.</p></details>
      <details><summary>Cât de des raportați?</summary><p>Săptămânal: lead-uri, vizionări și ritmul vânzărilor, pentru că deciziile în imobiliare nu pot aștepta o lună.</p></details>
      <details><summary>Cum lucrați cu portalurile?</summary><p>Nu le înlocuim peste noapte: construim în paralel canalul propriu și mutăm treptat bugetul pe ce aduce cumpărători.</p></details>
    </div>
  </div>
</section>
"@
  body=(SolBody 'Soluție &middot; Imobiliare' 'Marketing pentru' 'dezvoltatori imobiliari.' 'Fiecare lună cu apartamente nevândute te costă dobândă. Portalurile îți trimit curioși, nu cumpărători. Landing de proiect, campanii proprii și CRM pe ciclul lung de decizie.' (CrumbsHtml @( ,@('Acasă','/'); ,@('Soluții','/solutii'); ,@('Imobiliare','/solutii/marketing-imobiliare') )) '&bdquo;Portalurile îmi trimit curioși, nu cumpărători.&rdquo;' @('Landing de proiect + campanii proprii: lead-uri calificate la cost controlat, nu chirie pe portaluri','CRM + nurture automat pe ciclul lung de decizie al cumpărătorului','Raport săptămânal: lead-uri, vizionări programate, viteza de absorbție','Bonus per unitate vândută peste ritmul planificat: suntem motivați de viteza ta') '1 lună' 'de vânzare accelerată față de planul tău de absorbție îți plătește tot marketingul proiectului.' (Related 'Servicii folosite' @( ,@('Performance Ads','/servicii/performance-ads'); ,@('Landing &amp; CRO','/servicii/landing-pages-cro'); ,@('Email &amp; Automatizări','/servicii/email-automatizari') )))
}

# ---- DESPRE ----
$pages += @{
  path='despre'
  title='Despre AMPLIO, agenție de marketing digital'
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
        <p style="margin:0"><strong>AMPLIO CREATIVE S.R.L.</strong> · Sediu social: Bd. Dinicu Golescu nr. 7, Sector 1, 010871 București · Nr. Reg. Com. J2026044340009 · CUI 55206491 · operăm în RO + UE · <a href="mailto:contact@amplio.ro">contact@amplio.ro</a> · <a href="tel:+40728151558">0728 151 558</a></p>
      </div>
    </div>
    <div class="rv-block" style="margin-top:56px">
    <div class="sec-head">
      <h2>Recenzii pe Google</h2>
      <p class="lead">Ce spun cei care au lucrat cu echipa AMPLIO.</p>
    </div>
    <div class="rv-grid">
      <figure class="rv"><div class="rv-st" aria-label="5 din 5 stele">★★★★★</div><blockquote>„Multumesc Cristi pentru implicare! Super profesionist si o colaborare foarte buna. Recomand cu incredere!”</blockquote><figcaption><b>Claudiu Vacarus</b>Recenzie pe Google</figcaption></figure>
      <figure class="rv"><div class="rv-st" aria-label="5 din 5 stele">★★★★★</div><blockquote>„A fost o alegerea foarte bună să colaborez cu Amplio, o echipă serioasă bine pregătită cu servicii de excepție.”</blockquote><figcaption><b>Marian Iordache</b>Recenzie pe Google</figcaption></figure>
      <figure class="rv"><div class="rv-st" aria-label="5 din 5 stele">★★★★★</div><blockquote>„Recomand cu încredere, profesionalism și eficiență”</blockquote><figcaption><b>Razvan Nicolae Dumitrescu</b>Recenzie pe Google</figcaption></figure>
    </div>
    <p class="rv-note">Citate exacte, fără corecturi, din recenziile publice de pe <a href="https://www.google.com/maps?cid=16340050891654115703" target="_blank" rel="noopener">profilul AMPLIO de pe Google</a>, unde nota este 5,0 (octombrie 2026). Acolo le găsești pe toate.</p>
  </div>
    <div class="ctaband" style="margin-top:40px">
      <h2>Vrei să vezi cum ar arăta pentru tine?</h2>
      <p class="lead center">Cere auditul gratuit de vizibilitate. În 24 de ore, fără obligații.</p>
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
  desc='Termenii și condițiile de utilizare a site-ului amplio.ro și a serviciilor AMPLIO CREATIVE S.R.L.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Termeni și condiții','/termeni') ))
  jsonld=$null
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Termeni și condiții','/termeni') ))
  <span class="eyebrow">Legal</span><h1>Termeni și condiții</h1></div></section>
<section><div class="wrap rev"><div class="prose">
  <p class="meta">Ultima actualizare: 16 octombrie 2026</p>
  <p>Acești termeni stabilesc regulile de folosire a site-ului amplio.ro și condițiile în care oferim auditul gratuit și uneltele de pe site. Folosind site-ul, accepți acești termeni. Dacă nu ești de acord cu ei, te rugăm să nu folosești site-ul.</p>
  <h2>1. Cine suntem</h2>
  <p>Site-ul amplio.ro este operat de <strong>AMPLIO CREATIVE S.R.L.</strong>, cu sediul social în Bd. Dinicu Golescu nr. 7, Sector 1, 010871 București, înregistrată la Registrul Comerțului cu nr. J2026044340009, cod unic de înregistrare (CUI) 55206491. Ne găsești la <a href="mailto:contact@amplio.ro">contact@amplio.ro</a> și la <a href="tel:+40728151558">0728 151 558</a> (telefon și WhatsApp).</p>
  <p>În acești termeni, „AMPLIO” și „noi” înseamnă AMPLIO CREATIVE S.R.L., iar „tu” înseamnă persoana care folosește site-ul.</p>
  <h2>2. Cui ne adresăm</h2>
  <p>Serviciile AMPLIO sunt destinate firmelor și profesioniștilor. Site-ul poate fi consultat de oricine, dar ofertele, auditul gratuit și contractele se adresează persoanelor care acționează în numele unei afaceri.</p>
  <h2>3. Folosirea site-ului</h2>
  <p>Poți folosi site-ul ca să afli informații despre serviciile noastre, să citești articolele, să folosești uneltele gratuite, să ceri un audit sau să ne contactezi. Nu ai voie:</p>
  <ul>
    <li>să folosești site-ul în scopuri ilegale sau care încalcă drepturile altor persoane;</li>
    <li>să încerci să accesezi fără drept zone, sisteme sau date ale site-ului;</li>
    <li>să perturbi funcționarea site-ului, de exemplu prin trafic automat excesiv;</li>
    <li>să trimiți prin formulare informații false, conținut ofensator sau programe dăunătoare.</li>
  </ul>
  <p>Putem modifica, actualiza sau întrerupe temporar orice parte a site-ului, fără notificare prealabilă.</p>
  <h2>4. Informațiile de pe site</h2>
  <p>Descrierile serviciilor, articolele, ghidurile și exemplele de pe site au caracter informativ. Ne străduim ca ele să fie corecte și actuale, dar nu reprezintă consultanță pentru situația ta concretă. Datele publice citate, de exemplu volumele de căutare sau costurile pe clic din Google Keyword Planner, sunt valabile pentru perioada și sursa indicate în articol și se pot schimba în timp.</p>
  <h2>5. Prețuri, oferte și contracte</h2>
  <ul>
    <li>Prețurile afișate pe site sunt prețuri de pornire, cu caracter orientativ, și nu reprezintă o ofertă fermă.</li>
    <li>Serviciile incluse, prețul final, termenele, indicatorii de performanță (KPI) și condițiile de plată se stabilesc doar prin contract scris și prin anexele lui.</li>
    <li>Bugetele de reclame, adică sumele plătite platformelor de publicitate (de exemplu Google, Meta sau TikTok), nu sunt incluse în prețul serviciilor și se plătesc separat, direct platformelor.</li>
    <li>Modelul de parteneriat, cu taxă fixă redusă și procent din creșterea vânzărilor, se aplică doar dacă este agreat în scris, pe baza unui nivel de pornire documentat și semnat de ambele părți.</li>
    <li>Pilotul de 90 de zile, KPI-urile scrise și clauza de ieșire fără penalități se aplică în condițiile prevăzute în contract.</li>
  </ul>
  <h2>6. Auditul gratuit</h2>
  <ul>
    <li>Auditul gratuit de vizibilitate este o analiză inițială, fără obligație de cumpărare.</li>
    <li>Îl trimitem pe email, de regulă în 24 de ore lucrătoare de la primirea unei cereri complete.</li>
    <li>Ne rezervăm dreptul de a stabili dacă o cerere este eligibilă, de exemplu când datele sunt incomplete sau nu provin de la o afacere reală.</li>
    <li>Auditul se bazează pe informații publice (site-ul tău, rezultatele Google, răspunsurile motoarelor AI, profilul Google Business) și pe datele pe care ni le trimiți. Concluziile și recomandările sunt orientative.</li>
    <li>Poți folosi auditul primit în afacerea ta, chiar dacă nu lucrezi cu noi după aceea.</li>
  </ul>
  <h2>7. Uneltele gratuite</h2>
  <p>Scorul de vizibilitate AI și calculatorul de investiție oferă estimări automate, calculate din răspunsurile tale sau din intervalele de preț afișate. Rezultatele nu sunt oferte și nici garanții. Uneltele nu îți cer date de identificare, iar folosirea lor este măsurată statistic, fără să te identificăm, așa cum explicăm în <a href="/cookies/">politica de cookies</a>.</p>
  <h2>8. Proprietate intelectuală</h2>
  <p>Textele, articolele, ghidurile, numele și logo-ul AMPLIO, elementele grafice și codul site-ului aparțin AMPLIO CREATIVE S.R.L. sau sunt folosite cu drept de utilizare. Nu pot fi copiate, reproduse sau folosite în scop comercial fără acordul nostru scris. Poți cita fragmente scurte din articole, cu menționarea sursei și link către pagina originală.</p>
  <p>Numele și mărcile altor companii (de exemplu Google, Meta, Microsoft sau OpenAI) aparțin proprietarilor lor și sunt menționate doar în scop informativ.</p>
  <h2>9. Recenziile afișate</h2>
  <p>Recenziile de pe site sunt preluate exact, fără corecturi, din profilul public AMPLIO de pe Google și reprezintă opinia autorilor lor.</p>
  <h2>10. Linkuri către alte site-uri</h2>
  <p>Site-ul conține linkuri către site-uri și platforme ale altor companii, de exemplu Google, rețele sociale sau WhatsApp. Nu răspundem pentru conținutul, disponibilitatea sau politicile acestora.</p>
  <h2>11. Limitarea răspunderii</h2>
  <p>Rezultatele de marketing depind de factori pe care nu îi controlăm, cum ar fi piața, concurența, bugetele și regulile platformelor de publicitate. În afara obligațiilor asumate expres prin contract, nu garantăm un anumit rezultat, o anumită poziție în Google sau un anumit număr de clienți.</p>
  <p>În limitele permise de lege, nu răspundem pentru pagubele rezultate din folosirea informațiilor de pe site fără o analiză a situației tale concrete sau din imposibilitatea temporară de a accesa site-ul.</p>
  <h2>12. Date personale și cookie-uri</h2>
  <p>Prelucrăm datele personale conform <a href="/confidentialitate/">politicii de confidențialitate</a> și folosim cookie-uri conform <a href="/cookies/">politicii de cookies</a>.</p>
  <h2>13. Legea aplicabilă și litigii</h2>
  <p>Acești termeni sunt guvernați de legea română. Orice neînțelegere se rezolvă mai întâi pe cale amiabilă. Dacă nu este posibil, litigiul se soluționează de instanțele competente de la sediul AMPLIO CREATIVE S.R.L. din București.</p>
  <h2>14. Modificarea termenilor</h2>
  <p>Putem actualiza acești termeni. Versiunea în vigoare este cea publicată pe această pagină, cu data ultimei actualizări afișată mai sus.</p>
  <h2>15. Contact</h2>
  <p>Pentru orice întrebare legată de acești termeni ne scrii la <a href="mailto:contact@amplio.ro">contact@amplio.ro</a> sau ne suni la <a href="tel:+40728151558">0728 151 558</a>.</p>
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
  <p class="meta">Ultima actualizare: 16 octombrie 2026</p>
  <p>Această politică explică ce date personale prelucrăm când folosești site-ul amplio.ro sau ne contactezi, de ce le prelucrăm, pe ce temei legal, cât timp le păstrăm și ce drepturi ai. Respectăm Regulamentul (UE) 2016/679 privind protecția datelor (GDPR) și legislația română în domeniu.</p>
  <h2>1. Cine prelucrează datele</h2>
  <p>Operatorul datelor este <strong>AMPLIO CREATIVE S.R.L.</strong>, cu sediul social în Bd. Dinicu Golescu nr. 7, Sector 1, 010871 București, înregistrată la Registrul Comerțului cu nr. J2026044340009, CUI 55206491. Pentru orice întrebare despre datele tale ne scrii la <a href="mailto:contact@amplio.ro">contact@amplio.ro</a> sau ne suni la <a href="tel:+40728151558">0728 151 558</a>.</p>
  <h2>2. Ce date prelucrăm</h2>
  <ul>
    <li><strong>Când ceri auditul gratuit:</strong> numele, firma și site-ul, adresa de email, tipul afacerii și, opțional, mesajul tău.</li>
    <li><strong>Când ne scrii prin formularul de contact:</strong> numele, adresa de email, mesajul și, opțional, telefonul și firma.</li>
    <li><strong>Când ne scrii pe email sau pe WhatsApp ori ne suni:</strong> datele pe care ni le transmiți, de exemplu numele, adresa de email, numărul de telefon și conținutul mesajului.</li>
    <li><strong>Când vizitezi site-ul:</strong> date tehnice, precum adresa IP, tipul de browser și de dispozitiv, paginile accesate, data și ora vizitei.</li>
    <li><strong>Când devii client:</strong> datele persoanelor de contact din firmă și datele necesare pentru contract și facturare.</li>
  </ul>
  <p>Nu cerem date sensibile, de exemplu date despre sănătate, și te rugăm să nu le incluzi în mesaje. Site-ul nu se adresează persoanelor sub 16 ani.</p>
  <h2>3. De ce prelucrăm datele și pe ce temei</h2>
  <ul>
    <li><strong>Ca să îți pregătim auditul și să răspundem la mesaje:</strong> demersurile făcute la cererea ta înainte de un eventual contract (art. 6 alin. (1) lit. b) GDPR) și interesul nostru legitim de a răspunde firmelor care ne contactează (art. 6 alin. (1) lit. f) GDPR).</li>
    <li><strong>Ca să încheiem și să executăm contractele:</strong> executarea contractului (lit. b) și, pentru persoanele de contact ale clienților, interesul legitim (lit. f).</li>
    <li><strong>Ca să respectăm obligațiile legale,</strong> de exemplu cele financiar-contabile: obligația legală (lit. c).</li>
    <li><strong>Ca să livrăm site-ul în siguranță și să îl protejăm de abuzuri:</strong> interesul legitim (lit. f).</li>
    <li><strong>Ca să măsurăm, fără cookie-uri, câte vizite și cereri primește site-ul:</strong> interesul legitim (lit. f), explicat la punctul 4.</li>
    <li><strong>Pentru statisticile cu cookie-uri și pentru marketing:</strong> consimțământul tău (lit. a), dat din bannerul de cookie-uri. Îl poți retrage oricând.</li>
    <li><strong>Ca să ne apărăm drepturile în cazul unui litigiu:</strong> interesul legitim (lit. f).</li>
  </ul>
  <p>Te putem contacta ulterior în legătură cu cererea ta și cu serviciile noastre, iar tu poți refuza oricând aceste mesaje. Nu vindem și nu închiriem datele tale.</p>
  <h2>4. Statistici și marketing</h2>
  <p>Folosim Google Analytics 4 în modul de consimțământ Google (Consent Mode). Până îți dai acordul, Google Analytics nu salvează și nu citește cookie-uri pe dispozitivul tău și primește doar semnale fără identificatori, de exemplu că a fost vizualizată o pagină sau că a fost trimis un formular. Google le folosește pentru statistici agregate și estimări.</p>
  <p>Dacă accepți cookie-urile de <strong>statistică</strong>, Google Analytics 4 și Microsoft Clarity folosesc cookie-uri ca să înțelegem cum este folosit site-ul. Clarity înregistrează interacțiunea cu pagina, de exemplu clicurile și derularea, fără textul introdus în formulare. Dacă accepți cookie-urile de <strong>marketing</strong>, Google poate măsura cererile venite din reclamele Google Ads și poate folosi datele pentru reclame personalizate (remarketing). Lista completă a cookie-urilor, cu durata lor, este în <a href="/cookies/">politica de cookies</a>.</p>
  <h2>5. Cui transmitem datele</h2>
  <p>Lucrăm cu furnizori care prelucrează date în numele nostru sau ca operatori independenți, doar cât este necesar pentru scopurile de mai sus:</p>
  <ul>
    <li><strong>FormSubmit</strong> (formsubmit.co): transmite pe adresa noastră de email mesajele trimise prin formularele de pe site;</li>
    <li><strong>Zoho</strong>: furnizorul nostru de email, cu centre de date în Uniunea Europeană;</li>
    <li><strong>Cloudflare</strong>: găzduirea, livrarea și securitatea site-ului;</li>
    <li><strong>Google</strong> (Google Ireland Limited): Google Analytics și, cu acordul tău, Google Ads;</li>
    <li><strong>Microsoft</strong> (Microsoft Ireland Operations Limited): Microsoft Clarity, cu acordul tău;</li>
    <li><strong>WhatsApp</strong> (WhatsApp Ireland Limited), ca operator independent, dacă ne scrii pe WhatsApp;</li>
    <li>contabilul nostru, consultanții juridici și autoritățile publice, atunci când legea o cere.</li>
  </ul>
  <h2>6. Transferuri în afara Uniunii Europene</h2>
  <p>Unii furnizori, de exemplu Google, Microsoft, Cloudflare sau FormSubmit, pot prelucra date și în afara Spațiului Economic European, inclusiv în Statele Unite. În aceste cazuri transferul se face cu garanțiile prevăzute de GDPR: decizia de adecvare a Comisiei Europene pentru companiile certificate în cadrul EU-U.S. Data Privacy Framework sau clauzele contractuale standard aprobate de Comisia Europeană.</p>
  <h2>7. Cât timp păstrăm datele</h2>
  <ul>
    <li>Cererile de audit și mesajele care nu duc la un contract: cel mult 2 ani de la ultima comunicare, apoi le ștergem.</li>
    <li>Datele din contracte și facturi: pe durata contractului și apoi cât cere legislația financiar-contabilă.</li>
    <li>Statisticile din Google Analytics: 14 luni.</li>
    <li>Datele din Microsoft Clarity: pe durata stabilită de Microsoft pentru acest serviciu.</li>
    <li>Datele necesare pentru apărarea unui drept: pe durata termenului legal de prescripție.</li>
  </ul>
  <p>Durata fiecărui cookie este în <a href="/cookies/">politica de cookies</a>.</p>
  <h2>8. Drepturile tale</h2>
  <p>Conform GDPR, ai dreptul:</p>
  <ul>
    <li>să afli dacă îți prelucrăm datele și să primești o copie a lor (dreptul de acces);</li>
    <li>să ceri corectarea datelor greșite sau incomplete (dreptul la rectificare);</li>
    <li>să ceri ștergerea datelor, în condițiile legii (dreptul de a fi uitat);</li>
    <li>să ceri restricționarea prelucrării;</li>
    <li>să primești datele într-un format structurat și să le transmiți altui operator (dreptul la portabilitate);</li>
    <li>să te opui prelucrării bazate pe interesul nostru legitim;</li>
    <li>să îți retragi oricând consimțământul, fără să fie afectată legalitatea prelucrării de până atunci;</li>
    <li>să nu faci obiectul unei decizii bazate exclusiv pe prelucrare automată. Nu luăm astfel de decizii.</li>
  </ul>
  <p>Îți exerciți drepturile scriindu-ne la <a href="mailto:contact@amplio.ro">contact@amplio.ro</a>. Îți răspundem în cel mult o lună de la primirea cererii. Pentru cererile complexe termenul se poate prelungi cu încă două luni, caz în care te anunțăm.</p>
  <p>Ai și dreptul de a depune o plângere la Autoritatea Națională de Supraveghere a Prelucrării Datelor cu Caracter Personal (ANSPDCP), B-dul G-ral. Gheorghe Magheru nr. 28-30, Sector 1, 010336 București, <a href="https://www.dataprotection.ro/" target="_blank" rel="noopener">www.dataprotection.ro</a>.</p>
  <h2>9. Recenziile afișate pe site</h2>
  <p>Pe site afișăm câteva recenzii publice de pe profilul nostru de pe Google, cu numele publicat de autorii lor. Temeiul este interesul nostru legitim de a arăta părerea clienților. Dacă ești autorul unei recenzii și vrei să o scoatem de pe site, scrie-ne și o eliminăm.</p>
  <h2>10. Securitatea datelor</h2>
  <p>Site-ul folosește conexiune criptată (HTTPS) și reguli stricte privind sursele din care se pot încărca scripturi. Accesul la datele tale este limitat la persoanele care au nevoie de ele ca să îți răspundă sau să îți livreze serviciile.</p>
  <h2>11. Modificarea politicii</h2>
  <p>Putem actualiza această politică atunci când se schimbă serviciile, furnizorii sau legislația. Versiunea în vigoare este cea publicată pe această pagină, cu data ultimei actualizări afișată mai sus.</p>
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
  <p class="meta">Ultima actualizare: 16 octombrie 2026</p>
  <p>Cookie-urile sunt fișiere mici pe care un site le salvează în browserul tău. Această politică explică ce cookie-uri și tehnologii similare folosește site-ul amplio.ro, de ce, cât timp și cum îți schimbi alegerea. Se aplică Legea nr. 506/2004 și Regulamentul (UE) 2016/679 (GDPR). Operatorul este AMPLIO CREATIVE S.R.L., cu datele complete în <a href="/confidentialitate/">politica de confidențialitate</a>.</p>
  <h2>Cum funcționează alegerea ta</h2>
  <p>La prima vizită îți arătăm un banner în care alegi <strong>Accept toate</strong>, <strong>Doar necesare</strong> sau <strong>Setări</strong>, unde pornești separat cookie-urile de statistică și pe cele de marketing. Site-ul funcționează complet și fără ele. Îți cerem din nou acordul după 12 luni.</p>
  <h2>1. Strict necesare</h2>
  <p>Nu cer acordul tău, pentru că fără ele site-ul nu poate ține minte alegerea ta și nu poate funcționa în siguranță.</p>
  <ul>
    <li><strong>amplio_consent</strong> (stocare locală în browser): reține alegerea ta privind cookie-urile, timp de 12 luni.</li>
    <li><strong>amplio_lead</strong> (stocare de sesiune): după ce trimiți un formular, ține minte, până închizi fila, că cererea a fost trimisă, ca să o numărăm o singură dată.</li>
    <li><strong>Cookie-uri de securitate Cloudflare</strong> (de exemplu __cf_bm, 30 de minute): pot fi setate de furnizorul nostru de găzduire, doar când e nevoie, ca să protejeze site-ul de traficul automat abuziv.</li>
  </ul>
  <h2>2. Statistică, cu acordul tău</h2>
  <ul>
    <li><strong>Google Analytics 4</strong> (Google Ireland Limited): <strong>_ga</strong> și <strong>_ga_*</strong>, 2 ani. Ne arată, agregat, câte vizite are site-ul, ce pagini sunt citite și ce acțiuni importante au loc, de exemplu trimiterea unui formular. Statisticile se păstrează 14 luni.</li>
    <li><strong>Microsoft Clarity</strong> (Microsoft Ireland Operations Limited): <strong>_clck</strong>, 1 an, și <strong>_clsk</strong>, 1 zi, plus cookie-uri pe domeniul clarity.ms, de exemplu CLID și MUID, 1 an. Ne arată hărți de clicuri și de derulare și înregistrări ale interacțiunii cu pagina. Textul introdus în formulare nu este înregistrat.</li>
  </ul>
  <h2>3. Marketing, cu acordul tău</h2>
  <ul>
    <li><strong>Google Ads</strong> (Google Ireland Limited): <strong>_gcl_au</strong> și <strong>_gcl_aw</strong>, 90 de zile, plus cookie-uri pe domeniile Google, de exemplu IDE pe doubleclick.net, până la 13 luni. Măsoară cererile venite din reclamele Google Ads și permit afișarea reclamelor AMPLIO persoanelor care au vizitat site-ul (remarketing). Se folosesc doar când rulăm campanii Google Ads.</li>
  </ul>
  <h2>4. Măsurarea fără cookie-uri</h2>
  <p>Google Analytics se încarcă pe toate paginile în modul de consimțământ Google (Consent Mode v2). Până îți dai acordul, nu salvează și nu citește cookie-uri și trimite către Google doar semnale fără identificatori, de exemplu că a fost vizualizată o pagină sau că a fost trimis un formular. Google le folosește pentru statistici agregate și estimări. Temeiul este interesul nostru legitim de a ști câte vizite și cereri primește site-ul.</p>
  <h2>5. Cum îți schimbi alegerea</h2>
  <p>Poți reveni oricând asupra alegerii, din butonul de mai jos sau din linkul „Setări cookie-uri” din subsolul fiecărei pagini. Dacă oprești o categorie, ștergem cookie-urile ei din browser.</p>
  <p><button type="button" class="btn btn-ghost" data-cookie-settings>Schimbă setările</button></p>
  <p>Poți bloca sau șterge cookie-urile și din setările browserului (Chrome, Firefox, Safari, Edge). Site-ul rămâne funcțional și fără ele.</p>
  <h2>6. Cookie-urile altor site-uri</h2>
  <p>Când deschizi linkurile spre Facebook, Instagram, LinkedIn, WhatsApp sau Google, acele site-uri își aplică propriile politici de cookies.</p>
  <h2>7. Contact</h2>
  <p>Întrebări despre cookie-uri: <a href="mailto:contact@amplio.ro">contact@amplio.ro</a>.</p>
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
<section><div class="wrap rev"><h2 style="font-size:clamp(22px,2.6vw,28px);margin-bottom:20px">Toate articolele</h2><div class="bloglist">
  <a class="bcard" href="/blog/verifica-daca-apari-in-ai/"><div class="cat">Ghid · GEO</div><h3>Cum verifici dacă firma ta apare în ChatGPT și AI</h3><p>Tutorial pas cu pas: află în 10 minute dacă apari în ChatGPT, Perplexity și Google AI Overviews, și ce faci dacă ești invizibil. Fără cont, fără cost.</p><span class="more">Citește tutorialul &rarr;</span></a>
  <a class="bcard" href="/blog/ghid-geo/"><div class="cat">Ghid · GEO</div><h3>Ce este GEO și cum te optimizezi pentru motoarele AI</h3><p>Ghidul complet despre Generative Engine Optimization: cum ajungi să fii citat de ChatGPT, Perplexity și AI Overviews, nu doar listat în Google.</p><span class="more">Citește ghidul &rarr;</span></a>
  <a class="bcard" href="/blog/geo-vs-seo/"><div class="cat">GEO</div><h3>GEO vs SEO: care e diferența și de ce ai nevoie de ambele</h3><p>Nu sunt în competiție, sunt două straturi ale aceleiași strategii. Explicăm clar diferența și de unde începi.</p><span class="more">Citește articolul &rarr;</span></a>
  <a class="bcard" href="/blog/cum-apari-in-chatgpt/"><div class="cat">GEO</div><h3>Cum apari în ChatGPT cu firma ta</h3><p>Pași concreți ca afacerea ta să fie recomandată când cineva întreabă un asistent AI „cea mai bună firmă din…”.</p><span class="more">Citește articolul &rarr;</span></a>
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
  title='Ghid GEO: optimizare pentru motoarele AI (2026) | AMPLIO'
  desc='Ce este GEO (Generative Engine Optimization), cum diferă de SEO și cum îți optimizezi site-ul ca să fii citat de ChatGPT, Perplexity și AI Overviews.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Ghid GEO','/blog/ghid-geo') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Article","headline":"Ce este GEO? Ghid de optimizare pentru motoarele AI","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18","dateModified":"2026-10-14"},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Cât durează până apare un efect?","acceptedAnswer":{"@type":"Answer","text":"De obicei câteva luni. Motoarele AI preiau schimbările cu întârziere, iar sursele externe care te confirmă, recenzii, directoare, articole, se construiesc în timp."}},{"@type":"Question","name":"GEO înlocuiește SEO?","acceptedAnswer":{"@type":"Answer","text":"Nu. Rezumatele AI și asistenții care caută pe internet se bazează pe pagini pe care le găsesc deja. Un SEO bun e fundația, iar GEO se construiește peste el."}},{"@type":"Question","name":"Merge GEO și pentru o firmă mică, locală?","acceptedAnswer":{"@type":"Answer","text":"Da, uneori chiar mai repede: pentru întrebările locale concurența e mai mică, iar o fișă Google completă, recenziile și câteva pagini clare pot face diferența."}}]}]}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Ghid GEO','/blog/ghid-geo') ))
  <span class="eyebrow">Ghid &middot; GEO</span>
  <h1>Ce este GEO și cum te optimizezi <span class="g">pentru motoarele AI</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: octombrie 2026 &middot; ~10 min de citit</p>
  <p>Timp de 20 de ani, „a fi găsit online” a însemnat un singur lucru: să apari în Google. Asta se schimbă acum. Tot mai mulți oameni pun întrebări direct unui asistent AI, ChatGPT, Perplexity, Google AI Overviews, și primesc un singur răspuns, nu o listă de 10 linkuri. <strong>GEO (Generative Engine Optimization)</strong> este disciplina de a te face vizibil exact în acel răspuns.</p>
  <h2>SEO vs. GEO: care e diferența</h2>
  <p>SEO te ajută să urci în lista de rezultate Google. GEO te ajută să fii <em>citat și recomandat</em> de un model AI atunci când construiește un răspuns. Sunt înrudite, împart aceeași fundație de conținut clar și demn de încredere, dar optimizezi pentru doi „cititori” diferiți: un algoritm de ranking și un model de limbaj.</p>
  <blockquote>Când un client întreabă „care e cea mai bună clinică / agenție / firmă din zona mea?”, AI-ul numește câteva. Dacă nu ești tu acolo, nici nu exiști în acea conversație.</blockquote>
  <h2>De ce contează acum, nu peste 2 ani</h2>
  <p>Aproximativ jumătate dintre căutări încep deja să implice un strat de AI. Cei care își construiesc vizibilitatea AI acum prind un avantaj greu de recuperat mai târziu, exact ca firmele care au prins SEO la început. E mult spațiu liber: foarte puține firme din România lucrează intenționat pe GEO.</p>
  <h2>Cum aleg motoarele AI ce firme recomandă</h2>
  <p>Un asistent AI îmbină ce a învățat la antrenare cu ce găsește pe internet în momentul întrebării. Când recomandă firme, alege numele care apar <strong>clar și consecvent în mai multe surse de încredere</strong>: site-ul firmei, fișa Google, directoare, recenzii, articole și liste de tip „cele mai bune firme de…”.</p>
  <p>Contează la fel de mult și ce nu găsește. Dacă informațiile despre tine lipsesc sau se contrazic, modelul te omite sau te confundă. Am văzut asta recent într-un audit: rezumatul AI al Google amesteca o firmă de curățenie din București cu o curățătorie cu nume asemănător din alt oraș. Pentru un client care întreabă, cele două deveniseră aceeași firmă.</p>
  <h2>Cum te optimizezi pentru GEO: 5 piloni</h2>
  <ul class="flist" style="margin-top:14px">
    <li><b>Conținut structurat și citabil:</b> răspunsuri clare la întrebări reale, în formate pe care AI-ul le poate extrage ușor (definiții, liste, FAQ).</li>
    <li><b>Autoritate și semnale de încredere (E-E-A-T):</b> cine ești, de ce ești credibil, surse și dovezi.</li>
    <li><b>Schema markup:</b> date structurate care explică mașinii ce reprezintă fiecare pagină.</li>
    <li><b>Prezență în surse pe care AI le citează:</b> directoare, recenzii, mențiuni, de acolo își ia AI-ul „părerea”.</li>
    <li><b>llms.txt și conținut agent-readable:</b> un fișier care spune modelelor AI ce ești și ce oferi.</li>
  </ul>
  <h3>Ce faci concret, pe fiecare pilon</h3>
  <p><strong>Conținut citabil.</strong> Scrie pagini care răspund direct la întrebările clienților: ce include serviciul, cât costă, cât durează, pentru cine e potrivit. Pune răspunsul în prima frază, apoi detaliile.</p>
  <p><strong>Încredere.</strong> Arată cine e firma, de când lucrează, unde și pentru cine. Recenziile reale și exemplele de lucrări cântăresc mai mult decât orice adjectiv.</p>
  <p><strong>Date structurate.</strong> Marchează firma, serviciile, articolele și întrebările frecvente, ca mașinile să înțeleagă fără să ghicească ce reprezintă fiecare pagină.</p>
  <p><strong>Surse externe.</strong> Aceleași date (nume, adresă, telefon, servicii) pe fișa Google, în directoare, pe rețele și pe site-urile partenerilor. Fiecare sursă care te confirmă contează.</p>
  <p><strong>llms.txt.</strong> Un rezumat curat al firmei, la rădăcina site-ului. E un pas mic, nu o scurtătură; detalii în ghidul <a href="/blog/ce-este-llms-txt/">ce este llms.txt</a>.</p>
  <h2>Cum măsori vizibilitatea în AI</h2>
  <p>Nu există încă un „Search Console” pentru ChatGPT, așa că măsurarea se face manual, dar sistematic:</p>
  <ol>
    <li>Scrie 10 întrebări pe care le-ar pune clienții tăi: „ce firmă de… îmi recomanzi în…”, „cât costă…”, „cum aleg…”.</li>
    <li>Pune-le lunar în ChatGPT, Perplexity, Gemini și în Google, cu aceleași formulări.</li>
    <li>Notează dacă apari, pe ce loc și ce surse citează răspunsul.</li>
    <li>Compară-te cu 2-3 concurenți și urmărește evoluția de la o lună la alta.</li>
  </ol>
  <p>Pașii detaliați sunt în ghidul <a href="/blog/verifica-daca-apari-in-ai/">cum verifici dacă firma ta apare în ChatGPT</a>.</p>

  <h2>Primii pași pentru o firmă mică</h2>
  <ul>
    <li>Completează fișa Google: categoria corectă, servicii, program, fotografii reale.</li>
    <li>Cere recenzii clienților mulțumiți, constant, nu o dată pe an.</li>
    <li>Fă câte o pagină pentru fiecare serviciu important, cu prețuri orientative și întrebări frecvente.</li>
    <li>Folosește aceleași date de contact peste tot.</li>
    <li>Adaugă datele structurate și fișierul llms.txt.</li>
  </ul>

  <h2>Întrebări frecvente</h2>
  <div class="faq" style="margin-top:10px">
    <details><summary>Cât durează până apare un efect?</summary><p>De obicei câteva luni. Motoarele AI preiau schimbările cu întârziere, iar sursele externe care te confirmă, recenzii, directoare, articole, se construiesc în timp.</p></details>
    <details><summary>GEO înlocuiește SEO?</summary><p>Nu. Rezumatele AI și asistenții care caută pe internet se bazează pe pagini pe care le găsesc deja. Un SEO bun e fundația, iar GEO se construiește peste el.</p></details>
    <details><summary>Merge GEO și pentru o firmă mică, locală?</summary><p>Da, uneori chiar mai repede: pentru întrebările locale concurența e mai mică, iar o fișă Google completă, recenziile și câteva pagini clare pot face diferența.</p></details>
  </div>

  <h2>Primul pas practic</h2>
  <p>Înainte de orice optimizare, măsoară unde ești acum: întreabă ChatGPT și Perplexity despre domeniul tău și vezi dacă apari. Apoi compară-te cu 2-3 competitori. Exact asta facem noi în <a href="/audit-gratuit/">auditul gratuit de vizibilitate</a>.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Vrei să afli cum apari azi în Google și în AI?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a> sau vezi serviciul de <a href="/servicii/geo/">optimizare GEO</a>.</p>
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
  path='blog/cum-apari-in-chatgpt'
  title='Cum apari în ChatGPT cu firma ta (ghid 2026) | AMPLIO'
  desc='Pași concreți ca firma ta să fie recomandată de ChatGPT și alți asistenți AI: conținut citabil, încredere, recenzii și prezență în sursele citate de AI.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cum apari în ChatGPT','/blog/cum-apari-in-chatgpt') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum apari în ChatGPT cu firma ta","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cum apari în ChatGPT','/blog/cum-apari-in-chatgpt') ))
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
  <p>Vrei tot tabloul? Citește <a href="/blog/ghid-geo/">ghidul complet despre GEO</a> sau vezi serviciile de <a href="/servicii/seo-geo/">SEO</a> și <a href="/servicii/geo/">optimizare GEO</a>.</p>
  <div class="key" style="margin-top:30px"><p style="margin:0"><strong>Curios cum apari acum?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a>, îți arătăm cum te văd Google și ChatGPT față de 3 competitori.</p></div>
</article></div></section>
"@
}

# ---- BLOG: post 2 ----
$pages += @{
  path='blog/cost-google-ads-romania'
  title='Cât costă Google Ads în România în 2026 | AMPLIO'
  desc='Cât costă Google Ads în România în 2026: costul pe clic pe domenii, din Keyword Planner, cum calculezi bugetul și cât costă administrarea.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cost Google Ads România','/blog/cost-google-ads-romania') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Article","headline":"Cât costă Google Ads în România în 2026","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18","dateModified":"2026-10-14"},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Care e bugetul minim pentru Google Ads?","acceptedAnswer":{"@type":"Answer","text":"Nu există un minim fix. Bugetul trebuie să aducă destule clicuri și cereri ca să poți vedea ce funcționează; îl calculezi din costul pe clic din domeniul tău și din rata de conversie a site-ului."}},{"@type":"Question","name":"E mai ieftin Facebook Ads?","acceptedAnswer":{"@type":"Answer","text":"Clicul e de obicei mai ieftin pe Facebook și Instagram, dar oamenii nu caută activ ce vinzi, așa că se transformă mai greu în clienți. Contează costul pe client, nu costul pe clic."}},{"@type":"Question","name":"Pot face singur campaniile?","acceptedAnswer":{"@type":"Answer","text":"Da, dacă ai timp să le verifici săptămânal. Cele mai multe bugete se pierd în primele luni din câteva greșeli simple: fraze prea largi, conversii nemăsurate, anunțuri care trimit pe prima pagină."}}]}]}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cost Google Ads România','/blog/cost-google-ads-romania') ))
  <span class="eyebrow">Performance Ads</span>
  <h1>Cât costă Google Ads <span class="g">în România în 2026</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: octombrie 2026 &middot; ~8 min de citit</p>
  <p>„Cât trebuie să investesc în Google Ads?” e prima întrebare a oricărui antreprenor. Răspunsul scurt: depinde de domeniu și de concurență. Răspunsul util e mai jos, cu costuri reale pe clic din Google Keyword Planner și cu un calcul de buget pe care îl poți face singur.</p>

  <h2>Două costuri, nu unul</h2>
  <p>Bugetul pentru Google Ads se împarte în două: <strong>banii pentru reclame</strong>, plătiți direct către Google pentru fiecare clic, și <strong>administrarea</strong>, adică munca celui care construiește și optimizează campaniile. Mulți îl uită pe al doilea și se întreabă apoi de ce reclamele nu merg.</p>
  <p>Există și un al treilea cost, mai puțin vizibil: pagina pe care ajung oamenii după clic și măsurarea corectă a cererilor. Un anunț bun care trimite pe o pagină slabă sau o campanie fără conversii măsurate înseamnă bani pierduți, oricât de mic ar fi costul pe clic.</p>

  <h2>Cât costă un clic în România: exemple reale</h2>
  <p>Tabelul de mai jos arată fraze reale din trei domenii, cu volumul lunar de căutări și cât licitează firmele ca să apară în partea de sus a paginii.</p>
  <table class="cmp">
    <thead><tr><th>Fraza căutată</th><th>Domeniu</th><th>Căutări pe lună</th><th>Licitare pentru primele poziții</th></tr></thead>
    <tbody>
      <tr><td>firmă curățenie București</td><td>Curățenie</td><td>1.000-10.000</td><td>3,69-11,39 lei</td></tr>
      <tr><td>curățenie după constructor</td><td>Curățenie</td><td>100-1.000</td><td>3,01-10,04 lei</td></tr>
      <tr><td>curățenie birouri București</td><td>Curățenie</td><td>100-1.000</td><td>4,52-23,30 lei</td></tr>
      <tr><td>firmă curățenie birouri</td><td>Curățenie</td><td>10-100</td><td>6,99-31,62 lei</td></tr>
      <tr><td>contabil București</td><td>Contabilitate</td><td>100-1.000</td><td>3,82-19,48 lei</td></tr>
      <tr><td>firmă contabilitate</td><td>Contabilitate</td><td>100-1.000</td><td>3,28-13,93 lei</td></tr>
      <tr><td>contabilitate online</td><td>Contabilitate</td><td>100-1.000</td><td>4,24-24,84 lei</td></tr>
      <tr><td>promovare magazin online</td><td>Marketing</td><td>10-100</td><td>6,17-25,08 lei</td></tr>
      <tr><td>agenție Google Ads</td><td>Marketing</td><td>100-1.000</td><td>8,37-47,72 lei</td></tr>
      <tr><td>promovare site Google</td><td>Marketing</td><td>100-1.000</td><td>15,66-157,26 lei</td></tr>
    </tbody>
  </table>
  <p style="font-size:14px;color:var(--txt-dim)">Sursa: Google Keyword Planner, România, septembrie 2025 - august 2026. Costul real pe clic depinde și de calitatea anunțului și a paginii, de oră și de zonă.</p>
  <p>Trei lucruri se văd din tabel:</p>
  <ul>
    <li><strong>În aceeași nișă, prețurile diferă mult.</strong> „Firmă curățenie birouri” se licitează de aproape trei ori mai scump decât „firmă curățenie București”, pentru că cine o caută vrea, de obicei, un contract.</li>
    <li><strong>Frazele generale sunt mai ieftine pe clic,</strong> dar aduc și mulți curioși. Frazele precise costă mai mult, dar convertesc mai bine.</li>
    <li><strong>În servicii pentru firme, un clic poate depăși 100 de lei.</strong> Acolo, fiecare clic irosit doare, iar cuvintele negative și pagina de destinație contează enorm.</li>
  </ul>

  <h2>De ce depinde costul pe clic</h2>
  <ul>
    <li><strong>Câte firme licitează pe aceeași frază.</strong> Mai mulți concurenți înseamnă licitări mai mari.</li>
    <li><strong>Calitatea anunțului și a paginii.</strong> Google dă poziții mai bune, la cost mai mic, anunțurilor relevante care trimit pe pagini bune.</li>
    <li><strong>Zona și ora.</strong> Bucureștiul e de obicei mai scump decât alte orașe, iar unele ore sunt mai disputate decât altele.</li>
    <li><strong>Cum sunt setate frazele.</strong> Fără cuvinte negative, plătești și clicuri de la oameni care caută altceva.</li>
  </ul>

  <h2>Cum calculezi bugetul</h2>
  <p>Nu porni de la o sumă rotundă, ci de la cât te costă o cerere. Calculul are trei pași:</p>
  <ol>
    <li><strong>Costul pe clic</strong> pentru frazele tale, din Keyword Planner sau din primele săptămâni de campanie.</li>
    <li><strong>Rata de conversie</strong> a paginii: din 100 de vizitatori, câți cer o ofertă sau cumpără.</li>
    <li><strong>Costul pe cerere</strong> = costul pe clic împărțit la rata de conversie.</li>
  </ol>
  <p>Un exemplu, cu cifre rotunjite: dacă un clic pe „curățenie birouri București” costă în jur de 15 lei și 5 din 100 de vizitatori cer o ofertă, o cerere costă în jur de 300 de lei. Dacă una din cinci cereri devine contract, un client nou te costă în jur de 1.500 de lei în reclame. Apoi te întrebi: cât valorează un client în primul an?</p>
  <p>Ca să poată fi optimizată, o campanie are nevoie de date: un buget care să aducă cel puțin câteva zeci de cereri pe lună. Sub acest prag, optimizezi „în ceață”.</p>

  <h2>Cât costă administrarea</h2>
  <p>Pe piață întâlnești trei modele: o taxă fixă lunară, un procent din bugetul de reclame sau un model legat de rezultate. La AMPLIO, <a href="/servicii/google-ads/">administrarea Google Ads</a> pornește de la 450 € pe lună sau un procent din bugetul de reclame, iar acolo unde are sens propunem modelul de parteneriat: taxă fixă redusă și un procent doar din creșterea vânzărilor peste nivelul de pornire semnat.</p>
  <p>Orice model ai alege, cere două lucruri: contul de reclame pe numele firmei tale și un raport pe cereri și vânzări, nu pe afișări.</p>

  <h2>Cum să nu arzi banii în primele luni</h2>
  <ul>
    <li><strong>Tracking corect întâi:</strong> nu cheltui un leu până nu măsori corect cererile și vânzările.</li>
    <li><strong>Pornește focalizat:</strong> 1-2 campanii pe intențiile cele mai profitabile, nu „peste tot”.</li>
    <li><strong>Cuvinte negative din prima săptămână:</strong> verifică ce au căutat cei care au dat clic.</li>
    <li><strong>Pagina de destinație contează:</strong> anunț bun plus pagină slabă înseamnă bani pierduți. Vezi <a href="/servicii/landing-pages-cro/">CRO</a>.</li>
    <li><strong>Program și zonă:</strong> rulează reclamele doar unde și când poți prelua clienți.</li>
    <li><strong>Optimizare săptămânală:</strong> campaniile lăsate pe pilot automat se degradează.</li>
  </ul>
  <p>Pe larg, în articolul despre <a href="/blog/greseli-buget-google-ads/">cele 7 greșeli care îți ard bugetul</a>.</p>

  <h2>Întrebări frecvente</h2>
  <div class="faq" style="margin-top:10px">
    <details><summary>Care e bugetul minim pentru Google Ads?</summary><p>Nu există un minim fix. Bugetul trebuie să aducă destule clicuri și cereri ca să poți vedea ce funcționează; îl calculezi din costul pe clic din domeniul tău și din rata de conversie a site-ului.</p></details>
    <details><summary>E mai ieftin Facebook Ads?</summary><p>Clicul e de obicei mai ieftin pe Facebook și Instagram, dar oamenii nu caută activ ce vinzi, așa că se transformă mai greu în clienți. Contează costul pe client, nu costul pe clic.</p></details>
    <details><summary>Pot face singur campaniile?</summary><p>Da, dacă ai timp să le verifici săptămânal. Cele mai multe bugete se pierd în primele luni din câteva greșeli simple: fraze prea largi, conversii nemăsurate, anunțuri care trimit pe prima pagină.</p></details>
  </div>

  <div class="key" style="margin-top:30px"><p style="margin:0"><strong>Vrei o estimare pe cazul tău?</strong> Folosește <a href="/calculator-investitie/">calculatorul de investiție</a> sau cere <a href="/audit-gratuit/">auditul gratuit</a>.</p></div>
</article></div></section>
"@
}

# ---- BLOG: post 3 (tutorial verificare AI) ----
$pages += @{
  path='blog/verifica-daca-apari-in-ai'
  title='Cum verifici dacă firma ta apare în ChatGPT și AI | AMPLIO'
  desc='Tutorial pas cu pas: verifici în 10 minute dacă firma ta apare în ChatGPT, Perplexity și Google AI Overviews și ce faci dacă lipsește. Fără cost.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Verifică vizibilitatea AI','/blog/verifica-daca-apari-in-ai') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum verifici dacă firma ta apare în ChatGPT și în căutarea AI","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
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
    <p style="margin:0"><strong>Vrei să sărim peste verificarea manuală?</strong> În <a href="/audit-gratuit/">auditul gratuit</a> facem noi analiza: cum apari azi în Google și în AI, față de 3 competitori, plus primii 3 pași. În 24 de ore, fără obligații.</p>
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
  title='GEO vs SEO: diferența și de ce ai nevoie de ambele | AMPLIO'
  desc='GEO vs SEO explicat simplu: ce face fiecare, prin ce diferă și de ce ai nevoie de amândouă în 2026. Plus de unde începi dacă pornești de la zero.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('GEO vs SEO','/blog/geo-vs-seo') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"GEO vs SEO: care e diferența și de ce ai nevoie de ambele","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
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
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"7 greșeli care îți ard bugetul de Google Ads","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
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
  <p>Niciuna dintre aceste greșeli nu cere buget în plus, doar disciplină și atenție săptămânală. Despre asta e <a href="/servicii/google-ads/">serviciul nostru de Google Ads</a>: tracking, focus, optimizare săptămânală, raport pe venit.</p>
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
  title='Cum alegi o agenție de marketing: ce întrebări pui | AMPLIO'
  desc='Cum alegi o agenție de marketing în România: întrebările pe care să le pui, semnalele de alarmă și cum recunoști o agenție care își asumă rezultatele.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cum alegi o agenție','/blog/cum-alegi-agentie-marketing') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Article","headline":"Cum alegi o agenție de marketing","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18","dateModified":"2026-10-14"},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Cât costă o agenție de marketing?","acceptedAnswer":{"@type":"Answer","text":"Depinde de canale și de volumul de muncă. Ca reper, la AMPLIO serviciile pornesc de la 250-450 € pe lună pe canal, iar externalizarea completă de la 950 € pe lună. Bugetul de reclame se plătește separat, direct către Google sau Meta."}},{"@type":"Question","name":"În cât timp ar trebui să văd rezultate?","acceptedAnswer":{"@type":"Answer","text":"Din reclame, primele cereri apar de obicei în primele săptămâni; din SEO și conținut, după câteva luni. Un pilot de 90 de zile, cu KPI scriși, îți arată dacă direcția e bună."}},{"@type":"Question","name":"E mai bună o agenție mare sau una mică?","acceptedAnswer":{"@type":"Answer","text":"Contează mai puțin mărimea și mai mult cine lucrează efectiv pe contul tău, cât de des vorbiți și dacă își asumă cifre în contract."}}]}]}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cum alegi o agenție','/blog/cum-alegi-agentie-marketing') ))
  <span class="eyebrow">Ghid</span>
  <h1>Cum alegi o agenție de marketing <span class="g">(și ce întrebări să pui)</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: octombrie 2026 &middot; ~9 min de citit</p>
  <p>Mulți antreprenori au o poveste cu o agenție care a promis mult și a livrat rapoarte cu afișări. Diferența dintre o agenție care îți crește afacerea și una care doar îți consumă bugetul se vede din primele întrebări. Iată ce să întrebi și la ce să fii atent.</p>

  <h2>Întâi: ce vrei de la agenție?</h2>
  <p>Înainte să compari agenții, scrie pe o pagină trei lucruri: <strong>ce vrei să crească</strong> (cereri de ofertă, vânzări online, programări), <strong>cât poți investi lunar</strong>, separat pentru reclame și pentru administrare, și <strong>ce poți face intern</strong> (aprobări, poze, răspuns la cereri).</p>
  <p>Răspunsurile îți spun ce fel de partener cauți: unul care execută un canal (reclame, SEO), unul care pune strategia și coordonează, sau unul care preia tot marketingul.</p>

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

  <h2>Agenție, freelancer sau angajat?</h2>
  <table class="cmp">
    <thead><tr><th></th><th>Freelancer</th><th>Agenție</th><th>Angajat intern</th></tr></thead>
    <tbody>
      <tr><td>Cost</td><td>Cel mai mic</td><td>Mediu</td><td>Cel mai mare: salariu, taxe, unelte</td></tr>
      <tr><td>Acoperire</td><td>De obicei un singur canal</td><td>Mai multe canale, o echipă</td><td>Un om, rar expert pe toate</td></tr>
      <tr><td>Coordonare</td><td>O faci tu</td><td>O face agenția</td><td>O faci tu</td></tr>
      <tr><td>Dacă pleacă</td><td>Rămâi descoperit</td><td>Continuitate prin echipă</td><td>Recrutare și instruire de la zero</td></tr>
      <tr><td>Potrivit când</td><td>Ai o sarcină clară și limitată</td><td>Nu ai departament de marketing</td><td>Marketingul e zilnic și ai volum mare</td></tr>
    </tbody>
  </table>

  <h2>Cum compari ofertele</h2>
  <p>Două oferte cu același preț pot conține lucruri foarte diferite. Pune-le una lângă alta și verifică:</p>
  <ul>
    <li><strong>Ce intră concret:</strong> câte campanii, câte articole, cine face grafica și paginile de destinație.</li>
    <li><strong>Bugetul de reclame e separat?</strong> Unele oferte îl includ, altele nu; compară administrarea cu administrarea.</li>
    <li><strong>Pe ce raportează:</strong> cereri, vânzări și cost pe client, sau afișări și urmăritori.</li>
    <li><strong>Planul pentru primele 90 de zile:</strong> ce se face întâi și când vezi primele cifre.</li>
    <li><strong>Durata contractului și ieșirea:</strong> poți pleca dacă nu se livrează?</li>
  </ul>

  <h2>Ce să ceri în contract</h2>
  <ul>
    <li>KPI-urile și felul în care se măsoară.</li>
    <li>Nivelul de pornire documentat, ca să știți amândoi de unde plecați.</li>
    <li>O clauză de ieșire fără penalități, dacă obiectivele nu sunt atinse.</li>
    <li>Conturile de reclame, Analytics și Search Console pe numele firmei tale.</li>
    <li>Ritmul și conținutul raportului: ce primești, cât de des.</li>
  </ul>

  <h2>Întrebări frecvente</h2>
  <div class="faq" style="margin-top:10px">
    <details><summary>Cât costă o agenție de marketing?</summary><p>Depinde de canale și de volumul de muncă. Ca reper, la AMPLIO serviciile pornesc de la 250-450 € pe lună pe canal, iar externalizarea completă de la 950 € pe lună. Bugetul de reclame se plătește separat, direct către Google sau Meta.</p></details>
    <details><summary>În cât timp ar trebui să văd rezultate?</summary><p>Din reclame, primele cereri apar de obicei în primele săptămâni; din SEO și conținut, după câteva luni. Un pilot de 90 de zile, cu KPI scriși, îți arată dacă direcția e bună.</p></details>
    <details><summary>E mai bună o agenție mare sau una mică?</summary><p>Contează mai puțin mărimea și mai mult cine lucrează efectiv pe contul tău, cât de des vorbiți și dacă își asumă cifre în contract.</p></details>
  </div>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Așa lucrăm noi:</strong> KPI scriși în contract, clauză de ieșire la 90 de zile, conturile rămân ale tale și, unde are sens, plată legată de rezultate. Vezi <a href="/despre/">cum gândim</a>, <a href="/servicii/">serviciile noastre</a> sau cere <a href="/audit-gratuit/">auditul gratuit</a>.</p>
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
  title='llms.txt: ce este, exemplu și cum îl creezi | AMPLIO'
  desc='Ce este llms.txt, ce conține, un exemplu complet și pașii prin care îl creezi pentru site-ul firmei. Ce face și ce nu face pentru vizibilitatea în AI.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Ce este llms.txt','/blog/ce-este-llms-txt') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Article","headline":"llms.txt: ce este, exemplu și cum îl creezi","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18","dateModified":"2026-10-14"},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Trebuie să am un fișier llms.txt?","acceptedAnswer":{"@type":"Answer","text":"Nu e obligatoriu și nu e un factor de clasare în Google. E un pas mic, de jumătate de oră, care ajută modelele și uneltele AI care îl caută să înțeleagă repede cine ești."}},{"@type":"Question","name":"Îl citește ChatGPT?","acceptedAnswer":{"@type":"Answer","text":"Nu toate companiile AI au confirmat public că îl folosesc. De aceea nu ne bazăm doar pe el: vizibilitatea în AI vine în primul rând din conținutul site-ului și din sursele care te confirmă."}},{"@type":"Question","name":"Pot opri motoarele AI să-mi folosească site-ul?","acceptedAnswer":{"@type":"Answer","text":"Da, din robots.txt: fiecare companie AI are roboții ei, de exemplu GPTBot la OpenAI sau Google-Extended la Google. Atenție însă: dacă blochezi roboții care alimentează căutarea AI, scad și șansele să fii recomandat."}},{"@type":"Question","name":"Unde văd un fișier real?","acceptedAnswer":{"@type":"Answer","text":"Multe firme de software publică llms.txt pentru documentație. Al nostru e la amplio.ro/llms.txt, în formatul descris mai sus."}}]}]}'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Ce este llms.txt','/blog/ce-este-llms-txt') ))
  <span class="eyebrow">Ghid &middot; GEO</span>
  <h1>llms.txt: ce este, <span class="g">exemplu și cum îl creezi</span></h1>
</div></section>
<section><div class="wrap rev"><article class="prose">
  <p class="meta">Actualizat: octombrie 2026 &middot; ~8 min de citit</p>
  <p>Tot mai mulți clienți întreabă un asistent AI în loc să caute pe Google. Pentru o firmă apare o întrebare practică: cum îi spui clar unui model de limbaj cine ești și ce oferi, fără să-l lași să ghicească din meniuri, bannere și pagini vechi? Un răspuns simplu este <strong>llms.txt</strong>, un fișier text mic, pus la rădăcina site-ului.</p>
  <p>Mai jos găsești ce este, ce face și ce nu face, un exemplu complet și pașii prin care îl creezi în jumătate de oră.</p>

  <h2>Ce este llms.txt, pe scurt</h2>
  <p>llms.txt este un fișier în format Markdown, publicat la adresa <code>site-ul-tău.ro/llms.txt</code>. A fost propus în 2024 de Jeremy Howard (Answer.AI), pe <a href="https://llmstxt.org" target="_blank" rel="noopener">llmstxt.org</a>, ca o hartă scurtă și curată a celor mai importante informații de pe un site, scrisă pentru modelele de limbaj.</p>
  <p>Seamănă ca idee cu două fișiere pe care probabil le ai deja, dar are alt rol:</p>
  <ul>
    <li><strong>robots.txt</strong> spune roboților ce au voie să acceseze.</li>
    <li><strong>sitemap.xml</strong> listează toate paginile, pentru motoarele de căutare.</li>
    <li><strong>llms.txt</strong> rezumă ce contează: cine ești, ce oferi, unde găsești detaliile.</li>
  </ul>

  <h2>Ce face și ce nu face</h2>
  <p>Să fim corecți de la început: llms.txt este o propunere a comunității, nu un standard oficial. Nu toate motoarele AI au confirmat public că îl citesc, iar Google a spus că nu îl folosește în căutare; un reprezentant Google l-a comparat chiar cu vechea etichetă meta keywords.</p>
  <p>De ce merită totuși făcut? Pentru că e ieftin, iar efortul te obligă la un lucru util oricum: să scrii clar, în câteva fraze, cine ești și ce oferi. Unele unelte și agenți AI îl caută anume, iar un text limpede ajută și oamenii care îl citesc.</p>
  <p>Ce <strong>nu</strong> face: nu te urcă singur în recomandările ChatGPT, nu înlocuiește conținutul bun de pe site, datele structurate, informațiile consecvente pe fișa Google și în directoare sau recenziile. E o piesă mică dintr-o strategie de <a href="/blog/ghid-geo/">GEO</a>, nu o scurtătură.</p>

  <h2>Ce conține: formatul propus</h2>
  <p>Propunerea de pe llmstxt.org descrie o structură simplă, în această ordine:</p>
  <ul>
    <li><strong>Titlul</strong>, cu numele firmei sau al site-ului (<code># Nume</code>). Este singurul element obligatoriu.</li>
    <li><strong>Un rezumat scurt</strong>, scris ca citat (<code>&gt; ...</code>): cine ești, ce faci, pentru cine, unde.</li>
    <li><strong>Câteva detalii importante</strong>, opțional, în paragrafe obișnuite.</li>
    <li><strong>Secțiuni cu liste de linkuri</strong> (<code>## Servicii</code>, <code>## Contact</code>), fiecare cu o frază de context: <code>[Nume](adresa): ce găsești acolo</code>.</li>
    <li><strong>O secțiune „Optional”</strong>, pentru informațiile secundare, pe care un model le poate sări când are puțin spațiu.</li>
  </ul>
  <p>Unele site-uri publică și o variantă extinsă, <code>llms-full.txt</code>, cu tot textul important într-un singur fișier. Pentru un site de prezentare al unei firme nu e necesară.</p>

  <h2>Un exemplu complet</h2>
  <p>Așa ar arăta fișierul pentru un atelier de mobilier (firma și adresele sunt inventate, pentru exemplu):</p>
  <pre><code># Atelier Exemplu

&gt; Atelier de mobilier la comandă din București: bucătării, dressinguri și mobilier de birou, proiectate și montate în 4-6 săptămâni. Lucrăm pentru apartamente, case și birouri din București și Ilfov.

Măsurătorile și proiectul 3D sunt gratuite. Garanție 5 ani pentru mobilier.

## Servicii
- [Bucătării la comandă](https://exemplu.ro/bucatarii/): proiect 3D, materiale, prețuri orientative
- [Dressinguri](https://exemplu.ro/dressinguri/): soluții pentru spații mici și mansarde
- [Mobilier de birou](https://exemplu.ro/birouri/): pentru firme, cu montaj în weekend

## Contact
- [Cere o ofertă](https://exemplu.ro/contact/): telefon, email, program luni-vineri 9-18

## Optional
- [Proiecte realizate](https://exemplu.ro/proiecte/): galerie cu lucrări montate</code></pre>
  <p>Observă trei lucruri: rezumatul spune în două fraze ce, pentru cine, unde și în cât timp; fiecare link are o frază care explică ce găsești acolo; informațiile mai puțin importante stau la final, în „Optional”.</p>

  <h2>Cum îl creezi, pas cu pas</h2>
  <ol>
    <li><strong>Scrie rezumatul.</strong> Două sau trei fraze: ce faci, pentru cine, în ce zonă și ce te diferențiază. Fără superlative și fără liste de cuvinte cheie.</li>
    <li><strong>Alege paginile importante.</strong> Între 5 și 15: serviciile principale, prețurile, contactul, eventual câteva articole bune. Nu tot site-ul.</li>
    <li><strong>Adaugă contextul.</strong> La fiecare link, o frază scurtă: ce conține pagina și pentru cine e utilă.</li>
    <li><strong>Salvează corect.</strong> Fișierul se numește <code>llms.txt</code> și se salvează cu codarea UTF-8, ca diacriticele să apară corect.</li>
    <li><strong>Publică-l la rădăcină.</strong> Trebuie să se deschidă la <code>site-ul-tău.ro/llms.txt</code>. Pe site-urile statice îl urci ca pe orice fișier; pe WordPress există module care îl generează, dar verifică ce scriu.</li>
    <li><strong>Verifică.</strong> Deschide adresa în browser: textul e lizibil, diacriticele sunt corecte, linkurile funcționează.</li>
    <li><strong>Ține-l la zi.</strong> Când se schimbă serviciile, prețurile sau programul, actualizează și fișierul.</li>
  </ol>

  <h2>Greșeli frecvente</h2>
  <ul>
    <li><strong>Fișierul devine o listă de cuvinte cheie.</strong> Modelele au nevoie de fapte clare, nu de fraze repetate.</li>
    <li><strong>Informațiile se contrazic.</strong> Alte prețuri, alt program sau altă adresă decât pe site și pe fișa Google. Contradicțiile sunt exact ce te scoate din răspunsurile AI.</li>
    <li><strong>Linkuri spre pagini care nu mai există.</strong></li>
    <li><strong>Diacritice stricate,</strong> pentru că fișierul a fost salvat cu altă codare decât UTF-8.</li>
    <li><strong>Te oprești aici.</strong> Fără conținut bun și fără surse care te confirmă, fișierul singur nu schimbă nimic.</li>
  </ul>

  <h2>llms.txt, robots.txt, sitemap și datele structurate</h2>
  <p>Toate patru ajută roboții să înțeleagă un site, dar fiecare are rolul lui:</p>
  <table class="cmp">
    <thead><tr><th>Fișier</th><th>Pentru cine</th><th>Ce spune</th></tr></thead>
    <tbody>
      <tr><td>robots.txt</td><td>Toți roboții</td><td>Ce pagini au voie să acceseze</td></tr>
      <tr><td>sitemap.xml</td><td>Motoarele de căutare</td><td>Lista completă a paginilor și când s-au schimbat</td></tr>
      <tr><td>Date structurate</td><td>Google și motoarele AI</td><td>Ce reprezintă fiecare pagină: firmă, serviciu, articol, întrebări</td></tr>
      <tr><td>llms.txt</td><td>Modelele și uneltele AI</td><td>Rezumatul firmei și paginile care contează</td></tr>
    </tbody>
  </table>

  <h2>Întrebări frecvente</h2>
  <div class="faq" style="margin-top:10px">
    <details><summary>Trebuie să am un fișier llms.txt?</summary><p>Nu e obligatoriu și nu e un factor de clasare în Google. E un pas mic, de jumătate de oră, care ajută modelele și uneltele AI care îl caută să înțeleagă repede cine ești.</p></details>
    <details><summary>Îl citește ChatGPT?</summary><p>Nu toate companiile AI au confirmat public că îl folosesc. De aceea nu ne bazăm doar pe el: vizibilitatea în AI vine în primul rând din conținutul site-ului și din sursele care te confirmă.</p></details>
    <details><summary>Pot opri motoarele AI să-mi folosească site-ul?</summary><p>Da, din robots.txt: fiecare companie AI are roboții ei, de exemplu GPTBot la OpenAI sau Google-Extended la Google. Atenție însă: dacă blochezi roboții care alimentează căutarea AI, scad și șansele să fii recomandat.</p></details>
    <details><summary>Unde văd un fișier real?</summary><p>Multe firme de software publică llms.txt pentru documentație. Al nostru e la <a href="/llms.txt">amplio.ro/llms.txt</a>, în formatul descris mai sus.</p></details>
  </div>

  <h2>Unde se încadrează în strategia de GEO</h2>
  <p>llms.txt e unul dintre pașii de bază, alături de paginile care răspund direct la întrebările clienților, datele structurate și aceleași informații despre firmă peste tot pe internet. Tabloul complet e în <a href="/blog/ghid-geo/">ghidul GEO</a>, iar ca să vezi unde ești acum, citește <a href="/blog/verifica-daca-apari-in-ai/">cum verifici dacă firma ta apare în ChatGPT</a>.</p>
  <div class="key" style="margin-top:30px">
    <p style="margin:0"><strong>Vrei vizibilitate în AI completă, nu doar un fișier?</strong> Vezi serviciul de <a href="/servicii/geo/">optimizare GEO</a> sau cere <a href="/audit-gratuit/">auditul gratuit</a>.</p>
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
  desc='Cum îți optimizezi profilul Google Business ca să apari pe Google Maps când localnicii caută „lângă mine”. Ghid pentru clinici, HoReCa și servicii.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Google Business local','/blog/google-business-profil-local') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum apari pe Google Maps cu profilul de business","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
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
    <p style="margin:0"><strong>Vrei mai mulți clienți din zona ta?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a>, îți spunem cât de vizibil ești local și ce repari întâi. Vizibilitatea în căutările locale ține și de <a href="/servicii/seo-geo/">SEO și GEO</a>.</p>
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
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum alegi cuvintele cheie când pornești de la zero","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
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
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Google Ads vs Meta Ads: cu care începi","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
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
  title='Marketing pentru magazin online: crește vânzările | AMPLIO'
  desc='Cum crești vânzările unui magazin online: cele trei pârghii (mai mult trafic, conversie mai bună, valoare mai mare per client) și în ce ordine le activezi.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Marketing magazin online','/blog/marketing-magazin-online') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Marketing pentru magazin online: ghid de creștere a vânzărilor","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
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
  title='Cum își umple clinica agenda cu pacienții potriviți | AMPLIO'
  desc='Marketing pentru clinici la standardul actului medical: cum atragi pacienți din zona ta prin Google Business, ads local și SEO/GEO, fără reclame agresive.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Marketing clinică','/blog/marketing-clinica-pacienti') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum își umple o clinică agenda cu pacienții potriviți","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
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
  desc='Marketing B2B pentru firme de servicii: cum treci dincolo de rețeaua de contacte și construiești un motor de lead-uri prin LinkedIn ABM, SEO/GEO și nurture.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Pipeline B2B','/blog/marketing-b2b-pipeline') ))
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"Cum construiești un pipeline B2B previzibil","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
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
  jsonld='{"@context":"https://schema.org","@type":"Article","headline":"De ce conturile de ads trebuie să rămână ale tale","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18"}'
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
    <p style="margin:0"><strong>Lucrezi cu o agenție și nu ești sigur ce deții?</strong> Cere <a href="/audit-gratuit/">auditul gratuit</a>, te ajutăm să verifici, fără obligații. La <a href="/servicii/performance-ads/">administrarea Google Ads și Meta Ads</a>, conturile sunt ale tale din prima zi.</p>
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

# ---------- RUN ----------
Write-Host "AMPLIO build - $($pages.Count) pagini..."
foreach ($p in $pages) { Build-Page $p }

# ---------- Dupa generare: data reala a modificarii in sitemap.xml + llms-full.txt ----------
$POSTBUILD_JS = @'
// Rulat de build.ps1 dupa generarea paginilor: data reala a modificarii in sitemap.xml si llms-full.txt
const fs = require('fs'), path = require('path'), cp = require('child_process');
const root = process.argv[2];
const azi = new Date().toLocaleDateString('sv-SE');
function git(args) { try { return cp.execFileSync('git', args, { cwd: root, encoding: 'utf8', stdio: ['ignore', 'pipe', 'ignore'] }).trim(); } catch (e) { return null; } }
function fisier(u) { return u === '/' ? 'index.html' : u.replace(/^\/|\/$/g, '') + '/index.html'; }
function dataModificarii(rel) {
  const st = git(['status', '--porcelain', '--', rel]);
  if (st === null || st !== '') return azi;
  return git(['log', '-1', '--format=%cs', '--', rel]) || azi;
}
const smPath = path.join(root, 'sitemap.xml');
let sm = fs.readFileSync(smPath, 'utf8');
const urls = [];
sm = sm.replace(/<url><loc>https:\/\/amplio\.ro(\/[^<]*)<\/loc>(<lastmod>[^<]*<\/lastmod>)?/g, (m, u) => { urls.push(u); return '<url><loc>https://amplio.ro' + u + '</loc><lastmod>' + dataModificarii(fisier(u)) + '</lastmod>'; });
fs.writeFileSync(smPath, sm);

const ENT = { amp: '&', lt: '<', gt: '>', quot: '"', apos: "'", nbsp: ' ', rarr: '→', larr: '←', middot: '·', euro: '€', bdquo: '„', rdquo: '”', ldquo: '“', rsquo: '’', lsquo: '‘', ndash: '-', hellip: '…', copy: '©', rsaquo: '›', times: '×' };
function dec(s) { return s.replace(/&(#x[0-9a-f]+|#\d+|[a-z]+);/gi, (m, e) => e[0] === '#' ? String.fromCodePoint(e[1].toLowerCase() === 'x' ? parseInt(e.slice(2), 16) : parseInt(e.slice(1), 10)) : (ENT[e] !== undefined ? ENT[e] : m)); }
function text(s) { return dec(s.replace(/<[^>]+>/g, '')).replace(/\s+/g, ' ').trim(); }
function md(html) {
  let t = html.replace(/\r/g, '');
  t = t.replace(/<script[\s\S]*?<\/script>|<style[\s\S]*?<\/style>|<svg[\s\S]*?<\/svg>|<form[\s\S]*?<\/form>/g, '');
  t = t.replace(/<nav class="crumbs"[\s\S]*?<\/nav>/g, '');
  t = t.replace(/<div class="(grid-bg|hero-cta|ctaband|contact-actions)"[^>]*>[\s\S]*?<\/div>/g, '');
  t = t.replace(/<div class="rv-block"[\s\S]*?<p class="rv-note">[\s\S]*?<\/p>\s*<\/div>/g, '');
  t = t.replace(/<h2[^>]*>[^<]*<\/h2>\s*<div class="svc-grid">[\s\S]*?<\/div>/g, '');
  t = t.replace(/<div class="svc-grid">[\s\S]*?<\/div>/g, '');
  t = t.replace(/<span class="(eyebrow[^"]*|n)"[^>]*>[\s\S]*?<\/span>/g, '');
  t = t.replace(/<div class="day">[\s\S]*?<\/div>/g, '');
  t = t.replace(/<p class="meta">[\s\S]*?<\/p>/g, '');
  t = t.replace(/<h1[^>]*>[\s\S]*?<\/h1>/g, '');
  t = t.replace(/<table[^>]*>([\s\S]*?)<\/table>/g, (m, inner) => {
    const rows = [...inner.matchAll(/<tr[^>]*>([\s\S]*?)<\/tr>/g)].map(r => [...r[1].matchAll(/<t[hd][^>]*>([\s\S]*?)<\/t[hd]>/g)].map(c => text(c[1]).replace(/\|/g, '/')));
    if (!rows.length) return '';
    return '\n\n' + [rows[0], rows[0].map(() => '---'), ...rows.slice(1)].map(r => '| ' + r.join(' | ') + ' |').join('\n') + '\n\n';
  });
  t = t.replace(/<summary[^>]*>([\s\S]*?)<\/summary>/g, (m, q) => '\n\n**' + text(q) + '**\n\n');
  t = t.replace(/<a\s[^>]*href="([^"]+)"[^>]*>([\s\S]*?)<\/a>/g, (m, h, x) => {
    const tx = text(x); if (!tx) return '';
    if (/^(mailto:|tel:)/.test(h)) return tx;
    return '[' + tx + '](' + (h.startsWith('/') ? 'https://amplio.ro' + h : h) + ')';
  });
  t = t.replace(/<(b|strong)>([\s\S]*?)<\/\1>/g, (m, g, x) => '**' + text(x) + '**');
  t = t.replace(/<(i|em)>([\s\S]*?)<\/\1>/g, (m, g, x) => '_' + text(x) + '_');
  t = t.replace(/<h2[^>]*>([\s\S]*?)<\/h2>/g, (m, x) => '\n\n#### ' + text(x) + '\n\n');
  t = t.replace(/<h3[^>]*>([\s\S]*?)<\/h3>/g, (m, x) => '\n\n##### ' + text(x) + '\n\n');
  t = t.replace(/<li[^>]*>([\s\S]*?)<\/li>/g, (m, x) => '\n- ' + x.replace(/\s+/g, ' ').trim());
  t = t.replace(/<br\s*\/?>/g, '\n');
  t = t.replace(/<\/(p|div|section|ul|ol|blockquote|figure|details|article)>/g, '\n\n');
  t = t.replace(/<[^>]+>/g, '');
  t = dec(t);
  t = t.split('\n').map(l => l.replace(/[ \t]+/g, ' ').trim()).join('\n');
  return t.replace(/\n{3,}/g, '\n\n').trim();
}
function pagina(u) {
  const h = fs.readFileSync(path.join(root, fisier(u)), 'utf8');
  const start = h.indexOf('</nav>', h.indexOf('<nav id="nav">'));
  const main = h.slice(start + 6, h.indexOf('<footer'));
  const h1 = (main.match(/<h1[^>]*>([\s\S]*?)<\/h1>/) || [, ''])[1];
  return '### ' + text(h1) + '\n\nSursa: https://amplio.ro' + u + '\n\n' + md(main);
}
const grupe = [
  ['Despre AMPLIO', urls.filter(u => u === '/despre/')],
  ['Servicii', urls.filter(u => /^\/servicii\/[^/]+\/$/.test(u))],
  ['Soluții pe industrie', urls.filter(u => /^\/solutii\/[^/]+\/$/.test(u))],
  ['Auditul gratuit și contactul', urls.filter(u => u === '/audit-gratuit/' || u === '/contact/')],
  ['Ghiduri și articole', urls.filter(u => /^\/blog\/[^/]+\/$/.test(u))],
];
const llms = fs.readFileSync(path.join(root, 'llms.txt'), 'utf8').replace(/\r/g, '');
const rezumat = (llms.match(/^> .*$/m) || [''])[0];
let out = '# AMPLIO: conținutul complet al site-ului amplio.ro\n\n' + rezumat + '\n\nUltima actualizare: ' + azi + '. Versiunea scurtă: https://amplio.ro/llms.txt\n\n## Date de identificare\n\n- AMPLIO CREATIVE S.R.L., Nr. Reg. Com. J2026044340009, CUI 55206491\n- Sediu social: Bd. Dinicu Golescu nr. 7, Sector 1, 010871 București\n- Email: contact@amplio.ro\n- Telefon și WhatsApp: 0728 151 558\n- Site: https://amplio.ro/\n';
let n = 0;
for (const [titlu, lista] of grupe) {
  if (!lista.length) continue;
  out += '\n## ' + titlu + '\n';
  for (const u of lista) { out += '\n' + pagina(u) + '\n'; n++; }
}
fs.writeFileSync(path.join(root, 'llms-full.txt'), out);
console.log('  sitemap.xml: ' + urls.length + ' adrese cu lastmod; llms-full.txt: ' + n + ' pagini, ' + Buffer.byteLength(out) + ' octeti');
'@
$postJs = Join-Path ([System.IO.Path]::GetTempPath()) 'amplio-postbuild.js'
[System.IO.File]::WriteAllText($postJs, $POSTBUILD_JS, (New-Object System.Text.UTF8Encoding($false)))
& node $postJs $root
if ($LASTEXITCODE -ne 0) { throw 'Actualizarea sitemap.xml / llms-full.txt a esuat' }
Remove-Item $postJs -ErrorAction SilentlyContinue
Write-Host "Gata."
