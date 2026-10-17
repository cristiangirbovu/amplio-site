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
  $ogImg = if ($p.ogimg) { "https://amplio.ro$($p.ogimg)" } else { "https://amplio.ro/assets/og-amplio.jpg" }
  $ogAlt = if ($p.ogalt) { $p.ogalt } else { "AMPLIO, agenție de marketing digital" }
  $jsonld = ""
  if ($p.jsonld) {
    $ld = $p.jsonld
    if ($ld -like '*"@type":"Service",*' -and $ld -notlike '*"url":"https://amplio.ro/s*') { $ld = $ld.Replace('"@type":"Service",', '"@type":"Service","url":"' + $canonical + '",') }
    if ($ld -like '*"@type":"Article",*' -and $ld -notlike '*"mainEntityOfPage"*') { $ld = $ld.Replace('"@type":"Article",', '"@type":"Article","mainEntityOfPage":"' + $canonical + '","image":"' + $ogImg + '",') }
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
<meta property="og:image" content="$ogImg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:image:alt" content="$ogAlt">
<meta property="og:site_name" content="AMPLIO">
<meta property="og:locale" content="ro_RO">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="$($p.title)">
<meta name="twitter:description" content="$($p.desc)">
<meta name="twitter:image" content="$ogImg">
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
  desc='Agenție de performance marketing: Google, Meta și TikTok Ads ca un singur buget, cu tracking verificat și raport pe venit. De la 450 €/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Performance Ads','/servicii/performance-ads') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Administrare Performance Ads","serviceType":"Administrare campanii publicitare (PPC)","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"450"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Cât buget de reclame îmi trebuie?","acceptedAnswer":{"@type":"Answer","text":"Nu există o sumă fixă. Bugetul trebuie să aducă destule clicuri ca să avem date de optimizat și depinde de cât costă un clic în domeniul tău. Îl calculăm împreună la audit, iar o primă estimare o ai în calculatorul de investiție."}},{"@type":"Question","name":"Pot începe cu un singur canal?","acceptedAnswer":{"@type":"Answer","text":"Da, și de obicei așa recomandăm. Pornim cu canalul unde te caută clienții, de regulă Google pentru servicii și Google Shopping sau Meta pentru magazine, și adăugăm alte canale după ce primul aduce rezultate."}},{"@type":"Question","name":"În cât timp apar rezultatele?","acceptedAnswer":{"@type":"Answer","text":"Primele cereri sau vânzări apar de obicei în primele săptămâni după lansare. Prima lună e și o lună de învățare: aflăm ce audiențe, mesaje și pagini funcționează."}},{"@type":"Question","name":"Cine face reclamele?","acceptedAnswer":{"@type":"Answer","text":"Noi, cu ajutorul AI, cu 3-5 variante pentru fiecare grup de reclame. Fiecare variantă e verificată de un om și aprobată de tine înainte să pornească."}},{"@type":"Question","name":"Conturile de reclame sunt ale mele?","acceptedAnswer":{"@type":"Answer","text":"Da. Conturile de Google, Meta și TikTok sunt pe firma ta, iar bugetul se plătește din ele, direct platformelor. Noi primim acces de administrator. Dacă pleci, tot istoricul rămâne la tine."}},{"@type":"Question","name":"Ce se întâmplă dacă reclamele nu aduc rezultate?","acceptedAnswer":{"@type":"Answer","text":"Lucrăm cu un pilot de 90 de zile, cu KPI scriși în contract și clauză de ieșire fără penalități. Dacă cifrele nu vin, nu rămâi blocat într-un contract."}}]}]}'
  extra=(Articole @( ,@('Cât costă Google Ads în România în 2026','/blog/cost-google-ads-romania/'); ,@('7 greșeli care îți ard bugetul de Google Ads','/blog/greseli-buget-google-ads/'); ,@('Google Ads vs Meta Ads: cu care începi?','/blog/google-ads-vs-meta-ads/') ))
  body=@"
<section class="subhero">
  <div class="grid-bg"></div>
  <div class="wrap">
    $(CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Performance Ads','/servicii/performance-ads') ))
    <span class="eyebrow">Serviciu &middot; Performance Ads</span>
    <h1>Administrare Google Ads, <span class="g">Meta și TikTok Ads.</span></h1>
    <p class="lead"><strong>Reclame care aduc vânzări, nu doar afișări.</strong> Alegem canalele după felul în care te caută clienții, punem tracking corect înainte de primul leu cheltuit și mutăm bugetul în fiecare săptămână acolo unde aduce clienți. Conturile rămân ale tale.</p>
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
        <h2>Bugetul tău de reclame, condus de cifre</h2>
        <p class="lead" style="margin-bottom:18px">Cele mai multe firme cheltuie pe reclame fără să știe ce canal aduce clienți. Noi pornim de la măsurarea corectă și de la un nivel de pornire semnat, apoi optimizăm pe ce contează: costul unui client nou și venitul generat.</p>
        <p style="margin-bottom:18px">Lucrăm toate canalele plătite ca un singur buget. Google te arată oamenilor care caută deja ce vinzi. Meta, adică Facebook și Instagram, creează cerere și îi aduce înapoi pe cei care au fost pe site. TikTok funcționează pentru magazinele online cu produse care se arată bine în video.</p>
        <p>Pentru detalii pe fiecare canal: <a href="/servicii/google-ads/" style="color:var(--sky)">Google Ads</a> și <a href="/servicii/facebook-ads/" style="color:var(--sky)">Facebook și Instagram Ads</a>.</p>
      </div>
      <div class="panelcard">
        <h3>Ce primești</h3>
        <ul class="flist">
          <li><b>Strategie de canal:</b> unde merită bugetul tău</li>
          <li><b>Tracking verificat:</b> GA4, pixel și conversii trimise de pe server</li>
          <li><b>KPI și nivel de pornire</b> scrise în contract</li>
          <li><b>3-5 variante de reclamă</b> pentru fiecare grup, aprobate de tine</li>
          <li><b>Optimizare săptămânală</b> pe costul unui client nou și pe ROAS</li>
          <li><b>Raport lunar pe venit</b> și o discuție de 30 de minute</li>
        </ul>
        <p class="price" style="margin-top:22px;font-size:15px">Configurare <strong style="color:var(--off)">400-700 &euro;</strong> o dată, apoi de la <strong style="color:var(--off)">450 &euro;/lună</strong></p>
      </div>
    </div>
    <figure class="svc-visual">
      <img src="/assets/serviciu-performance-ads.webp" srcset="/assets/serviciu-performance-ads-mic.webp 800w, /assets/serviciu-performance-ads.webp 1600w" sizes="(max-width: 1180px) calc(100vw - 56px), 1124px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="Fluxuri albastre și aurii care se unesc într-un singur curent și urcă într-un grafic de bare de sticlă">
    </figure>
  </div>
</section>
<section class="bg-2">
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Ce canal, pentru ce afacere</h2>
      <p class="lead">Nu pornim cu toate canalele deodată. Alegem canalul principal după felul în care te caută clienții, iar pe celelalte le testăm cu o parte din buget.</p>
    </div>
    <div class="svc-grid">
      <div class="svc wide"><h3>Magazine online</h3><p>Google Shopping și Performance Max pentru produsele căutate, Meta pentru oameni noi și pentru remarketing, TikTok când produsele se arată bine în video.</p></div>
      <div class="svc wide"><h3>Servicii locale și clinici</h3><p>Google pe căutările din zona ta, plus Meta local pentru remarketing și pentru ofertele de sezon.</p></div>
      <div class="svc wide"><h3>Servicii B2B</h3><p>Google pe frazele cu intenție clară și remarketing pe vizitatorii site-ului. Cererile le măsurăm după definiția de lead calificat din contract.</p></div>
      <div class="svc wide"><h3>Lansări și produse noi</h3><p>Meta și TikTok ca să creezi cerere, apoi Google pe căutările care apar după campanie.</p></div>
    </div>
    <p style="margin-top:26px">La lansare, 20-30% din buget merge pe teste: audiențe, mesaje și formate noi. Ce aduce clienți primește bugetul, ce nu aduce oprim.</p>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Cât costă</h2>
      <p class="lead">Plătești administrarea către noi și bugetul de reclame direct platformelor. Prețul exact îl primești după auditul gratuit.</p>
    </div>
    <table class="cmp">
      <thead><tr><th>Ce plătești</th><th>Preț</th><th>Ce include</th></tr></thead>
      <tbody>
        <tr><td>Configurare, o singură dată</td><td>400-700 &euro;</td><td>Auditul conturilor existente, tracking-ul, structura contului și primele campanii</td></tr>
        <tr><td>Administrare lunară</td><td>de la 450 &euro;/lună</td><td>Canalele din plan, optimizare săptămânală, creație și raport lunar</td></tr>
        <tr><td>Bugete de reclame de peste 5.000 &euro;/lună</td><td>12-15% din bugetul de reclame</td><td>Același serviciu, plătit procentual, cu minimum 450 &euro; pe lună</td></tr>
      </tbody>
    </table>
    <p style="margin-top:22px">Bugetul de reclame nu e inclus: îl plătești direct către Google, Meta sau TikTok, din conturile tale. Dacă are sens pentru tine, lucrăm și pe modelul de parteneriat: taxă fixă redusă plus un procent doar din creșterea vânzărilor peste nivelul de pornire. Costurile pe clic pe domenii sunt în articolul <a href="/blog/cost-google-ads-romania/" style="color:var(--sky)">Cât costă Google Ads în România</a>.</p>
  </div>
</section>
<section class="bg-2">
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Primele 30 de zile</h2>
      <p class="lead">Cum ajungem de la conturile pe care le ai azi la campanii care învață din cifre.</p>
    </div>
    <div class="tl">
      <div class="tstep"><span class="n">01</span><div class="day">ZILELE 1-7</div><h3>Fundația</h3><p>Acces la conturi, auditul contului existent, tracking corect (GA4, pixel, conversii de pe server), KPI și nivel de pornire semnate.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">ZILELE 7-14</div><h3>Lansarea</h3><p>Structura contului pe obiective, audiențe și cuvinte cheie, 3-5 variante de reclamă pe fiecare grup, aprobate de tine, apoi pornirea cu 20-30% buget de test.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">SĂPTĂMÂNAL</div><h3>Optimizarea</h3><p>Mutăm bugetul spre ce aduce clienți, adăugăm reclame noi, verificăm căutările și excludem ce nu are legătură cu tine.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">LUNAR</div><h3>Raportul</h3><p>Panou de control live, o pagină scrisă cu ce a mers, ce nu și ce facem luna viitoare, plus o discuție de 30 de minute.</p></div>
    </div>
    <p style="margin-top:26px">Îți răspundem în cel mult o zi lucrătoare, iar o campanie nouă e live în cel mult 5 zile lucrătoare de la brief.</p>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Ce vezi în raportul lunar</h2>
        <ul class="flist" style="margin-top:18px">
          <li>Costul unui client nou și venitul atribuit fiecărui canal</li>
          <li>ROAS pentru magazinele online, costul pe cerere pentru servicii</li>
          <li>Ce campanii, audiențe și reclame au primit bugetul</li>
          <li>Ce am oprit și de ce</li>
          <li>Planul pentru luna următoare</li>
        </ul>
        <p style="margin-top:18px">Conturile sunt ale tale, cu acces complet: vezi aceleași cifre ca noi, oricând.</p>
      </div>
      <div class="panelcard" style="align-self:start">
        <h3>Reclamele merg mai bine cu o pagină bună</h3>
        <p style="margin-top:10px">Un anunț bun care trimite pe o pagină slabă înseamnă bani pierduți. De aceea lucrăm reclamele împreună cu pagina de destinație și cu emailul, care îi aduce înapoi pe cei care nu au cumpărat din prima.</p>
        <a class="btn btn-ghost" href="/servicii/landing-pages-cro/" style="margin-top:20px">Vezi Landing &amp; CRO</a>
      </div>
    </div>
  </div>
</section>
<section class="bg-2">
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Greșelile care ard bugetul</h2>
        <ul class="flist" style="margin-top:18px">
          <li><b>Fără tracking corect</b> nu știi ce canal aduce clienți.</li>
          <li><b>Bugetul împărțit egal</b> pe toate canalele, în loc să urmeze rezultatele.</li>
          <li><b>Aceleași reclame luni la rând,</b> până obosesc publicul.</li>
          <li><b>Raport pe afișări și clicuri,</b> nu pe clienți și venit.</li>
          <li><b>Conturi deschise pe numele agenției:</b> când pleci, rămâi fără istoric.</li>
        </ul>
      </div>
      <div>
        <h2>Pentru cine lucrăm</h2>
        <div style="display:flex;flex-direction:column;gap:14px;margin-top:18px">
          <a class="svc" href="/solutii/marketing-ecommerce/" style="padding:20px 22px"><h3>Magazine online</h3><p>Venit și ROAS, cu Google Shopping, Meta și TikTok.</p><span class="more">Vezi soluția &rarr;</span></a>
          <a class="svc" href="/solutii/marketing-clinici/" style="padding:20px 22px"><h3>Clinici și servicii locale</h3><p>Programări și cereri din zona ta.</p><span class="more">Vezi soluția &rarr;</span></a>
          <a class="svc" href="/solutii/marketing-b2b/" style="padding:20px 22px"><h3>Servicii B2B</h3><p>Lead-uri calificate, după o definiție scrisă în contract.</p><span class="more">Vezi soluția &rarr;</span></a>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Întrebări frecvente despre Performance Ads</h2>
    </div>
    <div class="faq">
      <details><summary>Cât buget de reclame îmi trebuie?</summary><p>Nu există o sumă fixă. Bugetul trebuie să aducă destule clicuri ca să avem date de optimizat și depinde de cât costă un clic în domeniul tău. Îl calculăm împreună la audit, iar o primă estimare o ai în calculatorul de investiție.</p></details>
      <details><summary>Pot începe cu un singur canal?</summary><p>Da, și de obicei așa recomandăm. Pornim cu canalul unde te caută clienții, de regulă Google pentru servicii și Google Shopping sau Meta pentru magazine, și adăugăm alte canale după ce primul aduce rezultate.</p></details>
      <details><summary>În cât timp apar rezultatele?</summary><p>Primele cereri sau vânzări apar de obicei în primele săptămâni după lansare. Prima lună e și o lună de învățare: aflăm ce audiențe, mesaje și pagini funcționează.</p></details>
      <details><summary>Cine face reclamele?</summary><p>Noi, cu ajutorul AI, cu 3-5 variante pentru fiecare grup de reclame. Fiecare variantă e verificată de un om și aprobată de tine înainte să pornească.</p></details>
      <details><summary>Conturile de reclame sunt ale mele?</summary><p>Da. Conturile de Google, Meta și TikTok sunt pe firma ta, iar bugetul se plătește din ele, direct platformelor. Noi primim acces de administrator. Dacă pleci, tot istoricul rămâne la tine.</p></details>
      <details><summary>Ce se întâmplă dacă reclamele nu aduc rezultate?</summary><p>Lucrăm cu un pilot de 90 de zile, cu KPI scriși în contract și clauză de ieșire fără penalități. Dacă cifrele nu vin, nu rămâi blocat într-un contract.</p></details>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="ctaband">
      <h2>Vrei să vezi unde merită bugetul tău de reclame?</h2>
      <p class="lead center">Cere auditul gratuit. În 24 de ore primești o analiză personalizată și primii 3 pași, fără obligații.</p>
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
    </div>
  </div>
</section>
"@
}
$pages += @{
  path='servicii/social-media'
  title='Agenție social media: administrare pagini | AMPLIO'
  desc='Administrare social media pentru firme: pachete S, M și L, cu 8, 16 sau 24 de postări pe lună, aprobare într-un link și raport. De la 350 €/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Social Media','/servicii/social-media') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Administrare social media","serviceType":"Administrare social media","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"350"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Pe ce rețele postați?","acceptedAnswer":{"@type":"Answer","text":"Le alegem după publicul tău. De obicei Facebook și Instagram, plus LinkedIn pentru firmele B2B. Pe fiecare rețea adaptăm formatul și tonul."}},{"@type":"Question","name":"Trebuie să aprob fiecare postare?","acceptedAnswer":{"@type":"Answer","text":"Aprobi tot calendarul lunii dintr-un singur link, o dată pe lună. Poți cere modificări înainte de programare, apoi nu mai trebuie să faci nimic."}},{"@type":"Question","name":"Cine face fotografiile și video-urile?","acceptedAnswer":{"@type":"Answer","text":"Vizualurile le facem noi, pe șabloanele brandului tău. Video-urile mai complexe le producem prin partenerii noștri, în pachetele M și L. Dacă ai fotografii proprii, le folosim cu prioritate."}},{"@type":"Question","name":"Răspundeți și la comentarii și mesaje?","acceptedAnswer":{"@type":"Answer","text":"În pachetul L, da, în tonul agreat la început. În pachetele S și M le urmărim și îți semnalăm ce cere un răspuns din partea ta."}},{"@type":"Question","name":"În cât timp se vede efectul?","acceptedAnswer":{"@type":"Answer","text":"Ritmul constant se vede din prima lună. Creșterea comunității și cererile din social media se construiesc în timp, de regulă în câteva luni de publicare constantă."}},{"@type":"Question","name":"Faceți și reclame pe Facebook și Instagram?","acceptedAnswer":{"@type":"Answer","text":"Da, prin serviciul de Facebook și Instagram Ads, cu buget separat. Social media construiește prezența, iar reclamele aduc oameni noi."}}]}]}'
  extra=(Articole @( ,@('Google Ads vs Meta Ads: cu care începi?','/blog/google-ads-vs-meta-ads/'); ,@('Cum alegi o agenție de marketing (și ce întrebări să pui)','/blog/cum-alegi-agentie-marketing/'); ,@('De ce conturile de ads trebuie să rămână ale tale','/blog/conturi-ads-proprietate/') ))
  body=@"
