# AMPLIO — Site V2 (multi-page)

Reconstrucție multi-pagină a amplio.ro, pe arhitectura **servicii × soluții + blog**, optimizată SEO.

## Structura

```
/                      Homepage (hub)
/servicii              Hub servicii  → 7 pagini de serviciu
/solutii               Hub soluții   → 6 pagini de industrie
/blog                  Hub blog      → pilon GEO + 2 articole
/scor-vizibilitate-ai  Test interactiv (quiz)
/calculator-investitie Calculator interactiv
/audit-gratuit         Pagina de conversie (formular)
/despre  /contact      Pagini companie
/termeni /confidentialitate /cookies   Legal (modele — de revizuit juridic)
404.html               Pagină 404
```

URL-uri curate prin pattern `folder/index.html` (ex. `/servicii/seo-geo`).

## Fișiere comune
- `assets/style.css` — design system partajat (toate paginile îl folosesc)
- `assets/app.js` — nav scroll, meniu mobil, reveal, an footer
- `assets/hero.mp4`, `hero-poster.jpg`, logo-uri — moștenite din V1

## Sistem de build
Paginile repetitive (servicii, soluții, despre, blog, legal) sunt **generate** din `build.ps1`.
Paginile cu HTML/JS unic (homepage, audit-gratuit, scor, calculator) sunt scrise direct.

### Cum regenerezi paginile
1. Editează conținutul în `build.ps1` (secțiunea `$pages`).
2. **IMPORTANT:** `build.ps1` trebuie salvat ca **UTF-8 cu BOM**, altfel PowerShell 5.1
   corupe diacriticele. Dacă editorul tău scoate BOM-ul, rulează o singură dată:
   ```powershell
   $p="build.ps1"; $t=[IO.File]::ReadAllText($p,[Text.Encoding]::UTF8); [IO.File]::WriteAllText($p,$t,(New-Object Text.UTF8Encoding $true))
   ```
3. Rulează: `powershell -ExecutionPolicy Bypass -File build.ps1`

## De făcut înainte de lansare (din auditul SEO)
- [ ] **Creează `assets/og-amplio.jpg`** (1200×630) — referit de `og:image` pe toate paginile.
- [ ] **Comprimă `hero.mp4`** (acum ~3 MB) sub ~1 MB pentru Core Web Vitals.
- [ ] Revizuiește juridic paginile legale (sunt modele generice).
- [ ] După deploy: adaugă proprietatea în Google Search Console + submite `sitemap.xml`.
- [ ] Promovează folderul la rădăcina repo-ului (înlocuind V1) când ești mulțumit.

## Note tehnice
- Toate `index.html` sunt server-renderizate (conținut în HTML static — corect pentru SEO și AI crawlers).
- Linking intern matrice servicii ↔ soluții; breadcrumbs cu schema `BreadcrumbList` pe toate paginile.
- Schema: `ProfessionalService` (home), `Service` (servicii), `Article` (blog), `BreadcrumbList` (peste tot).
