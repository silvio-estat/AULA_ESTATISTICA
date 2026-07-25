#!/usr/bin/env bash
# =============================================================
#  Setup do ambiente da aula (Linux / macOS)
#  Cria a .venv, instala as dependencias e registra o kernel
#  "Python (ESTAT_BASICA)" para aparecer no seletor do VSCode.
#
#  Como usar:
#    1) Abra o terminal nesta pasta
#    2) Rode:  bash setup_ambiente.sh     (ou:  chmod +x setup_ambiente.sh && ./setup_ambiente.sh)
#    3) No VSCode, abra um .ipynb -> "Select Kernel" -> "Python (ESTAT_BASICA)"
# =============================================================

set -euo pipefail

RAIZ="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV="$RAIZ/.venv"
PY="$VENV/bin/python"

# escolhe o interpretador disponivel (python3 ou python)
PYBASE="$(command -v python3 || command -v python)"

echo "==> Verificando o Python..."
"$PYBASE" --version

# Considera a .venv valida somente se o python interno existir.
# (Uma .venv interrompida no meio da criacao fica quebrada e precisa ser refeita.)
if [ -d "$VENV" ] && [ ! -x "$PY" ]; then
    echo "==> .venv encontrada mas INCOMPLETA (criacao interrompida?). Removendo..."
    rm -rf "$VENV"
fi

if [ ! -x "$PY" ]; then
    echo "==> Criando ambiente virtual em .venv ..."
    echo "    (Pode demorar alguns segundos no passo 'ensurepip' — NAO cancele, e normal.)"
    "$PYBASE" -m venv "$VENV"
else
    echo "==> .venv ja existe e esta ok, reaproveitando."
fi

echo "==> Atualizando o pip ..."
"$PY" -m pip install --upgrade pip

echo "==> Instalando as dependencias (requirements.txt) ..."
"$PY" -m pip install -r "$RAIZ/requirements.txt"

echo "==> Registrando o kernel do Jupyter ..."
"$PY" -m ipykernel install --user --name "estat-basica" --display-name "Python (ESTAT_BASICA)"

echo ""
echo "==> Pronto!"
echo "   No VSCode: abra um .ipynb, clique em 'Select Kernel' e escolha 'Python (ESTAT_BASICA)'."