<section class="subhero">
  <div class="grid-bg"></div>
  <div class="wrap">
    $(CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Social Media','/servicii/social-media') ))
    <span class="eyebrow">Serviciu &middot; Social Media</span>
    <h1>Administrare social media <span class="g">pentru firme.</span></h1>
    <p class="lead"><strong>Vocea brandului tău, fără efortul tău.</strong> Strategie pe trei piloni, calendar lunar, texte și vizualuri pe brandul tău, aprobare într-un singur link, programare și raport. Alegi pachetul S, M sau L, după ritmul de care ai nevoie.</p>
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
        <h2>Constanța bate inspirația</h2>
        <p class="lead" style="margin-bottom:18px">Problema social media nu e ideea de azi, e ritmul de fiecare săptămână. Noi construim calendarul, producem conținutul și îl programăm, ca prezența ta să fie constantă și coerentă.</p>
        <p style="margin-bottom:18px">Creația o accelerăm cu AI, dar fiecare postare trece prin control uman și prin vocea brandului tău. Aprobi tot calendarul lunii dintr-un singur link, nu postare cu postare.</p>
        <p>Rețelele le alegem după public: de obicei Facebook și Instagram, plus LinkedIn pentru firmele B2B.</p>
      </div>
      <div class="panelcard">
        <h3>Ce primești</h3>
        <ul class="flist">
          <li><b>Strategie pe 3 piloni de conținut,</b> legată de obiectivele tale</li>
          <li><b>Calendar pe 30 de zile,</b> în fiecare lună</li>
          <li><b>Texte și vizualuri</b> pe identitatea brandului tău</li>
          <li><b>Aprobare într-un singur link,</b> o dată pe lună</li>
          <li><b>Programare automată</b> pe rețelele alese</li>
          <li><b>Raport lunar</b> cu interpretare și recomandarea lunii</li>
        </ul>
        <p class="price" style="margin-top:22px;font-size:15px">Configurare <strong style="color:var(--off)">250 &euro;</strong> o dată, apoi pachete <strong style="color:var(--off);white-space:nowrap">350 / 600 / 950 &euro;</strong>/lună</p>
      </div>
    </div>
    <figure class="svc-visual">
      <img src="/assets/serviciu-social-media.webp" srcset="/assets/serviciu-social-media-mic.webp 800w, /assets/serviciu-social-media.webp 1600w" sizes="(max-width: 1180px) calc(100vw - 56px), 1124px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="Grilă de plăci de sticlă, câteva aurii și albastre unite de un fir de lumină, ca un calendar de postări">
    </figure>
  </div>
</section>
<section class="bg-2">
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Pachetele</h2>
      <p class="lead">Toate pachetele includ strategia, calendarul, textele, vizualurile, programarea și raportul. Diferă ritmul și cât preluăm din administrarea zilnică.</p>
    </div>
    <table class="cmp">
      <thead><tr><th>Pachet</th><th>S</th><th>M</th><th>L</th></tr></thead>
      <tbody>
        <tr><td>Preț lunar</td><td>350 &euro;</td><td>600 &euro;</td><td>950 &euro;</td></tr>
        <tr><td>Postări pe lună</td><td>8</td><td>16</td><td>24</td></tr>
        <tr><td>Reels (video scurt)</td><td>nu</td><td>da</td><td>da</td></tr>
        <tr><td>Comentarii și mesaje</td><td>le urmărim și îți semnalăm ce cere răspuns</td><td>le urmărim și îți semnalăm ce cere răspuns</td><td>răspundem noi, în tonul agreat</td></tr>
        <tr><td>Raport lunar</td><td>da</td><td>da</td><td>da</td></tr>
      </tbody>
    </table>
    <p style="margin-top:22px">Configurarea, o singură dată, costă 250 &euro; și cuprinde strategia și identitatea vizuală a feedului. Video-urile mai complexe le producem prin partenerii noștri și sunt incluse în pachetele M și L. Promovarea plătită a postărilor se face separat, prin <a href="/servicii/performance-ads/" style="color:var(--sky)">Performance Ads</a>.</p>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Cum lucrăm</h2>
      <p class="lead">O lună de social media înseamnă o singură aprobare din partea ta. Restul e ritmul nostru.</p>
    </div>
    <div class="tl">
      <div class="tstep"><span class="n">01</span><div class="day">ZILELE 1-10</div><h3>Configurarea</h3><p>O discuție de o oră despre vocea brandului, subiectele de evitat și obiective, analiza concurenților, 3 piloni de conținut și șabloane vizuale pe brandul tău.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">ÎN FIECARE LUNĂ</div><h3>Producția</h3><p>Calendarul pe 30 de zile, textele editate de om și vizualurile din șabloane, apoi aprobarea ta într-un singur link și programarea automată.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">ÎN FIECARE ZI</div><h3>Administrarea</h3><p>Urmărim comentariile și mesajele, distribuim ce merită și vedem ce se spune despre brandul tău.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">LA FINAL DE LUNĂ</div><h3>Raportul</h3><p>Raport automat, cu interpretarea noastră și recomandarea pentru luna următoare.</p></div>
    </div>
  </div>
</section>
<section class="bg-2">
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Ce vezi în raportul lunar</h2>
        <ul class="flist" style="margin-top:18px">
          <li>Creșterea comunității și postările care au mers cel mai bine</li>
          <li>Interacțiuni, distribuiri și salvări, nu doar aprecieri</li>
          <li>Mesajele și cererile venite din social media</li>
          <li>Ce schimbăm luna viitoare</li>
        </ul>
        <p style="margin-top:18px">Paginile rămân ale tale; noi lucrăm cu acces de administrator.</p>
      </div>
      <div class="panelcard" style="align-self:start">
        <h3>Organicul construiește încredere, reclamele aduc volum</h3>
        <p style="margin-top:10px">Postările constante îți construiesc credibilitatea, iar reclamele le duc la oameni noi. Când o postare merge bine organic, o putem promova prin Performance Ads, cu buget separat.</p>
        <a class="btn btn-ghost" href="/servicii/facebook-ads/" style="margin-top:20px">Vezi Facebook și Instagram Ads</a>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Greșelile pe care le vedem cel mai des</h2>
        <ul class="flist" style="margin-top:18px">
          <li><b>Postezi când ai timp,</b> deci rar și fără plan.</li>
          <li><b>Același text pe toate rețelele,</b> fără adaptare la fiecare.</li>
          <li><b>Fără o voce clară a brandului,</b> fiecare postare sună altfel.</li>
          <li><b>Comentarii și mesaje fără răspuns</b> zile întregi.</li>
          <li><b>Aprecieri urmărite</b> în locul cererilor.</li>
        </ul>
      </div>
      <div>
        <h2>Pentru cine lucrăm</h2>
        <div style="display:flex;flex-direction:column;gap:14px;margin-top:18px">
          <a class="svc" href="/solutii/marketing-horeca/" style="padding:20px 22px"><h3>Restaurante și HoReCa</h3><p>Postări care deschid pofta și aduc rezervări directe.</p><span class="more">Vezi soluția &rarr;</span></a>
          <a class="svc" href="/solutii/marketing-clinici/" style="padding:20px 22px"><h3>Clinici</h3><p>Informații utile și încredere, la standardul comunicării medicale.</p><span class="more">Vezi soluția &rarr;</span></a>
          <a class="svc" href="/solutii/marketing-b2b/" style="padding:20px 22px"><h3>Servicii B2B</h3><p>LinkedIn cu expertiză reală, nu cu postări de umplutură.</p><span class="more">Vezi soluția &rarr;</span></a>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Întrebări frecvente despre social media</h2>
    </div>
    <div class="faq">
      <details><summary>Pe ce rețele postați?</summary><p>Le alegem după publicul tău. De obicei Facebook și Instagram, plus LinkedIn pentru firmele B2B. Pe fiecare rețea adaptăm formatul și tonul.</p></details>
      <details><summary>Trebuie să aprob fiecare postare?</summary><p>Aprobi tot calendarul lunii dintr-un singur link, o dată pe lună. Poți cere modificări înainte de programare, apoi nu mai trebuie să faci nimic.</p></details>
      <details><summary>Cine face fotografiile și video-urile?</summary><p>Vizualurile le facem noi, pe șabloanele brandului tău. Video-urile mai complexe le producem prin partenerii noștri, în pachetele M și L. Dacă ai fotografii proprii, le folosim cu prioritate.</p></details>
      <details><summary>Răspundeți și la comentarii și mesaje?</summary><p>În pachetul L, da, în tonul agreat la început. În pachetele S și M le urmărim și îți semnalăm ce cere un răspuns din partea ta.</p></details>
      <details><summary>În cât timp se vede efectul?</summary><p>Ritmul constant se vede din prima lună. Creșterea comunității și cererile din social media se construiesc în timp, de regulă în câteva luni de publicare constantă.</p></details>
      <details><summary>Faceți și reclame pe Facebook și Instagram?</summary><p>Da, prin serviciul de Facebook și Instagram Ads, cu buget separat. Social media construiește prezența, iar reclamele aduc oameni noi.</p></details>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="ctaband">
      <h2>Vrei să vezi cum ar arăta o lună de social media pentru tine?</h2>
      <p class="lead center">Cere auditul gratuit. În 24 de ore primești o analiză personalizată și primii 3 pași, fără obligații.</p>
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
    </div>
  </div>
</section>
"@
}
$pages += @{
  path='servicii/email-automatizari'
  title='Agenție email marketing și automatizări | AMPLIO'
  desc='Email marketing și automatizări pentru magazine online și firme B2B: fluxuri complete pe theMarketer, Klaviyo sau MailerLite. De la 250 €/lună.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Email & Automatizări','/servicii/email-automatizari') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Service","name":"Email marketing și automatizări","serviceType":"Email marketing si automatizari","provider":{"@type":"ProfessionalService","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","telephone":"+40728151558"},"areaServed":{"@type":"Country","name":"România"},"offers":{"@type":"Offer","priceCurrency":"EUR","price":"250"}},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Ce platformă de email îmi recomandați?","acceptedAnswer":{"@type":"Answer","text":"Pentru magazinele online din România pornim de obicei cu theMarketer, care are email, SMS și notificări push în aceeași platformă și se leagă direct de GoMag, MerchantPro, WooCommerce sau Shopify. Pentru magazinele care vând mult în afara țării folosim Klaviyo, iar pentru firmele de servicii și B2B, MailerLite."}},{"@type":"Question","name":"Îmi trebuie o listă mare ca să merite?","acceptedAnswer":{"@type":"Answer","text":"Nu. Fluxurile automate pornesc din acțiunile oamenilor, de exemplu o comandă, un coș abandonat sau o cerere de ofertă, așa că lucrează și cu liste mici. Lista o creștem pe parcurs, doar cu acord explicit."}},{"@type":"Question","name":"Pot folosi o listă de adrese cumpărată?","acceptedAnswer":{"@type":"Answer","text":"Nu. Adresele fără acord încalcă GDPR și strică reputația domeniului, iar apoi și mesajele către clienții reali ajung în Spam. Lucrăm doar cu contacte care și-au dat acordul."}},{"@type":"Question","name":"Contul platformei de email e al meu?","acceptedAnswer":{"@type":"Answer","text":"Da. Platforma e pe firma ta și o plătești direct furnizorului, iar noi primim acces de administrator. Dacă pleci, lista, fluxurile și tot istoricul rămân la tine."}},{"@type":"Question","name":"Cine scrie mesajele?","acceptedAnswer":{"@type":"Answer","text":"Le scriem noi, cu ajutorul AI, iar fiecare text e verificat de un om înainte să plece. Fluxurile le aprobi tu înainte să pornească."}},{"@type":"Question","name":"În cât timp pornesc fluxurile?","acceptedAnswer":{"@type":"Answer","text":"Fluxurile de bază pornesc de regulă în 2-3 săptămâni de la start, după audit și după aprobarea ta. Campaniile lunare încep din a doua lună."}}]}]}'
  extra=(Articole @( ,@('Marketing pentru magazin online: ghid de creștere a vânzărilor','/blog/marketing-magazin-online/'); ,@('Cum construiești un pipeline B2B previzibil','/blog/marketing-b2b-pipeline/') ))
  body=@"
