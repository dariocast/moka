#!/usr/bin/env bash
set -e

INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "$INSTALL_DIR"

TARGET="$INSTALL_DIR/moka"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
LOCAL_SRC="$SCRIPT_DIR/moka"

if [[ -n "$SCRIPT_DIR" && -f "$LOCAL_SRC" ]]; then
    chmod +x "$LOCAL_SRC"
    ln -sf "$LOCAL_SRC" "$TARGET"
    echo "Collegamento creato con successo in $INSTALL_DIR:"
else
    echo "Scaricamento dell'ultima versione di moka..."
    RAW_URL="https://raw.githubusercontent.com/dariocast/moka/main/moka"
    curl -fsSL "$RAW_URL" -o "$TARGET"
    chmod +x "$TARGET"
    echo "Scaricato e installato con successo in $INSTALL_DIR:"
fi

echo "  -> $TARGET (comando: moka)"
echo ""
echo "Per iniziare, prova:"
echo "  moka --help"
