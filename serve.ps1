# ============================================================
#  AMPLIO - server local de preview pentru Site V2
#  Ruleaza:  powershell -ExecutionPolicy Bypass -File serve.ps1
#  Apoi deschide:  http://localhost:8080
#  Opresti cu Ctrl+C.
# ============================================================
$root = $PSScriptRoot
$port = 8080
$prefix = "http://localhost:$port/"

$mime = @{
  '.html'='text/html; charset=utf-8'; '.htm'='text/html; charset=utf-8';
  '.css'='text/css; charset=utf-8'; '.js'='application/javascript; charset=utf-8';
  '.svg'='image/svg+xml'; '.jpg'='image/jpeg'; '.jpeg'='image/jpeg'; '.png'='image/png';
  '.gif'='image/gif'; '.webp'='image/webp'; '.ico'='image/x-icon';
  '.mp4'='video/mp4'; '.webm'='video/webm'; '.woff'='font/woff'; '.woff2'='font/woff2';
  '.xml'='application/xml; charset=utf-8'; '.txt'='text/plain; charset=utf-8'; '.json'='application/json; charset=utf-8'
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
try { $listener.Start() }
catch { Write-Host "Nu pot porni serverul pe $prefix - $($_.Exception.Message)"; exit 1 }

Write-Host ""
Write-Host "  AMPLIO preview ruleaza la:  $prefix" -ForegroundColor Green
Write-Host "  Deschide adresa de mai sus in browser. Ctrl+C ca sa opresti."
Write-Host ""

function Resolve-File($urlPath) {
  $p = [System.Uri]::UnescapeDataString($urlPath)
  $p = $p.Split('?')[0]
  if ($p -eq '/') { return (Join-Path $root 'index.html') }
  $p = $p.TrimStart('/') -replace '/', '\'
  # Nu servi fișiere de dev (paritate cu _config.yml de pe GitHub Pages)
  if ($p -match '\.(ps1|yml|yaml)$' -or $p -match '(^|\\)README\.md$') { return $null }
  $full = Join-Path $root $p
  # Protecție path traversal: calea rezolvată trebuie să rămână în interiorul $root
  $rootFull = [System.IO.Path]::GetFullPath($root.TrimEnd('\') + '\')
  $resolved = [System.IO.Path]::GetFullPath($full)
  if (-not $resolved.StartsWith($rootFull, [System.StringComparison]::OrdinalIgnoreCase)) { return $null }
  if (Test-Path $full -PathType Container) { return (Join-Path $full 'index.html') }
  if (Test-Path $full -PathType Leaf) { return $full }
  # clean URL fara extensie -> foloseste /index.html
  if (-not [System.IO.Path]::HasExtension($full)) {
    $idx = Join-Path $full 'index.html'
    if (Test-Path $idx -PathType Leaf) { return $idx }
  }
  return $null
}

while ($listener.IsListening) {
  try {
    $ctx = $listener.GetContext()
    $req = $ctx.Request
    $res = $ctx.Response
    $file = Resolve-File $req.Url.AbsolutePath
    if ($null -eq $file) {
      $res.StatusCode = 404
      $file = Join-Path $root '404.html'
      if (-not (Test-Path $file)) { $file = $null }
    }
    if ($file) {
      $ext = [System.IO.Path]::GetExtension($file).ToLower()
      $ct = $mime[$ext]; if (-not $ct) { $ct = 'application/octet-stream' }
      $res.ContentType = $ct
      $bytes = [System.IO.File]::ReadAllBytes($file)
      $res.ContentLength64 = $bytes.Length
      $res.OutputStream.Write($bytes, 0, $bytes.Length)
      Write-Host ("  {0}  {1}" -f $res.StatusCode, $req.Url.AbsolutePath)
    } else {
      $res.StatusCode = 404
      $msg = [System.Text.Encoding]::UTF8.GetBytes('404')
      $res.OutputStream.Write($msg, 0, $msg.Length)
    }
    $res.OutputStream.Close()
  } catch {
    Write-Host "  eroare: $($_.Exception.Message)"
  }
}