<section class="subhero">
  <div class="grid-bg"></div>
  <div class="wrap">
    $(CrumbsHtml @( ,@('Acasă','/'); ,@('Servicii','/servicii'); ,@('Email & Automatizări','/servicii/email-automatizari') ))
    <span class="eyebrow">Serviciu &middot; Email &amp; Automatizări</span>
    <h1>Email marketing <span class="g">și automatizări.</span></h1>
    <p class="lead"><strong>Fluxuri care vând în timp ce dormi.</strong> Construim o singură dată mesajele automate de bun venit, coș abandonat, după comandă și reactivare, apoi trimitem campaniile lunare. Lucrăm pe contul tău de theMarketer, Klaviyo sau MailerLite și raportăm venitul adus de email, nu doar deschiderile.</p>
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
        <h2>Cel mai ieftin client e cel care te cunoaște deja</h2>
        <p class="lead" style="margin-bottom:18px">Emailul vorbește cu oameni care au cumpărat deja, au cerut o ofertă sau s-au abonat. Nu plătești pe clic, iar un flux construit bine lucrează luni la rând fără să-l mai atingi.</p>
        <p style="margin-bottom:18px">Cele mai multe firme trimit un newsletter din când în când și se opresc acolo. Rezultatele vin însă din mesajele automate, trimise exact când contează: la o oră după un coș abandonat, a doua zi după prima comandă, după trei luni fără nicio cumpărare.</p>
        <p>Merge pentru magazinele online, unde aduce comenzi repetate, și pentru firmele de servicii și B2B, unde ține lead-urile calde până sunt gata să cumpere.</p>
      </div>
      <div class="panelcard">
        <h3>Ce primești</h3>
        <ul class="flist">
          <li><b>Fluxuri automate complete</b>, alese după tipul afacerii tale</li>
          <li><b>2-4 campanii pe lună</b>, pe un calendar agreat</li>
          <li><b>Segmentare după comportament:</b> ce a cumpărat, ce a văzut, când</li>
          <li><b>Teste A/B</b> pe subiecte și oferte</li>
          <li><b>Domeniu autentificat</b> (SPF, DKIM, DMARC), ca mesajele să nu ajungă în Spam</li>
          <li><b>Raport lunar pe venitul adus de email</b>, nu pe rata de deschidere</li>
        </ul>
        <p class="price" style="margin-top:22px;font-size:15px">Implementare <strong style="color:var(--off)">500-1.500 &euro;</strong> o dată, apoi de la <strong style="color:var(--off)">250 &euro;/lună</strong></p>
      </div>
    </div>
    <figure class="svc-visual">
      <img src="/assets/serviciu-email-automatizari.webp" srcset="/assets/serviciu-email-automatizari-mic.webp 800w, /assets/serviciu-email-automatizari.webp 1600w" sizes="(max-width: 1180px) calc(100vw - 56px), 1124px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="Plicuri de sticlă legate prin fire de lumină aurie și albastră care se ramifică, ca fluxurile automate de email">
    </figure>
  </div>
</section>
<section class="bg-2">
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Fluxurile pe care le construim</h2>
      <p class="lead">Pornim cu fluxurile de bază și le extindem după ce vedem cifrele. Setul diferă pentru magazinele online și pentru firmele de servicii.</p>
    </div>
    <div class="cols2">
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Pentru magazine online</h3>
        <ul class="flist" style="margin-top:16px">
          <li><b>Bun venit:</b> 2-3 emailuri pentru abonații noi: cine ești, ce te diferențiază și primul motiv să cumpere.</li>
          <li><b>Coș abandonat:</b> un email la o oră și încă unul a doua zi, cu produsele rămase în coș; pe theMarketer, și un SMS.</li>
          <li><b>Produs văzut, necumpărat:</b> un mesaj pentru cine a revenit la un produs și a plecat fără să cumpere.</li>
          <li><b>După comandă:</b> mulțumire, detalii de livrare, cererea de recenzie, apoi produse care se potrivesc.</li>
          <li><b>Reaprovizionare:</b> o reamintire când un produs consumabil se termină de obicei.</li>
          <li><b>Reactivare și clienți fideli:</b> un motiv să revină pentru cine nu a mai cumpărat de mult și beneficii pentru cei mai buni clienți.</li>
        </ul>
      </div>
      <div>
        <h3 style="font-family:var(--display);font-weight:700;color:var(--off);font-size:22px">Pentru servicii și B2B</h3>
        <ul class="flist" style="margin-top:16px">
          <li><b>Răspuns la cerere:</b> confirmare imediată, apoi o revenire dacă oferta rămâne fără răspuns.</li>
          <li><b>Lead-uri care nu sunt încă gata:</b> o serie de emailuri utile, care răspund la întrebările dinaintea deciziei.</li>
          <li><b>Client nou:</b> pașii primelor săptămâni de colaborare, explicați din timp.</li>
          <li><b>Contacte vechi:</b> reactivarea lead-urilor care nu au mai răspuns de câteva luni.</li>
          <li><b>Newsletter lunar:</b> conținut util care te ține în minte, fără presiune de vânzare.</li>
        </ul>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Pe ce platforme lucrăm</h2>
      <p class="lead">Contul platformei e pe firma ta și îl plătești direct furnizorului; noi primim acces de administrator. Alegem platforma după afacere.</p>
    </div>
    <div class="svc-grid">
      <div class="svc wide"><h3>theMarketer</h3><p>Prima alegere pentru magazinele online din România: email, SMS și notificări push în aceeași platformă, legătură directă cu GoMag, MerchantPro, WooCommerce sau Shopify, plus recomandări de produse, recenzii și program de fidelizare.</p></div>
      <div class="svc wide"><h3>Klaviyo</h3><p>Pentru magazinele care vând mult și în afara României sau sunt construite pe Shopify, acolo unde contează segmentarea avansată.</p></div>
      <div class="svc wide"><h3>MailerLite</h3><p>Pentru firmele de servicii și B2B: newslettere și automatizări clare, la un cost lunar mic.</p></div>
      <div class="svc wide"><h3>CRM-ul tău</h3><p>Legăm emailul de HubSpot, Pipedrive sau CRM-ul pe care îl folosești deja, ca fiecare contact să primească mesajul potrivit etapei în care e.</p></div>
    </div>
  </div>
</section>
<section class="bg-2">
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Cât costă</h2>
      <p class="lead">Prețul depinde de câte fluxuri construim și de câte campanii trimitem pe lună. Îl primești exact după auditul gratuit.</p>
    </div>
    <table class="cmp">
      <thead><tr><th>Ce plătești</th><th>Preț</th><th>Ce include</th></tr></thead>
      <tbody>
        <tr><td>Implementare, o singură dată</td><td>500-1.500 &euro;</td><td>Auditul listei, curățenia după regulile GDPR, configurarea platformei și a domeniului, fluxurile de bază scrise și testate</td></tr>
        <tr><td>Administrare lunară</td><td>250-500 &euro;/lună</td><td>2-4 campanii pe lună, segmentare, teste A/B, optimizarea fluxurilor, raport pe venit</td></tr>
        <tr><td>Variantă legată de rezultat, opțională</td><td>10-15% din venitul adus de email</td><td>Se aplică doar peste un prag de bază agreat în contract</td></tr>
      </tbody>
    </table>
    <p style="margin-top:22px">Costul platformei (theMarketer, Klaviyo sau MailerLite) și eventualele SMS-uri se plătesc direct furnizorului, din contul tău.</p>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Primele 90 de zile</h2>
      <p class="lead">De la audit la primele fluxuri care lucrează singure, apoi la optimizarea lor pe cifre reale.</p>
    </div>
    <div class="tl">
      <div class="tstep"><span class="n">01</span><div class="day">SĂPTĂMÂNA 1</div><h3>Auditul</h3><p>Lista de contacte, istoricul trimiterilor, acordurile de marketing, platforma și datele pe care le ai.</p></div>
      <div class="tstep"><span class="n">02</span><div class="day">SĂPTĂMÂNILE 2-3</div><h3>Implementarea</h3><p>Configurăm platforma și domeniul, scriem și testăm fluxurile de bază și le pornim după aprobarea ta.</p></div>
      <div class="tstep"><span class="n">03</span><div class="day">LUNILE 2-3</div><h3>Campaniile</h3><p>2-4 campanii pe lună pe calendarul agreat, teste A/B pe subiecte și segmentare tot mai fină.</p></div>
      <div class="tstep"><span class="n">04</span><div class="day">LA 90 DE ZILE</div><h3>Optimizarea</h3><p>Vedem unde se opresc oamenii în fluxuri, rescriem pașii slabi și adăugăm fluxuri noi, de exemplu pentru clienții fideli.</p></div>
    </div>
  </div>
</section>
<section class="bg-2">
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Ce vezi în raportul lunar</h2>
        <ul class="flist" style="margin-top:18px">
          <li>Venitul adus de email, separat pe fluxuri și pe campanii</li>
          <li>Comenzile sau cererile venite din email</li>
          <li>Creșterea listei și dezabonările</li>
          <li>Câte mesaje ajung în Inbox și câte în Spam</li>
          <li>Ce testăm luna viitoare</li>
        </ul>
        <p style="margin-top:18px">Platforma e a ta, cu acces complet: vezi aceleași cifre ca noi, oricând.</p>
      </div>
      <div class="panelcard" style="align-self:start">
        <h3>Emailul și reclamele, împreună</h3>
        <p style="margin-top:10px">Reclamele aduc oameni noi pe site, iar emailul îi transformă în clienți care revin. Fluxurile de coș abandonat și de produs văzut recuperează o parte din vizitele plătite care altfel s-ar pierde.</p>
        <a class="btn btn-ghost" href="/servicii/performance-ads/" style="margin-top:20px">Vezi Performance Ads</a>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="cols2">
      <div>
        <h2>Greșelile care costă cel mai mult</h2>
        <ul class="flist" style="margin-top:18px">
          <li><b>Liste cumpărate sau adrese fără acord:</b> încalcă GDPR și duc mesajele în Spam.</li>
          <li><b>Doar newslettere,</b> fără niciun flux automat.</li>
          <li><b>Același mesaj pentru toată lista,</b> indiferent ce a cumpărat fiecare.</li>
          <li><b>Domeniu neautentificat:</b> fără SPF, DKIM și DMARC, chiar și mesajele bune ajung în Spam.</li>
          <li><b>Rata de deschidere urmărită</b> în locul vânzărilor.</li>
        </ul>
      </div>
      <div>
        <h2>Pentru cine lucrăm</h2>
        <div style="display:flex;flex-direction:column;gap:14px;margin-top:18px">
          <a class="svc" href="/solutii/marketing-ecommerce/" style="padding:20px 22px"><h3>Magazine online</h3><p>Comenzi repetate de la clienții pe care îi ai deja, cu theMarketer sau Klaviyo legate de magazin.</p><span class="more">Vezi soluția &rarr;</span></a>
          <a class="svc" href="/solutii/marketing-b2b/" style="padding:20px 22px"><h3>Servicii B2B</h3><p>Lead-uri ținute calde până la decizie și oferte urmărite automat.</p><span class="more">Vezi soluția &rarr;</span></a>
          <a class="svc" href="/solutii/marketing-clinici/" style="padding:20px 22px"><h3>Clinici și servicii locale</h3><p>Reamintiri, cereri de recenzie și mesaje pentru clienții care nu au mai revenit.</p><span class="more">Vezi soluția &rarr;</span></a>
        </div>
      </div>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="sec-head">
      <h2>Întrebări frecvente despre email marketing</h2>
    </div>
    <div class="faq">
      <details><summary>Ce platformă de email îmi recomandați?</summary><p>Pentru magazinele online din România pornim de obicei cu theMarketer, care are email, SMS și notificări push în aceeași platformă și se leagă direct de GoMag, MerchantPro, WooCommerce sau Shopify. Pentru magazinele care vând mult în afara țării folosim Klaviyo, iar pentru firmele de servicii și B2B, MailerLite.</p></details>
      <details><summary>Îmi trebuie o listă mare ca să merite?</summary><p>Nu. Fluxurile automate pornesc din acțiunile oamenilor, de exemplu o comandă, un coș abandonat sau o cerere de ofertă, așa că lucrează și cu liste mici. Lista o creștem pe parcurs, doar cu acord explicit.</p></details>
      <details><summary>Pot folosi o listă de adrese cumpărată?</summary><p>Nu. Adresele fără acord încalcă GDPR și strică reputația domeniului, iar apoi și mesajele către clienții reali ajung în Spam. Lucrăm doar cu contacte care și-au dat acordul.</p></details>
      <details><summary>Contul platformei de email e al meu?</summary><p>Da. Platforma e pe firma ta și o plătești direct furnizorului, iar noi primim acces de administrator. Dacă pleci, lista, fluxurile și tot istoricul rămân la tine.</p></details>
      <details><summary>Cine scrie mesajele?</summary><p>Le scriem noi, cu ajutorul AI, iar fiecare text e verificat de un om înainte să plece. Fluxurile le aprobi tu înainte să pornească.</p></details>
      <details><summary>În cât timp pornesc fluxurile?</summary><p>Fluxurile de bază pornesc de regulă în 2-3 săptămâni de la start, după audit și după aprobarea ta. Campaniile lunare încep din a doua lună.</p></details>
    </div>
  </div>
</section>
<section>
  <div class="wrap rev">
    <div class="ctaband">
      <h2>Vrei să vezi ce poate aduce emailul pentru firma ta?</h2>
      <p class="lead center">Cere auditul gratuit. În 24 de ore primești o analiză personalizată și primii 3 pași, fără obligații.</p>
      <a class="btn btn-primary" href="/audit-gratuit/">Cere auditul gratuit <span class="ar">&rarr;</span></a>
    </div>
  </div>
</section>
"@
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
  <a class="bcard" href="/blog/verifica-daca-apari-in-ai/"><div class="cat">Ghid · GEO</div><h3>Cum verifici dacă firma ta apare în ChatGPT și AI</h3><p>Tutorial pas cu pas: cum afli în 30-45 de minute dacă apari în ChatGPT, Perplexity, Copilot și în răspunsurile AI din Google, și ce faci după test. Fără unelte plătite.</p><span class="more">Citește tutorialul &rarr;</span></a>
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
  title='Cum apari în ChatGPT cu firma ta: ghid practic | AMPLIO'
  desc='Cum ajunge firma ta să fie recomandată de ChatGPT: accesul robotului de căutare, indexarea în Google și Bing, pagini clare, surse externe și măsurare.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cum apari în ChatGPT','/blog/cum-apari-in-chatgpt') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Article","headline":"Cum apari în ChatGPT cu firma ta","description":"Cum ajunge firma ta să fie recomandată de ChatGPT: accesul robotului de căutare, indexarea în Google și Bing, pagini clare, surse externe și măsurare.","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18","dateModified":"2026-10-17"},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Cât durează până apar în ChatGPT?","acceptedAnswer":{"@type":"Answer","text":"Accesul robotului se aplică în aproximativ 24 de ore după ce îl permiți. Recomandările depind însă de cât de bine ești descris pe internet, iar asta durează de obicei câteva luni. Firmele cu o nișă clară și o zonă precisă văd de multe ori efecte mai repede."}},{"@type":"Question","name":"Dacă blochez GPTBot, dispar din ChatGPT?","acceptedAnswer":{"@type":"Answer","text":"Nu. GPTBot e robotul pentru antrenare. Căutarea din ChatGPT folosește OAI-SearchBot, iar cele două se setează separat în robots.txt."}},{"@type":"Question","name":"Pot plăti ca să fiu recomandat de ChatGPT?","acceptedAnswer":{"@type":"Answer","text":"Nu. OpenAI testează reclame în ChatGPT din februarie 2026, deocamdată în câteva țări, iar reclamele apar separat și sunt marcate. Recomandările din răspuns nu se cumpără."}},{"@type":"Question","name":"Funcționează la fel pentru Perplexity, Gemini și Copilot?","acceptedAnswer":{"@type":"Answer","text":"În mare, da. Fiecare are propriul robot și propriile surse, dar toate preferă site-uri accesibile, bine indexate, cu răspunsuri clare și confirmate de alte surse. Copilot se bazează pe Bing, iar rezumatele AI din Google, pe indexul Google."}}]}]}'
  ogimg='/assets/og-cum-apari-in-chatgpt.jpg'
  ogalt='Un balon de dialog din sticlă, legat prin fire de lumină de mai multe plăci mici, ca sursele din care ChatGPT construiește o recomandare'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Cum apari în ChatGPT','/blog/cum-apari-in-chatgpt') ))
  <span class="eyebrow">GEO</span>
  <h1>Cum apari în ChatGPT <span class="g">cu firma ta</span></h1>
