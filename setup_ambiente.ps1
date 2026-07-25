# =============================================================
#  Setup do ambiente da aula (Windows / PowerShell)
#  Cria a .venv, instala as dependencias e registra o kernel
#  "Python (ESTAT_BASICA)" para aparecer no seletor do VSCode.
#
#  Como usar:
#    1) Abra o PowerShell nesta pasta
#    2) Rode:  .\setup_ambiente.ps1
#    3) No VSCode, abra um .ipynb -> "Select Kernel" -> "Python (ESTAT_BASICA)"
#
#  Se o PowerShell bloquear a execucao, rode antes:
#    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# =============================================================

$ErrorActionPreference = "Stop"
$raiz = $PSScriptRoot
$venv = Join-Path $raiz ".venv"
$py   = Join-Path $venv "Scripts\python.exe"

Write-Host "==> Verificando o Python..." -ForegroundColor Cyan
python --version

# Considera a .venv valida somente se o python interno existir.
# (Uma .venv interrompida no meio da criacao fica quebrada e precisa ser refeita.)
if ((Test-Path $venv) -and (-not (Test-Path $py))) {
    Write-Host "==> .venv encontrada mas INCOMPLETA (criacao interrompida?). Removendo..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force $venv
}

if (-not (Test-Path $py)) {
    Write-Host "==> Criando ambiente virtual em .venv ..." -ForegroundColor Cyan
    Write-Host "    (Pode demorar 20-40s no passo 'ensurepip' — NAO cancele, e normal.)" -ForegroundColor DarkGray
    python -m venv $venv
} else {
    Write-Host "==> .venv ja existe e esta ok, reaproveitando." -ForegroundColor Yellow
}

Write-Host "==> Atualizando o pip ..." -ForegroundColor Cyan
& $py -m pip install --upgrade pip

Write-Host "==> Instalando as dependencias (requirements.txt) ..." -ForegroundColor Cyan
& $py -m pip install -r (Join-Path $raiz "requirements.txt")

Write-Host "==> Registrando o kernel do Jupyter ..." -ForegroundColor Cyan
& $py -m ipykernel install --user --name "estat-basica" --display-name "Python (ESTAT_BASICA)"

Write-Host ""
Write-Host "==> Pronto!" -ForegroundColor Green
Write-Host "   No VSCode: abra um .ipynb, clique em 'Select Kernel' e escolha 'Python (ESTAT_BASICA)'."
