#!/usr/bin/env bash
set -e

INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "$INSTALL_DIR"

TARGET="$INSTALL_DIR/moka"
ALIAS_CAFF="$INSTALL_DIR/caff"
ALIAS_OLD="$INSTALL_DIR/caffeinate-ui"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
LOCAL_SRC="$SCRIPT_DIR/moka"

if [[ -n "$SCRIPT_DIR" && -f "$LOCAL_SRC" ]]; then
    chmod +x "$LOCAL_SRC"
    ln -sf "$LOCAL_SRC" "$TARGET"
    ln -sf "$LOCAL_SRC" "$ALIAS_CAFF"
    ln -sf "$LOCAL_SRC" "$ALIAS_OLD"
    echo "Collegamento creato con successo in $INSTALL_DIR:"
else
    echo "Scaricamento dell'ultima versione di moka..."
    RAW_URL="https://raw.githubusercontent.com/dariocast/moka/main/moka"
    curl -fsSL "$RAW_URL" -o "$TARGET"
    chmod +x "$TARGET"
    ln -sf "$TARGET" "$ALIAS_CAFF"
    ln -sf "$TARGET" "$ALIAS_OLD"
    echo "Scaricato e installato con successo in $INSTALL_DIR:"
fi

echo "  -> $TARGET (comando principale: moka)"
echo "  -> $ALIAS_CAFF (alias rapido: caff)"
echo ""
echo "Per iniziare, prova:"
echo "  moka --help"