</div></section>
<section><div class="wrap"><article class="prose">
  <p class="meta">Actualizat: octombrie 2026 &middot; ~8 min de citit</p>
  <p>Tot mai mulți oameni nu mai caută „dentist Cluj” în Google, ci îl întreabă direct pe ChatGPT: „ce clinică stomatologică bună îmi recomanzi în Cluj?”. Primesc un răspuns cu două-trei nume și, de multe ori, cu linkuri spre sursele folosite. Dacă firma ta nu e printre ele, clientul nici nu află că exiști.</p>
  <div class="pescurt"><p><strong>Pe scurt:</strong> Ca firma ta să apară în ChatGPT, ai nevoie de cinci lucruri: robotul de căutare al OpenAI (OAI-SearchBot) are voie să-ți citească site-ul, site-ul e bine indexat în Google și în Bing, paginile răspund direct la întrebările clienților, alte surse credibile confirmă aceleași date despre tine și verifici lunar rezultatul. Nimic din toate acestea nu se cumpără, se construiește.</p></div>
  <figure class="art-visual"><img src="/assets/blog-chatgpt-1.webp" srcset="/assets/blog-chatgpt-1-mic.webp 800w, /assets/blog-chatgpt-1.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="eager" decoding="async" style="height:auto" alt="Un balon de dialog din sticlă, legat prin fire de lumină de mai multe plăci mici, ca sursele din care ChatGPT construiește o recomandare"></figure>
  <h2>Cum decide ChatGPT ce firme recomandă</h2>
  <p>ChatGPT răspunde în două feluri. Uneori din ce a învățat la antrenare, adică din texte publice adunate până la o anumită dată. Alteori caută pe internet în timp real, mai ales când întrebarea cere informații actuale sau locale, și atunci afișează și sursele din care a luat răspunsul.</p>
  <p>Pentru o firmă, al doilea caz contează cel mai mult: când cineva cere o recomandare, ChatGPT caută, citește câteva pagini și sintetizează. OpenAI folosește pentru asta propriul robot de căutare, dar și furnizori externi de căutare. Vizibilitatea în ChatGPT începe deci cu lucruri foarte concrete: site-ul tău să poată fi citit și să existe pe internet suficiente informații clare despre tine.</p>
  <h2>Pasul 1. Lasă robotul ChatGPT să-ți citească site-ul</h2>
  <p>OpenAI folosește mai mulți roboți, cu roluri diferite. Doi te interesează direct:</p>
  <ul>
    <li><strong>OAI-SearchBot</strong> găsește și citește site-uri pentru căutarea din ChatGPT. Dacă îl blochezi, paginile tale nu apar în răspunsurile cu căutare; cel mult apare un link simplu.</li>
    <li><strong>GPTBot</strong> adună texte pentru antrenarea modelelor. Dacă îl blochezi, conținutul tău nu mai e folosit la antrenare, dar asta nu te scoate din căutarea ChatGPT.</li>
  </ul>
  <p>Cei doi sunt independenți, deci poți permite căutarea și refuza antrenarea. Regula se scrie în fișierul robots.txt din rădăcina site-ului, de exemplu:</p>
  <pre><code>User-agent: OAI-SearchBot
Allow: /

User-agent: GPTBot
Disallow: /</code></pre>
  <p>Al doilea bloc e opțional; îl pui doar dacă nu vrei ca textele tale să fie folosite la antrenare. După o modificare, OpenAI spune că schimbarea se aplică în aproximativ 24 de ore.</p>
  <p>Verifică și protecțiile de deasupra site-ului. Din iulie 2025, Cloudflare blochează implicit roboții AI cunoscuți pe domeniile noi și îi întreabă pe proprietari, la configurare, dacă le permit accesul. Dacă site-ul tău trece prin Cloudflare sau printr-un alt firewall, asigură-te că OAI-SearchBot nu e oprit acolo, chiar dacă robots.txt îl lasă.</p>
  <figure class="art-visual"><img src="/assets/blog-chatgpt-2.webp" srcset="/assets/blog-chatgpt-2-mic.webp 800w, /assets/blog-chatgpt-2.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="Două porți din sticlă, una deschisă prin care trece o rază de lumină albastră și una închisă, ca accesul permis sau blocat pentru roboții AI"></figure>
  <h2>Pasul 2. Fii bine indexat în Google și în Bing</h2>
  <p>Un asistent AI care caută pe internet găsește mai ușor ce e deja indexat de motoarele de căutare. Google spune explicit că pentru rezumatele AI din căutare nu există cerințe speciale: pagina trebuie doar să fie indexată și eligibilă să apară cu un fragment de text.</p>
  <ul>
    <li><strong>Google Search Console:</strong> trimite harta site-ului (sitemap.xml) și urmărește raportul de indexare.</li>
    <li><strong>Bing Webmaster Tools:</strong> adaugă site-ul și aici. Bing alimentează Copilot, iar din februarie 2026 are un raport separat, AI Performance, care arată de câte ori paginile tale sunt citate în răspunsurile Copilot, în rezumatele AI din Bing și la unii parteneri.</li>
    <li><strong>IndexNow:</strong> un protocol gratuit prin care anunți imediat Bing și alte motoare că ai pagini noi sau modificate.</li>
  </ul>
  <p>Multe firme mici folosesc Search Console, dar n-au deschis niciodată Bing Webmaster Tools. E una dintre cele mai ieftine îmbunătățiri pentru vizibilitatea în AI.</p>
  <h2>Pasul 3. Scrie pagini care răspund direct</h2>
  <p>Când construiește un răspuns, un model AI caută fragmente clare, ușor de citat. O pagină care începe cu trei paragrafe despre „pasiunea și experiența noastră” e greu de folosit. O pagină care spune direct ce faci, pentru cine, unde, cât costă și cum lucrezi e ușor de folosit.</p>
  <p>Ce ajută concret:</p>
  <ul>
    <li>răspunsul principal în primele rânduri ale paginii, nu la final;</li>
    <li>subtitluri formulate ca întrebările clienților: „Cât costă…?”, „Cât durează…?”, „Ce include…?”;</li>
    <li>liste și tabele pentru prețuri, pași și comparații;</li>
    <li>cifre concrete, cu sursa lor, și data ultimei actualizări;</li>
    <li>câte o pagină pentru fiecare serviciu important și informații clare despre zonele în care lucrezi;</li>
    <li>întrebări frecvente reale, cu răspunsuri scurte.</li>
  </ul>
  <p>Există și o confirmare academică. În studiul care a definit termenul GEO (Generative Engine Optimization, prezentat la conferința KDD 2024), cercetătorii au arătat că adăugarea de surse, citate și statistici într-un text îi poate crește vizibilitatea în răspunsurile motoarelor generative cu până la 40%. Efectul diferă de la un domeniu la altul, dar direcția e clară: conținutul verificabil e preferat.</p>
  <h2>Pasul 4. Fă-te confirmat de alte surse</h2>
  <p>Un asistent AI e mai sigur pe o firmă pe care o găsește descrisă la fel în mai multe locuri. Dacă site-ul spune un lucru, profilul Google altul, iar un director are un telefon vechi, informația devine nesigură și e mai ușor de ocolit.</p>
  <ul>
    <li><strong>Profilul de companie Google</strong> complet: categorie, servicii, program, poze, răspunsuri la recenzii. Pașii sunt în <a href="/blog/google-business-profil-local/">ghidul despre Google Maps</a>.</li>
    <li><strong>Directoare relevante</strong> pentru domeniul tău, cu același nume, aceeași adresă și același telefon peste tot.</li>
    <li><strong>Recenzii reale</strong>, pe Google și pe platformele din nișa ta. Recenziile cumpărate sunt ușor de recunoscut și te expun și legal.</li>
    <li><strong>Mențiuni în articole:</strong> interviuri, presă locală, ghiduri ale asociațiilor profesionale, parteneriate.</li>
    <li><strong>Rețele sociale active</strong>, cu aceeași descriere și cu linkul spre site.</li>
  </ul>
  <figure class="art-visual"><img src="/assets/blog-chatgpt-3.webp" srcset="/assets/blog-chatgpt-3-mic.webp 800w, /assets/blog-chatgpt-3.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="Cinci plăci de sticlă cu semne de confirmare aurii, legate de un cub central, ca sursele externe care confirmă aceleași date despre o firmă"></figure>
  <h2>Pasul 5. Ajută motoarele să înțeleagă cine ești</h2>
  <p>Datele structurate (schema.org) descriu pentru motoare, într-un format standard, cine este firma, unde se află, ce servicii are și ce întrebări frecvente primește. Google spune că nu e nevoie de marcaje speciale pentru AI, deci nu le vedea ca pe o scurtătură. Sunt însă o bază bună: informația devine clară și coerentă pentru orice sistem care îți citește site-ul.</p>
  <p>La fel, un fișier llms.txt poate ajuta unii asistenți, dar nu e obligatoriu, iar Google precizează că nu are nevoie de fișiere speciale pentru AI. Detaliile sunt în <a href="/blog/ce-este-llms-txt/">articolul despre llms.txt</a>.</p>
  <h2>Cum măsori dacă apari</h2>
  <ul>
    <li><strong>Test manual lunar:</strong> aceleași 10-20 de întrebări, puse în ChatGPT, Perplexity, Copilot și Google. Metoda e în <a href="/blog/verifica-daca-apari-in-ai/">ghidul de verificare</a>.</li>
    <li><strong>Google Analytics:</strong> ChatGPT adaugă automat parametrul utm_source=chatgpt.com la linkurile spre site-uri, deci vezi separat vizitele venite din ChatGPT.</li>
    <li><strong>Bing Webmaster Tools:</strong> raportul AI Performance arată citările și paginile citate.</li>
    <li><strong>Search Console:</strong> Google raportează vizitele din funcțiile AI în raportul de performanță, la tipul Web.</li>
  </ul>
  <h2>Ce nu funcționează</h2>
  <ul>
    <li>Promisiunile de tipul „te punem pe primul loc în ChatGPT”. Nimeni nu controlează răspunsurile unui model.</li>
    <li>Textele scrise pentru roboți, pline de cuvinte cheie. Un model AI preferă textul clar, nu repetițiile.</li>
    <li>Să plătești pentru recomandare. OpenAI testează din februarie 2026 reclame în ChatGPT, în câteva țări, dar spune că ele apar separat, sunt marcate și nu influențează răspunsurile.</li>
    <li>Să schimbi totul într-o săptămână și să aștepți rezultate a doua zi. Sursele externe și încrederea se construiesc în luni, nu în zile.</li>
  </ul>
  <h2>Întrebări frecvente</h2>
  <div class="faq" style="margin-top:10px">
    <details><summary>Cât durează până apar în ChatGPT?</summary><p>Accesul robotului se aplică în aproximativ 24 de ore după ce îl permiți. Recomandările depind însă de cât de bine ești descris pe internet, iar asta durează de obicei câteva luni. Firmele cu o nișă clară și o zonă precisă văd de multe ori efecte mai repede.</p></details>
    <details><summary>Dacă blochez GPTBot, dispar din ChatGPT?</summary><p>Nu. GPTBot e robotul pentru antrenare. Căutarea din ChatGPT folosește OAI-SearchBot, iar cele două se setează separat în robots.txt.</p></details>
    <details><summary>Pot plăti ca să fiu recomandat de ChatGPT?</summary><p>Nu. OpenAI testează reclame în ChatGPT din februarie 2026, deocamdată în câteva țări, iar reclamele apar separat și sunt marcate. Recomandările din răspuns nu se cumpără.</p></details>
    <details><summary>Funcționează la fel pentru Perplexity, Gemini și Copilot?</summary><p>În mare, da. Fiecare are propriul robot și propriile surse, dar toate preferă site-uri accesibile, bine indexate, cu răspunsuri clare și confirmate de alte surse. Copilot se bazează pe Bing, iar rezumatele AI din Google, pe indexul Google.</p></details>
  </div>
  <div class="key" style="margin-top:30px"><p style="margin:0">Vrei să afli cum te văd acum ChatGPT și Google? În <a href="/audit-gratuit/">auditul gratuit</a> punem întrebările clienților tăi în motoarele AI și îți spunem primii trei pași, în 24 de ore. Serviciul complet: <a href="/servicii/geo/">optimizare GEO</a>.</p></div>
  <h2>Surse</h2>
  <ul class="surse">
    <li><a href="https://developers.openai.com/api/docs/bots" target="_blank" rel="noopener">OpenAI, „Overview of OpenAI Crawlers”</a></li>
    <li><a href="https://help.openai.com/en/articles/12627856-publishers-and-developers-faq" target="_blank" rel="noopener">OpenAI, „Publishers and Developers FAQ”</a></li>
    <li><a href="https://developers.google.com/search/docs/appearance/ai-features" target="_blank" rel="noopener">Google Search Central, „AI features and your website”</a></li>
    <li><a href="https://arxiv.org/abs/2311.09735" target="_blank" rel="noopener">Aggarwal și alții, „GEO: Generative Engine Optimization”, KDD 2024</a></li>
    <li><a href="https://blogs.bing.com/webmaster/February-2026/Introducing-AI-Performance-in-Bing-Webmaster-Tools-Public-Preview" target="_blank" rel="noopener">Bing Webmaster Blog, „Introducing AI Performance in Bing Webmaster Tools Public Preview”, februarie 2026</a></li>
    <li><a href="https://www.technologyreview.com/2025/07/01/1119498/cloudflare-will-now-by-default-block-ai-bots-from-crawling-its-clients-websites/" target="_blank" rel="noopener">MIT Technology Review, „Cloudflare will now, by default, block AI bots from crawling its clients’ websites”, 1 iulie 2025</a></li>
    <li><a href="https://openai.com/index/testing-ads-in-chatgpt/" target="_blank" rel="noopener">OpenAI, „Testing ads in ChatGPT”</a></li>
  </ul>
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
  desc='Testul de 30-45 de minute: ce întrebări pui în ChatGPT, Perplexity, Google și Copilot, cum notezi rezultatele și ce unelte gratuite arată citările AI.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Verifică vizibilitatea AI','/blog/verifica-daca-apari-in-ai') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Article","headline":"Cum verifici dacă firma ta apare în ChatGPT și în căutarea AI","description":"Testul de 30-45 de minute: ce întrebări pui în ChatGPT, Perplexity, Google și Copilot, cum notezi rezultatele și ce unelte gratuite arată citările AI.","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18","dateModified":"2026-10-17"},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"De ce primesc alt răspuns de fiecare dată?","acceptedAnswer":{"@type":"Answer","text":"Modelele AI scriu răspunsul de la zero la fiecare întrebare și pot folosi surse diferite. De aceea notezi mai multe rulări și urmărești tendința, nu un singur răspuns."}},{"@type":"Question","name":"Contează dacă sunt conectat la cont?","acceptedAnswer":{"@type":"Answer","text":"Da. Istoricul, memoria și locația pot schimba răspunsul. Pentru test folosește un chat temporar sau o fereastră privată."}},{"@type":"Question","name":"Ce fac dacă ChatGPT spune lucruri greșite despre firma mea?","acceptedAnswer":{"@type":"Answer","text":"Corectează sursa: site-ul, profilul Google și directoarele în care datele sunt vechi. Asistenții preiau informația din aceste surse, deci schimbarea se vede după ce ele sunt actualizate și recitite."}},{"@type":"Question","name":"Cât de des ar trebui să verific?","acceptedAnswer":{"@type":"Answer","text":"O dată pe lună e suficient pentru o firmă mică. Mai des are sens doar după schimbări mari pe site sau după o campanie de presă."}}]}]}'
  ogimg='/assets/og-verifica-daca-apari-in-ai.jpg'
  ogalt='O lupă din sticlă deasupra unei grile de plăci, sub care o singură placă strălucește auriu, ca firma găsită într-un răspuns AI'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Verifică vizibilitatea AI','/blog/verifica-daca-apari-in-ai') ))
  <span class="eyebrow">Ghid &middot; GEO</span>
  <h1>Cum verifici dacă firma ta apare <span class="g">în ChatGPT și în căutarea AI</span></h1>
