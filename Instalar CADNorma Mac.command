#!/bin/bash
set -eu
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
source_dir="$script_dir/CADNorma-Mac"
target_dir="${1:-$HOME/Documents/Cadnorma-Mac-2027}"
if [ ! -f "$source_dir/carregar_cadnorma_mac.lsp" ]; then printf 'Erro: pacote incompleto.\n' >&2; exit 1; fi
if [ -e "$target_dir" ]; then printf 'Erro: destino já existe: %s\n' "$target_dir" >&2; exit 1; fi
parent_dir=$(dirname -- "$target_dir")
mkdir -p -- "$parent_dir"
temp_dir=$(mktemp -d "$parent_dir/.cadnorma-install.XXXXXXXX")
trap 'rm -rf -- "$temp_dir"' EXIT HUP INT TERM
/usr/bin/ditto "$source_dir" "$temp_dir/conteudo"
[ -f "$temp_dir/conteudo/lisp/cadnorma.lsp" ] || { printf 'Erro: arquivo principal ausente.\n' >&2; exit 1; }
if [ -e "$target_dir" ]; then printf 'Erro: destino já existe.\n' >&2; exit 1; fi
mv -n -- "$temp_dir/conteudo" "$target_dir"
if [ -e "$temp_dir/conteudo" ]; then printf 'Erro: destino já existe; instalação cancelada.\n' >&2; exit 1; fi
printf 'Instalado em: %s\nAbra LEIA-ME.md para concluir a configuração.\n' "$target_dir"
