### Windows PowerShell 용
$ErrorActionPreference = "Stop"
$TemplateSrc = Join-Path $PSScriptRoot "templates\CMP.xml"
$BaseDir = Join-Path $env:APPDATA "Google"

$Targets = Get-ChildItem -Path $BaseDir -Directory -Filter "AndroidStudio*" -ErrorAction SilentlyContinue

if (-not $Targets) {
    Write-Host "Android Studio 설정 폴더를 찾지 못했습니다. Android Studio를 한 번 이상 실행한 뒤 다시 시도하세요."
    exit 1
}

foreach ($dir in $Targets) {
    $TemplateDir = Join-Path $dir.FullName "templates"
    New-Item -ItemType Directory -Force -Path $TemplateDir | Out-Null
    Copy-Item -Path $TemplateSrc -Destination (Join-Path $TemplateDir "CMP.xml") -Force
    Write-Host "Installed to: $TemplateDir\CMP.xml"
}

Write-Host "완료! Android Studio를 재시작하면 Live Templates > CMP 그룹에서 사용할 수 있습니다."