</div></section>
<section><div class="wrap"><article class="prose">
  <p class="meta">Actualizat: octombrie 2026 &middot; ~8 min de citit &middot; verificarea durează 30-45 de minute</p>
  <p>Când cineva întreabă un asistent AI „ce firmă îmi recomanzi pentru X în orașul meu?”, primește de obicei două-trei nume. Întrebarea nu e doar dacă ești printre ele, ci dacă știi. Cele mai multe firme nu au verificat niciodată.</p>
  <p>Poți afla singur, fără unelte plătite, într-o după-amiază. Mai jos e metoda pe care o folosim și în audituri, pas cu pas.</p>
  <div class="pescurt"><p><strong>Pe scurt:</strong> Alegi 10-20 de întrebări pe care le-ar pune un client care nu te cunoaște, le pui în ChatGPT, Perplexity, Google (rezumatul AI și Modul AI) și Copilot și notezi într-un tabel dacă apari, cum apari și cine apare în locul tău. Repeți lunar, cu aceleași întrebări, și completezi cu datele gratuite din Bing Webmaster Tools și Google Analytics.</p></div>
  <figure class="art-visual"><img src="/assets/blog-verificare-ai-1.webp" srcset="/assets/blog-verificare-ai-1-mic.webp 800w, /assets/blog-verificare-ai-1.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="eager" decoding="async" style="height:auto" alt="O lupă din sticlă deasupra unei grile de plăci, sub care o singură placă strălucește auriu, ca firma găsită într-un răspuns AI"></figure>
  <h2>Înainte să începi: evită rezultatele personalizate</h2>
  <ul>
    <li>Folosește o fereastră privată sau un cont fără istoric. Asistenții țin cont de conversațiile anterioare și de preferințele tale.</li>
    <li>În ChatGPT, folosește un chat temporar, care nu folosește memoria contului.</li>
    <li>Nu te căuta după nume, acolo apari aproape sigur. Testul real e cel în care clientul nu te cunoaște încă.</li>
    <li>Notează data, platforma și dacă răspunsul a folosit căutarea pe internet, adică dacă apar surse.</li>
  </ul>
  <h2>Pasul 1. Scrie întrebările clientului</h2>
  <p>Ai nevoie de 10-20 de întrebări, de patru tipuri:</p>
  <ul>
    <li><strong>Recomandare:</strong> „cea mai bună clinică stomatologică din Cluj”, „firmă de contabilitate pentru magazine online”.</li>
    <li><strong>Comparație:</strong> „ce e mai bine pentru [problema ta], X sau Y?”.</li>
    <li><strong>Preț:</strong> „cât costă [serviciul tău] în București?”.</li>
    <li><strong>Problemă:</strong> „cum rezolv [problema pe care o rezolvi tu]?”.</li>
  </ul>
  <p>Exemple pe domenii, ca punct de plecare:</p>
  <ul>
    <li>Clinică: „cea mai bună clinică stomatologică din [oraș]”, „cât costă un implant dentar în [oraș]”.</li>
    <li>Magazin online: „de unde cumpăr [produsul tău] online în România”.</li>
    <li>Servicii B2B: „ce firmă mă poate ajuta cu [serviciul tău]”.</li>
    <li>HoReCa: „unde mănânc bine în [zonă sau oraș]”.</li>
    <li>Imobiliare: „proiecte rezidențiale noi în [zonă]”.</li>
  </ul>
  <h2>Pasul 2. Întreabă ChatGPT</h2>
  <p>Pune fiecare întrebare exact cum ar scrie-o clientul. Notează dacă apari, dacă ești recomandat clar sau doar menționat și ce surse afișează ChatGPT sub răspuns. Reformulează ușor întrebarea și repet-o: răspunsurile variază de la o rulare la alta.</p>
  <p>Uită-te atent la surse. Dacă ChatGPT citează un director, un articol sau site-ul unui concurent, acolo trebuie să fii și tu. Dacă răspunsul nu are deloc surse, ChatGPT a răspuns din ce a învățat la antrenare; notează asta separat, pentru că îți arată ce știe modelul despre domeniul tău, nu ce găsește acum pe internet.</p>
  <h2>Pasul 3. Verifică în Perplexity</h2>
  <p>Perplexity afișează sursele foarte vizibil, numerotate. E cel mai bun test ca să înțelegi de unde își iau asistenții informația. Notează sursele care apar des: ele devin lista ta de priorități. Dacă aceleași două-trei site-uri apar la mai multe întrebări, ele sunt sursele de încredere ale nișei tale, de exemplu un director, un portal de specialitate sau o platformă de recenzii.</p>
  <h2>Pasul 4. Verifică Google: rezumatul AI și Modul AI</h2>
  <p>Caută aceleași întrebări în Google. Uită-te la rezumatul generat de AI din capul paginii, dacă apare, și încearcă și Modul AI, disponibil în limba română din octombrie 2025. Notează dacă site-ul tău e printre linkurile citate.</p>
  <h2>Pasul 5. Verifică în Copilot și în Gemini</h2>
  <p>Copilot se bazează pe Bing, deci îți arată cum te vede Bing. Gemini îți arată perspectiva Google. Dacă apari într-unul și lipsești din celălalt, ai o pistă: probabil ești bine indexat doar într-unul dintre motoare.</p>
  <figure class="art-visual"><img src="/assets/blog-verificare-ai-2.webp" srcset="/assets/blog-verificare-ai-2-mic.webp 800w, /assets/blog-verificare-ai-2.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="O tabletă din sticlă cu rânduri de puncte albastre, aurii și gri, ca tabelul în care notezi rezultatele testului"></figure>
  <h2>Pasul 6. Notează totul într-un tabel</h2>
  <table class="cmp">
    <thead><tr><th>Întrebare</th><th>Platformă</th><th>Apari? (2/1/0)</th><th>Cum apari</th><th>Surse citate</th><th>Cine apare în locul tău</th></tr></thead>
    <tbody>
      <tr><td>cea mai bună clinică stomatologică din Cluj</td><td data-label="Platformă">ChatGPT</td><td data-label="Apari? (2/1/0)">1</td><td data-label="Cum apari">menționat al treilea</td><td data-label="Surse citate">un director, un articol</td><td data-label="Cine apare în locul tău">clinicile A și B</td></tr>
    </tbody>
  </table>
  <p>Scorul e simplu: 2 puncte dacă ești recomandat clar, 1 punct dacă ești doar menționat, 0 dacă lipsești. Împarte totalul la punctajul maxim și obții un procent pe care îl urmărești lună de lună. De exemplu, 15 întrebări puse pe 4 platforme înseamnă 60 de răspunsuri și cel mult 120 de puncte; dacă strângi 18, scorul tău e 15%.</p>
  <h2>Pasul 7. Adaugă datele care nu depind de teste</h2>
  <ul>
    <li><strong>Bing Webmaster Tools, raportul AI Performance:</strong> de câte ori paginile tale au fost citate în Copilot, în rezumatele AI din Bing și la unii parteneri, și care pagini. E gratuit; ai nevoie doar de site verificat.</li>
    <li><strong>Google Analytics:</strong> ChatGPT adaugă automat utm_source=chatgpt.com la linkurile spre site-uri. Urmărește și vizitele din perplexity.ai, copilot.microsoft.com și gemini.google.com.</li>
    <li><strong>Search Console:</strong> Google include vizitele din rezumatele AI și din Modul AI în raportul de performanță, la tipul Web.</li>
  </ul>
  <h2>Pasul 8. Compară-te cu trei concurenți</h2>
  <p>Pentru aceleași întrebări, notează cine apare în locul tău. Dacă două-trei nume se repetă, ai găsit concurenții care ocupă acum spațiul din răspunsurile AI. Uită-te la sursele lor: directoare, articole, recenzii. Acolo ai de lucru.</p>
  <figure class="art-visual"><img src="/assets/blog-verificare-ai-3.webp" srcset="/assets/blog-verificare-ai-3-mic.webp 800w, /assets/blog-verificare-ai-3.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="Patru coloane de sticlă de înălțimi diferite, una aurie, ca o comparație a vizibilității în AI față de trei concurenți"></figure>
  <h2>Cum interpretezi rezultatele</h2>
  <p>Noi folosim pragurile acestea ca reper:</p>
  <ul>
    <li><strong>Peste 50%:</strong> apari constant. Consolidează: actualizează paginile citate și extinde-te pe întrebări noi.</li>
    <li><strong>Între 10% și 50%:</strong> ai o bază, dar pierzi la detalii. De obicei lipsesc pagini pentru anumite întrebări sau surse externe. Aici sunt cele mai rapide câștiguri.</li>
    <li><strong>Sub 10%:</strong> asistenții nu au de unde să te cunoască. E urgent, dar reparabil; începe cu pașii din ghidul <a href="/blog/cum-apari-in-chatgpt/">cum apari în ChatGPT</a>.</li>
  </ul>
  <h2>Ce faci după test: primele trei acțiuni</h2>
  <ol>
    <li><strong>Repari sursele.</strong> Ia lista surselor citate des, mai ales a celor în care apar concurenții și tu nu. Dacă e un director, înscrie-te sau corectează-ți datele. Dacă e un articol, vezi dacă poți contribui cu o informație utilă sau cu opinia unui specialist.</li>
    <li><strong>Completezi paginile lipsă.</strong> Pentru fiecare întrebare la care nu apari, verifică dacă ai pe site o pagină care răspunde direct. Dacă nu ai, ea e prima pe listă.</li>
    <li><strong>Verifici accesul tehnic.</strong> Robotul OAI-SearchBot trebuie să aibă voie în robots.txt și în protecțiile site-ului, iar site-ul trebuie verificat atât în Bing Webmaster Tools, cât și în Google Search Console.</li>
  </ol>
  <p>După câteva luni de lucru pe acești pași, testul lunar îți arată dacă scorul crește și pe ce întrebări.</p>
  <h2>Cât de des repeți testul</h2>
  <p>Lunar, cu aceleași întrebări, pe aceleași platforme. Răspunsurile AI variază de la o zi la alta, deci contează tendința pe mai multe luni, nu un test izolat. Întrebările noi le ții pe o listă separată, ca să poți compara corect.</p>
  <h2>Ai doar un minut? Începe cu scorul de vizibilitate</h2>
  <p><a href="/scor-vizibilitate-ai/">Testul de vizibilitate AI</a> de pe site are 6 întrebări și îți dă în 60 de secunde un scor pentru zonele care decid dacă o firmă e găsită și aleasă online. Nu înlocuiește verificarea de mai sus, dar îți arată de unde să începi.</p>
  <h2>Întrebări frecvente</h2>
  <div class="faq" style="margin-top:10px">
    <details><summary>De ce primesc alt răspuns de fiecare dată?</summary><p>Modelele AI scriu răspunsul de la zero la fiecare întrebare și pot folosi surse diferite. De aceea notezi mai multe rulări și urmărești tendința, nu un singur răspuns.</p></details>
    <details><summary>Contează dacă sunt conectat la cont?</summary><p>Da. Istoricul, memoria și locația pot schimba răspunsul. Pentru test folosește un chat temporar sau o fereastră privată.</p></details>
    <details><summary>Ce fac dacă ChatGPT spune lucruri greșite despre firma mea?</summary><p>Corectează sursa: site-ul, profilul Google și directoarele în care datele sunt vechi. Asistenții preiau informația din aceste surse, deci schimbarea se vede după ce ele sunt actualizate și recitite.</p></details>
    <details><summary>Cât de des ar trebui să verific?</summary><p>O dată pe lună e suficient pentru o firmă mică. Mai des are sens doar după schimbări mari pe site sau după o campanie de presă.</p></details>
  </div>
  <div class="key" style="margin-top:30px"><p style="margin:0">Vrei să sari peste verificarea manuală? În <a href="/audit-gratuit/">auditul gratuit</a> facem noi testul pe întrebările clienților tăi, în Google și în AI, față de 3 concurenți, plus primii 3 pași. Răspunsul vine în 24 de ore. Serviciul complet: <a href="/servicii/seo-geo/">SEO + GEO</a>.</p></div>
  <h2>Surse</h2>
  <ul class="surse">
    <li><a href="https://help.openai.com/en/articles/12627856-publishers-and-developers-faq" target="_blank" rel="noopener">OpenAI, „Publishers and Developers FAQ”</a></li>
    <li><a href="https://developers.google.com/search/docs/appearance/ai-features" target="_blank" rel="noopener">Google Search Central, „AI features and your website”</a></li>
    <li><a href="https://blog.google/intl/ro-ro/produse/cautarile-google-in-modul-ai-disponibile-in-romania/" target="_blank" rel="noopener">Google România, „Căutările Google în Modul AI, disponibile în România”, 8 octombrie 2025</a></li>
    <li><a href="https://blogs.bing.com/webmaster/February-2026/Introducing-AI-Performance-in-Bing-Webmaster-Tools-Public-Preview" target="_blank" rel="noopener">Bing Webmaster Blog, „Introducing AI Performance in Bing Webmaster Tools Public Preview”, februarie 2026</a></li>
  </ul>
</article></div></section>
"@
}

# ---- BLOG: GEO vs SEO ----
$pages += @{
  path='blog/geo-vs-seo'
  title='GEO vs SEO: diferența și de ce ai nevoie de ambele | AMPLIO'
  desc='Ce face SEO, ce face GEO și unde se suprapun: cum te găsesc oamenii în Google și cum te recomandă ChatGPT, Perplexity și rezumatele AI. Explicat simplu.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('GEO vs SEO','/blog/geo-vs-seo') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Article","headline":"GEO vs SEO: care e diferența și de ce ai nevoie de ambele","description":"Ce face SEO, ce face GEO și unde se suprapun: cum te găsesc oamenii în Google și cum te recomandă ChatGPT, Perplexity și rezumatele AI. Explicat simplu.","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18","dateModified":"2026-10-17"},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"GEO înlocuiește SEO?","acceptedAnswer":{"@type":"Answer","text":"Nu. Rezumatele AI și asistenții care caută pe internet folosesc pagini pe care le găsesc indexate. SEO e fundația, iar GEO se construiește peste ea."}},{"@type":"Question","name":"Am nevoie de buget separat pentru GEO?","acceptedAnswer":{"@type":"Answer","text":"De obicei nu de un buget separat, ci de o altă împărțire a muncii: o parte din efort merge spre conținut ușor de citat și spre mențiuni externe, nu doar spre poziții în Google."}},{"@type":"Question","name":"Cât durează până văd rezultate?","acceptedAnswer":{"@type":"Answer","text":"În ambele cazuri vorbim de luni, nu de săptămâni. În GEO, primele apariții pot veni mai repede pe întrebări de nișă, dar consolidarea durează, pentru că sursele externe se construiesc în timp."}},{"@type":"Question","name":"Ce măsor concret în GEO?","acceptedAnswer":{"@type":"Answer","text":"De câte ori apari în răspunsurile la un set fix de întrebări, ce surse sunt citate, câte citări ai în raportul AI Performance din Bing și câte vizite vin din chatgpt.com, perplexity.ai sau copilot.microsoft.com în Analytics."}}]}]}'
  ogimg='/assets/og-geo-vs-seo.jpg'
  ogalt='Două discuri de sticlă care se suprapun, unul albastru și unul auriu, ca zona comună dintre SEO și GEO'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('GEO vs SEO','/blog/geo-vs-seo') ))
  <span class="eyebrow">Ghid &middot; GEO</span>
  <h1>GEO vs SEO: care e diferența <span class="g">și de ce ai nevoie de ambele</span></h1>
</div></section>
<section><div class="wrap"><article class="prose">
  <p class="meta">Actualizat: octombrie 2026 &middot; ~8 min de citit</p>
  <p>Întrebarea vine des: „Acum că oamenii întreabă AI-ul, mai am nevoie de SEO sau trec pe GEO?”. Răspunsul scurt e că ai nevoie de amândouă, pentru că pornesc din aceeași fundație. Diferă însă rezultatul pe care îl urmărești, semnalele care contează și felul în care măsori.</p>
  <div class="pescurt"><p><strong>Pe scurt:</strong> SEO te ajută să apari cât mai sus în rezultatele Google și să primești click-uri. GEO te ajută să fii citat sau recomandat în răspunsurile generate de AI: ChatGPT, Perplexity, Copilot, rezumatele AI și Modul AI din Google. GEO nu înlocuiește SEO: fără pagini indexate și de încredere, nu ai ce să fie citat.</p></div>
  <figure class="art-visual"><img src="/assets/blog-geo-seo-1.webp" srcset="/assets/blog-geo-seo-1-mic.webp 800w, /assets/blog-geo-seo-1.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="eager" decoding="async" style="height:auto" alt="Două discuri de sticlă care se suprapun, unul albastru și unul auriu, ca zona comună dintre SEO și GEO"></figure>
  <h2>Ce este SEO</h2>
  <p>SEO (Search Engine Optimization) înseamnă să faci un site ușor de găsit, de înțeles și de ales în motoarele de căutare. Lucrezi pe trei planuri: tehnic (viteză, indexare, structură), conținut (pagini care răspund la ce caută oamenii) și autoritate (linkuri și mențiuni de pe alte site-uri). Rezultatul se vede în poziția ta în listă și în click-urile pe care le primești.</p>
  <h2>Ce este GEO</h2>
  <p>GEO (Generative Engine Optimization) e un termen propus în 2023 de cercetători de la Princeton și de la alte universități, într-un studiu prezentat apoi la conferința KDD 2024. Desemnează optimizarea pentru motoarele care nu mai dau o listă de linkuri, ci un răspuns scris, sintetizat din mai multe surse.</p>
  <p>În România, subiectul a devenit practic în ultimul an. Pe lângă ChatGPT și Perplexity, Google a lansat în octombrie 2025 Modul AI și în limba română, așa că un client poate primi o recomandare completă fără să mai vadă lista clasică de rezultate. În GEO câștigi când AI-ul te numește, te citează ca sursă sau pune linkul tău în răspuns.</p>
  <h2>Diferența, punct cu punct</h2>
  <table class="cmp">
    <thead><tr><th></th><th>SEO</th><th>GEO</th></tr></thead>
    <tbody>
      <tr><td>Unde apari</td><td data-label="SEO">în lista de rezultate Google și Bing</td><td data-label="GEO">în răspunsul scris de ChatGPT, Perplexity, Copilot sau rezumatele AI Google</td></tr>
      <tr><td>Cine alege</td><td data-label="SEO">omul, dintre zece rezultate</td><td data-label="GEO">asistentul AI, care numește de obicei câteva surse</td></tr>
      <tr><td>Ce câștigi</td><td data-label="SEO">un click spre site</td><td data-label="GEO">o mențiune, o recomandare sau un link citat</td></tr>
      <tr><td>Ce contează mai mult</td><td data-label="SEO">relevanță, linkuri, experiența paginii</td><td data-label="GEO">răspunsuri clare, date verificabile, aceleași informații despre tine în mai multe surse</td></tr>
      <tr><td>Cine îți citește site-ul</td><td data-label="SEO">Googlebot, Bingbot</td><td data-label="GEO">aceiași, plus roboții AI, de exemplu OAI-SearchBot</td></tr>
      <tr><td>Cum măsori</td><td data-label="SEO">Search Console: afișări, click-uri, poziții</td><td data-label="GEO">teste lunare, citări în Bing Webmaster Tools, vizite din chatgpt.com în Analytics</td></tr>
    </tbody>
  </table>
  <figure class="art-visual"><img src="/assets/blog-geo-seo-2.webp" srcset="/assets/blog-geo-seo-2-mic.webp 800w, /assets/blog-geo-seo-2.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="Un teanc vertical de plăci subțiri albastre lângă un singur panou auriu, ca lista de rezultate față de un singur răspuns AI"></figure>
  <h2>Un exemplu: aceeași nevoie, două rezultate</h2>
  <p>Să luăm, ca exemplu ipotetic, o clinică stomatologică din Cluj. Un pacient caută în Google „implant dentar Cluj” și vede zece rezultate: clinici, directoare, poate un articol despre prețuri. Clinica primește click-uri dacă e printre primele poziții și dacă titlul și descrierea o scot în evidență. Asta e SEO.</p>
  <p>Același pacient îl întreabă pe ChatGPT: „ce clinică îmi recomanzi pentru un implant în Cluj și cam cât costă?”. Primește două-trei nume, un interval de preț și câteva surse. Clinica apare doar dacă asistentul găsește despre ea informații clare și confirmate: o pagină cu prețuri orientative și pașii tratamentului, recenzii, prezență în directoarele medicale. Asta e GEO.</p>
  <p>Pagina despre implanturi e aceeași în ambele cazuri. Diferă ce e în jurul ei: în SEO contează mai ales poziția paginii, în GEO contează și ce spun alte surse despre clinică.</p>
  <h2>Unde se suprapun</h2>
  <p>Mai mult decât pare. Google spune explicit că pentru a apărea în rezumatele AI și în Modul AI nu există cerințe speciale: pagina trebuie să fie indexată și eligibilă pentru un fragment în rezultate. Cu alte cuvinte, bunele practici SEO sunt condiția de bază și pentru vizibilitatea în AI-ul Google.</p>
  <p>Și asistenții care caută pe internet, cum e ChatGPT, se sprijină pe ce găsesc indexat. Un site lent, cu pagini blocate sau duplicate, pierde în ambele lumi. Fundația comună:</p>
  <ul>
    <li>pagini indexate, rapide, fără erori tehnice;</li>
    <li>conținut util, scris pentru oameni și actualizat;</li>
    <li>structură clară: titluri, subtitluri, liste, date structurate;</li>
    <li>o identitate coerentă a firmei: același nume, aceeași adresă, aceleași servicii peste tot.</li>
  </ul>
  <h2>Unde diferă</h2>
  <h3>1. Răspunsul contează mai mult decât poziția</h3>
  <p>În SEO, locul patru încă aduce click-uri. Într-un răspuns AI, fie ești printre cele două-trei nume, fie nu exiști. De aceea paginile au nevoie de fragmente ușor de citat: o definiție clară, un preț orientativ, un pas concret.</p>
  <h3>2. Contează ce spun alții despre tine</h3>
  <p>Linkurile rămân importante în SEO. Pentru GEO contează și mențiunile fără link: directoare, recenzii, articole, profiluri pe platformele din nișa ta. Un model AI e mai sigur pe o firmă descrisă la fel în mai multe surse.</p>
  <h3>3. Datele verificabile câștigă</h3>
  <p>Studiul care a introdus termenul GEO a arătat că adăugarea de surse, citate și statistici poate crește vizibilitatea unui text în răspunsurile generative cu până la 40%, cu diferențe între domenii. Afirmațiile vagi, de tipul „suntem cei mai buni”, nu au ce să ofere unui model care caută dovezi.</p>
  <h3>4. Contează și alți roboți și alte motoare</h3>
  <p>Bing contează pentru AI mai mult decât ai crede după cota lui din căutarea clasică: alimentează Copilot, iar Bing Webmaster Tools are din februarie 2026 un raport separat cu citările din răspunsurile AI. Pentru ChatGPT, robotul OAI-SearchBot trebuie lăsat să citească site-ul. Detaliile sunt în ghidul <a href="/blog/cum-apari-in-chatgpt/">cum apari în ChatGPT</a>.</p>
  <h3>5. Măsurarea e mai puțin precisă</h3>
  <p>Search Console îți dă afișări, click-uri și poziții. Pentru AI combini teste manuale lunare, raportul de citări din Bing și vizitele din chatgpt.com sau perplexity.ai din Google Analytics. Google include vizitele din funcțiile AI în raportul de performanță obișnuit, la tipul Web.</p>
  <h2>Cum le combini în practică</h2>
  <ol>
    <li>Repari fundația tehnică: indexare, viteză, pagini duplicate, harta site-ului trimisă în Google și în Bing.</li>
    <li>Verifici accesul roboților: robots.txt și protecțiile site-ului (Cloudflare, firewall) nu trebuie să blocheze roboții de căutare AI.</li>
    <li>Construiești pagini pe întrebările reale ale clienților: servicii, prețuri, comparații, întrebări frecvente.</li>
    <li>Scrii fiecare pagină cu răspunsul la început și cu date verificabile.</li>
    <li>Aliniezi datele firmei peste tot: site, profilul Google, directoare, rețele sociale.</li>
    <li>Construiești mențiuni: recenzii reale, articole, parteneriate, prezență în publicațiile din nișă.</li>
    <li>Măsori lunar ambele lumi: Search Console pentru SEO, testele și citările pentru GEO.</li>
  </ol>
  <p>Ordinea contează. Pașii 1-4 aduc rezultate în SEO și pregătesc terenul pentru AI, iar pașii 5-6 cântăresc mai mult pentru recomandările AI.</p>
  <figure class="art-visual"><img src="/assets/blog-geo-seo-3.webp" srcset="/assets/blog-geo-seo-3-mic.webp 800w, /assets/blog-geo-seo-3.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="O fundație din blocuri de sticlă din care se ridică două turnuri, unul albastru și unul auriu, ca SEO și GEO construite pe aceeași bază"></figure>
  <h2>Greșeli frecvente</h2>
  <ul>
    <li>Să tratezi GEO ca pe un înlocuitor al SEO. Fără pagini indexate și de încredere, nu ai ce să fie citat.</li>
    <li>Să ignori Bing pentru că „nu-l folosește nimeni”. Copilot îl folosește.</li>
    <li>Să crezi că un fișier special, de exemplu llms.txt, rezolvă vizibilitatea în AI. Google spune că nu are nevoie de astfel de fișiere.</li>
    <li>Să scrii pentru algoritm în loc de om. Ambele sisteme răsplătesc textul clar și util.</li>
  </ul>
  <h2>Întrebări frecvente</h2>
  <div class="faq" style="margin-top:10px">
    <details><summary>GEO înlocuiește SEO?</summary><p>Nu. Rezumatele AI și asistenții care caută pe internet folosesc pagini pe care le găsesc indexate. SEO e fundația, iar GEO se construiește peste ea.</p></details>
    <details><summary>Am nevoie de buget separat pentru GEO?</summary><p>De obicei nu de un buget separat, ci de o altă împărțire a muncii: o parte din efort merge spre conținut ușor de citat și spre mențiuni externe, nu doar spre poziții în Google.</p></details>
    <details><summary>Cât durează până văd rezultate?</summary><p>În ambele cazuri vorbim de luni, nu de săptămâni. În GEO, primele apariții pot veni mai repede pe întrebări de nișă, dar consolidarea durează, pentru că sursele externe se construiesc în timp.</p></details>
    <details><summary>Ce măsor concret în GEO?</summary><p>De câte ori apari în răspunsurile la un set fix de întrebări, ce surse sunt citate, câte citări ai în raportul AI Performance din Bing și câte vizite vin din chatgpt.com, perplexity.ai sau copilot.microsoft.com în Analytics.</p></details>
  </div>
  <div class="key" style="margin-top:30px"><p style="margin:0">Le lucrăm pe amândouă împreună, în serviciul <a href="/servicii/seo-geo/">SEO + GEO</a>. Dacă vrei să știi unde ești acum în Google și în AI, cere <a href="/audit-gratuit/">auditul gratuit</a>: primești analiza în 24 de ore. Pentru tot tabloul, citește <a href="/blog/ghid-geo/">ghidul complet de GEO</a>.</p></div>
  <h2>Surse</h2>
  <ul class="surse">
    <li><a href="https://arxiv.org/abs/2311.09735" target="_blank" rel="noopener">Aggarwal și alții, „GEO: Generative Engine Optimization”, KDD 2024</a></li>
    <li><a href="https://developers.google.com/search/docs/appearance/ai-features" target="_blank" rel="noopener">Google Search Central, „AI features and your website”</a></li>
    <li><a href="https://blog.google/intl/ro-ro/produse/cautarile-google-in-modul-ai-disponibile-in-romania/" target="_blank" rel="noopener">Google România, „Căutările Google în Modul AI, disponibile în România”, 8 octombrie 2025</a></li>
    <li><a href="https://blogs.bing.com/webmaster/February-2026/Introducing-AI-Performance-in-Bing-Webmaster-Tools-Public-Preview" target="_blank" rel="noopener">Bing Webmaster Blog, „Introducing AI Performance in Bing Webmaster Tools Public Preview”, februarie 2026</a></li>
    <li><a href="https://developers.openai.com/api/docs/bots" target="_blank" rel="noopener">OpenAI, „Overview of OpenAI Crawlers”</a></li>
  </ul>
</article></div></section>
"@
}

# ---- BLOG: 7 greseli buget ads ----
$pages += @{
  path='blog/greseli-buget-google-ads'
  title='7 greșeli care îți ard bugetul de Google Ads | AMPLIO'
  desc='Greșelile care consumă bugetul de Google Ads fără clienți: măsurare, setări implicite, cuvinte cheie negative, pagini slabe. Cum le recunoști și le repari.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Greșeli buget ads','/blog/greseli-buget-google-ads') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Article","headline":"7 greșeli care îți ard bugetul de Google Ads","description":"Greșelile care consumă bugetul de Google Ads fără clienți: măsurare, setări implicite, cuvinte cheie negative, pagini slabe. Cum le recunoști și le repari.","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18","dateModified":"2026-10-17"},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Ce buget minim are sens pentru Google Ads?","acceptedAnswer":{"@type":"Answer","text":"Depinde de costul pe click din domeniul tău. Cifre pentru România găsești în articolul cât costă Google Ads în România. Regula practică: bugetul trebuie să permită suficiente click-uri pe lună ca să apară primele conversii."}},{"@type":"Question","name":"Merită Performance Max pentru o firmă mică?","acceptedAnswer":{"@type":"Answer","text":"Poate merge bine pentru magazinele online cu feed de produse și conversii măsurate corect. Fără măsurare și fără date, e greu de controlat. De obicei pornim cu campanii de căutare și adăugăm Performance Max după ce avem conversii."}},{"@type":"Question","name":"Cât de des trebuie optimizat contul?","acceptedAnswer":{"@type":"Answer","text":"Săptămânal în primele luni: termeni de căutare, buget, anunțuri. După ce contul se stabilizează, verificările săptămânale rămân, iar schimbările mari se fac lunar, pe baza datelor."}},{"@type":"Question","name":"Pot face totul singur?","acceptedAnswer":{"@type":"Answer","text":"Da, dacă ai timp în fiecare săptămână pentru cont. Greșelile de mai sus nu cer unelte speciale, doar disciplină. Un audit extern ajută când nu ești sigur ce măsori sau unde se duc banii."}}]}]}'
  ogimg='/assets/og-greseli-buget-google-ads.jpg'
  ogalt='O pâlnie de sticlă prin care se scurg și se pierd monede aurii, ca bugetul de reclame consumat de greșeli'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Greșeli buget ads','/blog/greseli-buget-google-ads') ))
  <span class="eyebrow">Performance Ads</span>
  <h1>7 greșeli care <span class="g">îți ard bugetul de Google Ads</span></h1>
</div></section>
<section><div class="wrap"><article class="prose">
  <p class="meta">Actualizat: octombrie 2026 &middot; ~9 min de citit</p>
  <p>Cele mai multe firme nu au o problemă de buget la Google Ads, au o problemă de risipă. Aceiași bani, cheltuiți pe căutările potrivite și măsurați corect, aduc de obicei mai mulți clienți. Mai jos sunt cele 7 greșeli pe care le vedem cel mai des în conturi, cum le recunoști și cum le repari.</p>
  <div class="pescurt"><p><strong>Pe scurt:</strong> Cele mai scumpe greșeli sunt cheltuiala fără măsurare corectă, setările implicite lăsate neverificate, potrivirea largă fără cuvinte cheie negative, paginile de destinație slabe, recomandările aplicate automat, urmărirea metricilor greșite și anunțurile netestate. Niciuna nu cere buget în plus, doar disciplină săptămânală.</p></div>
  <figure class="art-visual"><img src="/assets/blog-greseli-ads-1.webp" srcset="/assets/blog-greseli-ads-1-mic.webp 800w, /assets/blog-greseli-ads-1.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="eager" decoding="async" style="height:auto" alt="O pâlnie de sticlă prin care se scurg și se pierd monede aurii, ca bugetul de reclame consumat de greșeli"></figure>
  <h2>1. Cheltui înainte să măsori</h2>
  <p>Fără măsurarea conversiilor nu știi ce campanie aduce clienți și ce campanie doar consumă bani. Iar fără conversii, licitarea automată a Google nu are după ce să se optimizeze.</p>
  <p><strong>Cum o recunoști:</strong> coloana „Conversii” e goală sau arată mult mai puțin decât cererile pe care le primești; nu știi câte apeluri au venit din reclame.</p>
  <p><strong>Cum o repari:</strong></p>
  <ul>
    <li>definește ce înseamnă o conversie pentru tine: formular trimis, apel, comandă, mesaj pe WhatsApp;</li>
    <li>fă un test real pentru fiecare acțiune și verifică să apară în cont;</li>
    <li>în UE, cookie-urile de reclamă se folosesc doar cu acordul vizitatorului, iar Google primește acest acord prin Consent Mode; dacă e configurat greșit, pierzi conversii din rapoarte;</li>
    <li>abia apoi pornești bugetul.</li>
  </ul>
  <p>Regula noastră: niciun leu pe reclame până nu e verificată măsurarea cu teste reale.</p>
  <h2>2. Lași setările implicite neverificate</h2>
  <p>La crearea unei campanii, Google propune setări care măresc acoperirea. Nu sunt greșite în sine, dar nu se potrivesc oricărei afaceri.</p>
  <ul>
    <li><strong>Locația:</strong> opțiunea implicită și recomandată de Google este „Prezență sau interes”, care arată reclamele oamenilor din zona aleasă, dar și celor care doar s-au arătat interesați de ea. Pentru un serviciu local, cum e o clinică sau un service auto, „Prezență” (oameni aflați sau prezenți regulat în zonă) e de obicei mai potrivită.</li>
    <li><strong>Rețelele:</strong> verifică dacă în campania de căutare sunt bifate rețeaua de parteneri de căutare și rețeaua de display. Display-ul aduce mult trafic ieftin, dar de alt tip decât căutarea; dacă îl vrei, fă-i o campanie separată.</li>
    <li><strong>Programul:</strong> dacă nu poți răspunde la telefon noaptea, ia în calcul să reduci sau să oprești reclamele în orele în care nu poți prelua clientul.</li>
  </ul>
  <figure class="art-visual"><img src="/assets/blog-greseli-ads-2.webp" srcset="/assets/blog-greseli-ads-2-mic.webp 800w, /assets/blog-greseli-ads-2.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="Un panou de control din sticlă cu comutatoare albastre și unul auriu, ca setările de campanie care trebuie verificate"></figure>
  <h2>3. Folosești potrivirea largă fără cuvinte cheie negative</h2>
  <p>În Google Ads, potrivirea largă e tipul implicit pentru orice cuvânt cheie, iar reclama ta poate apărea la căutări înrudite, uneori surprinzător de departe de ce vinzi. Google recomandă potrivirea largă împreună cu licitarea inteligentă (Smart Bidding), care învață din conversii. Fără conversii măsurate și fără o listă de cuvinte cheie negative, plătești pentru căutări care nu au legătură cu oferta ta.</p>
  <p><strong>Cum o recunoști:</strong> în raportul „Termeni de căutare” găsești căutări despre joburi, cursuri, „gratuit”, produse pe care nu le ai sau orașe în care nu lucrezi.</p>
  <p><strong>Cum o repari:</strong></p>
  <ul>
    <li>citește raportul de termeni de căutare săptămânal, mai ales în primele luni;</li>
    <li>construiește o listă de cuvinte cheie negative, de exemplu gratuit, job, angajare, curs, second hand, după caz;</li>
    <li>la bugete mici sau fără istoric de conversii, pornește cu potrivirea expresie și exactă, iar potrivirea largă las-o pentru când ai date.</li>
  </ul>
  <p>Ultimul punct e recomandarea noastră pentru conturile mici, nu o regulă Google.</p>
  <h2>4. Trimiți traficul pe o pagină slabă</h2>
  <p>Un anunț bun care duce pe o pagină confuză e bani pierduți. Pagina trebuie să continue exact promisiunea din anunț. Verifică:</p>
  <ul>
    <li>aceeași ofertă și aceleași cuvinte ca în anunț;</li>
    <li>o singură acțiune principală, vizibilă pe telefon fără derulare;</li>
    <li>numărul de telefon ca link pe care se poate apăsa;</li>
    <li>încărcare rapidă pe mobil;</li>
    <li>dovezi: recenzii, prețuri orientative, răspunsuri la întrebările frecvente.</li>
  </ul>
  <p>Despre asta e serviciul de <a href="/servicii/landing-pages-cro/">landing pages și CRO</a>.</p>
  <h2>5. Lași contul pe pilot automat</h2>
  <p>Campaniile neatinse se degradează: apar căutări noi, concurența își schimbă licitările, anunțurile obosesc. În plus, Google poate aplica automat anumite recomandări, dacă ai activat această opțiune în cont.</p>
  <p><strong>Cum o repari:</strong></p>
  <ul>
    <li>verifică în secțiunea „Recomandări” ce tipuri se aplică automat și păstrează doar ce înțelegi și vrei; istoricul îți arată ce s-a aplicat deja;</li>
    <li>stabilește o rutină săptămânală: termeni de căutare, buget pe campanii, anunțuri noi, cuvinte cheie negative;</li>
    <li>notează fiecare schimbare, ca să știi ce a produs un efect.</li>
  </ul>
  <h2>6. Urmărești metricile greșite</h2>
  <p>Click-urile ieftine și afișările multe arată bine în raport, dar nu plătesc salarii. Ce contează: costul pe client nou și venitul generat.</p>
  <table class="cmp">
    <thead><tr><th>Metrica</th><th>Ce îți spune</th><th>Capcana</th></tr></thead>
    <tbody>
      <tr><td>Rata de click (CTR)</td><td data-label="Ce îți spune">cât de atractiv e anunțul</td><td data-label="Capcana">un anunț vag poate atrage click-uri fără clienți</td></tr>
      <tr><td>Costul pe click</td><td data-label="Ce îți spune">cât plătești pentru o vizită</td><td data-label="Capcana">click-urile ieftine vin des din căutări irelevante</td></tr>
      <tr><td>Conversii</td><td data-label="Ce îți spune">câte acțiuni utile au loc</td><td data-label="Capcana">contează doar dacă măsurarea e corectă</td></tr>
      <tr><td>Costul pe conversie</td><td data-label="Ce îți spune">cât te costă o cerere</td><td data-label="Capcana">o cerere nu e încă un client</td></tr>
      <tr><td>Venitul sau ROAS</td><td data-label="Ce îți spune">cât aduce fiecare leu investit</td><td data-label="Capcana">are nevoie de valori reale de vânzare</td></tr>
    </tbody>
  </table>
  <p>Dacă vinzi prin telefon sau prin ofertă, leagă cererile din reclame de vânzările reale, chiar și într-un simplu tabel lunar. Altfel optimizezi pe formulare, nu pe clienți.</p>
  <h2>7. Nu testezi anunțurile</h2>
  <p>Un anunț responsiv de căutare acceptă până la 15 titluri și 4 descrieri, iar Google le combină în funcție de căutare. Dacă scrii doar trei titluri aproape identice, sistemul nu are ce testa.</p>
  <ul>
    <li>scrie titluri pe unghiuri diferite: preț, rapiditate, garanție, zonă, experiență;</li>
    <li>fixează un titlu pe o poziție doar când e obligatoriu, de exemplu pentru o mențiune legală, pentru că fiecare fixare reduce combinațiile;</li>
    <li>înlocuiește lunar titlurile cu rezultate slabe.</li>
  </ul>
  <figure class="art-visual"><img src="/assets/blog-greseli-ads-3.webp" srcset="/assets/blog-greseli-ads-3-mic.webp 800w, /assets/blog-greseli-ads-3.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="Un filtru de sticlă prin care trec doar câteva particule aurii din multe albastre, ca o campanie care plătește doar pentru căutările potrivite"></figure>
  <h2>Verificarea de 30 de minute</h2>
  <p>Dacă ai acces la cont, poți face singur o primă verificare:</p>
  <ol>
    <li>Conversiile apar și seamănă cu realitatea din ultimele 30 de zile?</li>
    <li>Locația e setată pe zona în care chiar lucrezi sau livrezi?</li>
    <li>Campaniile de căutare au bifate display-ul și partenerii de căutare fără să știi?</li>
    <li>Raportul de termeni de căutare conține căutări irelevante?</li>
    <li>Există o listă de cuvinte cheie negative?</li>
    <li>Ce recomandări se aplică automat?</li>
    <li>Fiecare grup de anunțuri are cel puțin un anunț cu 10 sau mai multe titluri diferite?</li>
  </ol>
  <p>Fiecare „nu știu” sau „da, din păcate” e un loc pe unde se pierd bani.</p>
  <h2>Întrebări frecvente</h2>
  <div class="faq" style="margin-top:10px">
    <details><summary>Ce buget minim are sens pentru Google Ads?</summary><p>Depinde de costul pe click din domeniul tău. Cifre pentru România găsești în articolul <a href="/blog/cost-google-ads-romania/">cât costă Google Ads în România</a>. Regula practică: bugetul trebuie să permită suficiente click-uri pe lună ca să apară primele conversii.</p></details>
    <details><summary>Merită Performance Max pentru o firmă mică?</summary><p>Poate merge bine pentru magazinele online cu feed de produse și conversii măsurate corect. Fără măsurare și fără date, e greu de controlat. De obicei pornim cu campanii de căutare și adăugăm Performance Max după ce avem conversii.</p></details>
    <details><summary>Cât de des trebuie optimizat contul?</summary><p>Săptămânal în primele luni: termeni de căutare, buget, anunțuri. După ce contul se stabilizează, verificările săptămânale rămân, iar schimbările mari se fac lunar, pe baza datelor.</p></details>
    <details><summary>Pot face totul singur?</summary><p>Da, dacă ai timp în fiecare săptămână pentru cont. Greșelile de mai sus nu cer unelte speciale, doar disciplină. Un audit extern ajută când nu ești sigur ce măsori sau unde se duc banii.</p></details>
  </div>
  <div class="key" style="margin-top:30px"><p style="margin:0">Suspectezi că arzi bani pe reclame? Cere <a href="/audit-gratuit/">auditul gratuit</a>: ne uităm la contul tău și îți spunem unde pierzi, în 24 de ore. Serviciul complet: <a href="/servicii/google-ads/">administrare Google Ads</a>.</p></div>
  <h2>Surse</h2>
  <ul class="surse">
    <li><a href="https://support.google.com/google-ads/answer/7478529" target="_blank" rel="noopener">Google Ads Help, „About broad match”</a></li>
    <li><a href="https://support.google.com/google-ads/answer/1722038" target="_blank" rel="noopener">Google Ads Help, „About advanced location options”</a></li>
    <li><a href="https://support.google.com/google-ads/answer/7684791" target="_blank" rel="noopener">Google Ads Help, „About responsive search ads”</a></li>
    <li><a href="https://support.google.com/google-ads/answer/10279006" target="_blank" rel="noopener">Google Ads Help, „About auto-apply recommendations”</a></li>
    <li><a href="https://support.google.com/google-ads/answer/10000067" target="_blank" rel="noopener">Google Ads Help, „About consent mode”</a></li>
  </ul>
</article></div></section>
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
  title='Google Ads vs Meta Ads: cu care începi în 2026? | AMPLIO'
  desc='Google Ads prinde cererea care există deja, Meta Ads creează cerere. Cum alegi canalul după tipul afacerii, buget și timpul până la rezultate.'
  crumbsJson=(Crumbs @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Google Ads vs Meta Ads','/blog/google-ads-vs-meta-ads') ))
  jsonld='{"@context":"https://schema.org","@graph":[{"@type":"Article","headline":"Google Ads vs Meta Ads: cu care începi?","description":"Google Ads prinde cererea care există deja, Meta Ads creează cerere. Cum alegi canalul după tipul afacerii, buget și timpul până la rezultate.","author":{"@type":"Organization","name":"AMPLIO"},"publisher":{"@type":"Organization","@id":"https://amplio.ro/#organization","name":"AMPLIO","url":"https://amplio.ro/","logo":{"@type":"ImageObject","url":"https://amplio.ro/assets/amplio-logo-512.png"}},"inLanguage":"ro","datePublished":"2026-06-18","dateModified":"2026-10-17"},{"@type":"FAQPage","mainEntity":[{"@type":"Question","name":"Care e mai ieftin, Google sau Meta?","acceptedAnswer":{"@type":"Answer","text":"Prețul pe click nu e o comparație corectă: pe Meta plătești de obicei afișări, pe Google click-uri, iar intenția diferă. Compară costul pe client nou, pe aceeași perioadă."}},{"@type":"Question","name":"Pot începe cu un buget mic?","acceptedAnswer":{"@type":"Answer","text":"Da, dacă îl concentrezi pe un singur canal și pe o singură ofertă. Cu buget mic, căutările foarte precise pe Google sunt de obicei mai previzibile; pe Meta ai nevoie de răbdare cu faza de învățare."}},{"@type":"Question","name":"Am nevoie de site ca să fac reclame pe Meta?","acceptedAnswer":{"@type":"Answer","text":"Nu neapărat. Meta are formulare care se completează direct în aplicație, utile pentru cereri de ofertă. Pentru vânzări online și pentru Google Ads ai nevoie însă de o pagină de destinație bună."}},{"@type":"Question","name":"Unde intră TikTok?","acceptedAnswer":{"@type":"Answer","text":"Funcționează ca Meta: creează cerere, prin video scurt. Merge bine pentru produsele care arată bine în video și pentru un public mai tânăr. De obicei îl adaugi după ce Google sau Meta sunt stabile."}},{"@type":"Question","name":"În cât timp văd rezultate?","acceptedAnswer":{"@type":"Answer","text":"Pe Google, primele cereri pot veni din primele zile, dacă există căutări. Pe Meta, primele 1-2 săptămâni sunt de obicei de învățare. Pentru concluzii solide, judecă orice canal după cel puțin 4-6 săptămâni de date."}}]}]}'
  ogimg='/assets/og-google-ads-vs-meta-ads.jpg'
  ogalt='Două drumuri de sticlă, unul drept și unul ca o panglică plină de plăci, care duc spre același cub auriu, ca Google și Meta care aduc clienți pe căi diferite'
  body=@"
<section class="subhero"><div class="grid-bg"></div><div class="wrap">
  $(CrumbsHtml @( ,@('Acasă','/'); ,@('Blog','/blog'); ,@('Google Ads vs Meta Ads','/blog/google-ads-vs-meta-ads') ))
  <span class="eyebrow">Performance Ads</span>
  <h1>Google Ads vs Meta Ads: <span class="g">cu care începi?</span></h1>
</div></section>
<section><div class="wrap"><article class="prose">
  <p class="meta">Actualizat: octombrie 2026 &middot; ~8 min de citit</p>
  <p>Nu e o întrecere în care unul câștigă. Google Ads și Meta Ads (Facebook și Instagram) rezolvă probleme diferite. Întrebarea corectă nu e „care e mai bun”, ci „care se potrivește obiectivului meu de acum și bugetului pe care îl am”.</p>
  <div class="pescurt"><p><strong>Pe scurt:</strong> Google Ads prinde cererea care există deja: apari când cineva caută ce vinzi. Meta Ads creează cerere: ajungi la oameni care nu te caută încă, pe baza intereselor și a comportamentului. Dacă clienții te caută deja, începe cu Google. Dacă produsul se vinde prin imagine sau trebuie întâi descoperit, începe cu Meta. Cu buget mic, un singur canal făcut bine bate două canale făcute pe jumătate.</p></div>
  <figure class="art-visual"><img src="/assets/blog-google-vs-meta-1.webp" srcset="/assets/blog-google-vs-meta-1-mic.webp 800w, /assets/blog-google-vs-meta-1.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="eager" decoding="async" style="height:auto" alt="Două drumuri de sticlă, unul drept și unul ca o panglică plină de plăci, care duc spre același cub auriu, ca Google și Meta care aduc clienți pe căi diferite"></figure>
  <h2>Diferența de fond: intenție și atenție</h2>
  <p>Pe Google, omul are o întrebare: „dentist Cluj”, „firmă de mutări București”, „cât costă o centrală”. Reclama ta apare exact în momentul în care caută. Conversia vine de obicei mai repede, dar click-ul e mai scump, pentru că plătești pentru o intenție clară.</p>
  <p>Pe Facebook și Instagram, oamenii nu caută, ci derulează. Tu îi întrerupi cu o imagine sau un video relevant, pe baza intereselor, a vârstei, a zonei și a comportamentului. E potrivit pentru produse vizuale, pentru oferte noi și pentru a ajunge la oameni care nu știu încă de tine.</p>
  <h2>Comparația pe scurt</h2>
  <table class="cmp">
    <thead><tr><th></th><th>Google Ads (căutare)</th><th>Meta Ads</th></tr></thead>
    <tbody>
      <tr><td>Când apare reclama</td><td data-label="Google Ads (căutare)">când omul caută ceva</td><td data-label="Meta Ads">când omul derulează feed-ul sau poveștile</td></tr>
      <tr><td>Intenția</td><td data-label="Google Ads (căutare)">ridicată, omul are deja o nevoie</td><td data-label="Meta Ads">variabilă, trebuie trezită</td></tr>
      <tr><td>Formatul</td><td data-label="Google Ads (căutare)">text, plus telefon, adresă și linkuri suplimentare</td><td data-label="Meta Ads">imagine, video, carusel</td></tr>
      <tr><td>Plata</td><td data-label="Google Ads (căutare)">de obicei pe click</td><td data-label="Meta Ads">de obicei pe afișări, cu optimizare pe rezultatul ales</td></tr>
      <tr><td>Primele date</td><td data-label="Google Ads (căutare)">din primele zile, dacă există căutări</td><td data-label="Meta Ads">după faza de învățare, de obicei în jur de 50 de rezultate pe săptămână pentru un set de reclame</td></tr>
      <tr><td>Potrivit pentru</td><td data-label="Google Ads (căutare)">servicii căutate, urgențe, B2B, produse cunoscute</td><td data-label="Meta Ads">produse vizuale, lansări, oferte, remarketing</td></tr>
    </tbody>
  </table>
  <figure class="art-visual"><img src="/assets/blog-google-vs-meta-2.webp" srcset="/assets/blog-google-vs-meta-2-mic.webp 800w, /assets/blog-google-vs-meta-2.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="O săgeată de sticlă îndreptată spre o țintă aurie lângă un nor de plăci care se aprind albastru, ca intenția de căutare față de atenția din feed"></figure>
  <h2>Cum alegi după tipul afacerii</h2>
  <ul>
    <li><strong>Servicii locale și urgențe</strong> (instalatori, service auto, clinici): Google întâi. Oamenii caută activ, iar apelul vine repede.</li>
    <li><strong>Servicii B2B</strong> (contabilitate, consultanță, producție la comandă): Google pe căutările cu intenție clară, apoi remarketing.</li>
    <li><strong>Magazin online cu produse vizuale</strong> (modă, decor, cosmetice): Meta pentru descoperire, Google Shopping pentru cei care caută deja produsul.</li>
    <li><strong>Lansări și produse noi, pe care nu le caută nimeni încă:</strong> Meta întâi, ca să creezi cererea; Google când apar căutările.</li>
    <li><strong>Restaurante și HoReCa:</strong> Meta pentru zona ta și pentru evenimente, plus profilul de companie Google pentru „unde mâncăm”.</li>
    <li><strong>Imobiliare:</strong> Meta pentru audiențe largi și formulare, Google pentru căutările după proiect și zonă.</li>
  </ul>
  <h2>Bugetul minim realist</h2>
  <p>Meta spune că un set de reclame iese din faza de învățare, de obicei, după aproximativ 50 de rezultate în săptămâna de după ultima modificare importantă. Dacă un rezultat, de exemplu un formular completat, te costă 40 de lei, ai nevoie de aproximativ 2.000 de lei pe săptămână pe un singur set ca să ieși repede din învățare. Cu buget mai mic, setul rămâne cu învățare limitată și rezultatele sunt mai instabile. Nu înseamnă că nu merge, ci că ai nevoie de răbdare și de mai puține seturi.</p>
  <p>Pe Google, bugetul depinde de costul pe click din domeniul tău și de câte click-uri îți trebuie până la o vânzare. Cifre pentru România găsești în articolul <a href="/blog/cost-google-ads-romania/">cât costă Google Ads în România</a>.</p>
  <p>În ambele cazuri regula e aceeași: concentrează bugetul. Mai bine o campanie cu destui bani ca să învețe decât cinci campanii înfometate.</p>
  <h2>Când le folosești pe amândouă</h2>
  <p>Pe termen lung, cele două se completează: Meta creează cererea, Google o culege. Cineva vede reclama ta pe Instagram, nu cumpără, dar peste o săptămână te caută pe Google după nume sau după produs. Dacă măsori doar ultimul click, Google pare să facă toată treaba, iar Meta pare inutil.</p>
  <p>O combinație simplă pentru început: Google pe căutări, plus o campanie mică de remarketing pe Meta pentru cei care au vizitat site-ul și nu au cerut ofertă. Bugetul de remarketing rămâne mic, pentru că publicul e mic, iar oamenii aceia te cunosc deja.</p>
  <p>Semne că e momentul pentru al doilea canal:</p>
  <ul>
    <li>primul canal e stabil și profitabil de cel puțin 2-3 luni;</li>
    <li>bugetul permite al doilea canal fără să-l înfometeze pe primul;</li>
    <li>măsurarea e pusă pe ambele: pixelul și conversiile Meta, conversiile Google, același cont de Analytics.</li>
  </ul>
  <figure class="art-visual"><img src="/assets/blog-google-vs-meta-3.webp" srcset="/assets/blog-google-vs-meta-3-mic.webp 800w, /assets/blog-google-vs-meta-3.webp 1600w" sizes="(max-width: 816px) calc(100vw - 56px), 760px" width="1600" height="893" loading="lazy" decoding="async" style="height:auto" alt="O panglică de lumină albastră care intră într-o pâlnie de sticlă și iese ca un fir auriu, ca cererea creată pe Meta și culeasă pe Google"></figure>
  <h2>Ce îți trebuie înainte să pornești</h2>
  <p>Pe <strong>Google Ads</strong>:</p>
  <ul>
    <li>măsurarea conversiilor, testată: formular, apel, comandă;</li>
    <li>o pagină de destinație care continuă exact promisiunea anunțului;</li>
    <li>o listă scurtă de cuvinte cheie cu intenție clară și o listă de cuvinte cheie negative;</li>
    <li>locația și programul setate după zona și orele în care chiar lucrezi.</li>
  </ul>
  <p>Pe <strong>Meta Ads</strong>:</p>
  <ul>
    <li>pixelul Meta instalat și evenimentele verificate; dacă vinzi online, ia în calcul și API-ul de conversii al Meta, care trimite evenimentele direct de pe server;</li>
    <li>3-5 variante de reclamă, cu imagini sau video diferite, pentru că pe Meta creația face o mare parte din rezultat;</li>
    <li>o ofertă clară, ușor de înțeles în două secunde de derulare;</li>
    <li>o pagină de destinație rapidă pe telefon sau un formular direct în Meta, dacă vrei cereri de ofertă.</li>
  </ul>
  <h2>Cum compari corect cele două canale</h2>
  <p>Folosește același cont de Analytics și parametri UTM pe toate linkurile din reclame, ca să vezi traficul fiecărui canal pe aceeași bază. Compară costul pe client nou, nu costul pe click, și uită-te și la efectele indirecte: dacă după o campanie pe Meta cresc căutările după numele firmei în Google, Meta și-a făcut treaba, chiar dacă vânzarea a venit dintr-un click pe Google.</p>
  <h2>Greșeli frecvente la început</h2>
  <ul>
    <li>Butonul „Promovează postarea” în loc de o campanie construită pe un obiectiv clar. E comod, dar rareori optimizează pentru clienți.</li>
    <li>Campanii Meta optimizate pe click-uri sau aprecieri când tu vrei cereri de ofertă.</li>
    <li>Campanii Google de căutare cu rețeaua de display inclusă fără să știi.</li>
    <li>Lipsa măsurării: fără conversii, ambele platforme licitează pe ghicite. Detalii în <a href="/blog/greseli-buget-google-ads/">cele 7 greșeli care ard bugetul de Google Ads</a>.</li>
    <li>Modificări zilnice: la Meta, fiecare modificare importantă repornește faza de învățare.</li>
  </ul>
  <h2>Întrebări frecvente</h2>
  <div class="faq" style="margin-top:10px">
    <details><summary>Care e mai ieftin, Google sau Meta?</summary><p>Prețul pe click nu e o comparație corectă: pe Meta plătești de obicei afișări, pe Google click-uri, iar intenția diferă. Compară costul pe client nou, pe aceeași perioadă.</p></details>
    <details><summary>Pot începe cu un buget mic?</summary><p>Da, dacă îl concentrezi pe un singur canal și pe o singură ofertă. Cu buget mic, căutările foarte precise pe Google sunt de obicei mai previzibile; pe Meta ai nevoie de răbdare cu faza de învățare.</p></details>
    <details><summary>Am nevoie de site ca să fac reclame pe Meta?</summary><p>Nu neapărat. Meta are formulare care se completează direct în aplicație, utile pentru cereri de ofertă. Pentru vânzări online și pentru Google Ads ai nevoie însă de o pagină de destinație bună.</p></details>
    <details><summary>Unde intră TikTok?</summary><p>Funcționează ca Meta: creează cerere, prin video scurt. Merge bine pentru produsele care arată bine în video și pentru un public mai tânăr. De obicei îl adaugi după ce Google sau Meta sunt stabile.</p></details>
    <details><summary>În cât timp văd rezultate?</summary><p>Pe Google, primele cereri pot veni din primele zile, dacă există căutări. Pe Meta, primele 1-2 săptămâni sunt de obicei de învățare. Pentru concluzii solide, judecă orice canal după cel puțin 4-6 săptămâni de date.</p></details>
  </div>
  <div class="key" style="margin-top:30px"><p style="margin:0">Nu știi cu care să începi? Cere <a href="/audit-gratuit/">auditul gratuit</a>: îți recomandăm canalul potrivit pentru afacerea ta, în 24 de ore. Le gestionăm împreună în <a href="/servicii/performance-ads/">Performance Ads</a>, cu detalii pe <a href="/servicii/google-ads/">Google Ads</a> și pe <a href="/servicii/facebook-ads/">Facebook și Instagram Ads</a>.</p></div>
  <h2>Surse</h2>
  <ul class="surse">
    <li><a href="https://www.facebook.com/business/help/112167992830700" target="_blank" rel="noopener">Meta Business Help Center, „About the learning phase”</a></li>
    <li><a href="https://support.google.com/google-ads/answer/7478529" target="_blank" rel="noopener">Google Ads Help, „About broad match”</a></li>
    <li><a href="https://support.google.com/google-ads/answer/1722038" target="_blank" rel="noopener">Google Ads Help, „About advanced location options”</a></li>
  </ul>
</article></div></section>
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
