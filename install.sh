#!/usr/bin/env bash
set -e

INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "$INSTALL_DIR"

TARGET="$INSTALL_DIR/caffeinate-ui"
ALIAS_TARGET="$INSTALL_DIR/caff"

# If run directly inside the cloned repo
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
LOCAL_SRC="$SCRIPT_DIR/caffeinate-ui"

if [[ -n "$SCRIPT_DIR" && -f "$LOCAL_SRC" ]]; then
    chmod +x "$LOCAL_SRC"
    ln -sf "$LOCAL_SRC" "$TARGET"
    ln -sf "$LOCAL_SRC" "$ALIAS_TARGET"
    echo "Collegamento creato con successo in $INSTALL_DIR:"
else
    # Remote one-line installer via curl
    echo "Scaricamento dell'ultima versione di caffeinate-ui..."
    RAW_URL="https://raw.githubusercontent.com/dariocast/caffeinate-ui/main/caffeinate-ui"
    curl -fsSL "$RAW_URL" -o "$TARGET"
    chmod +x "$TARGET"
    ln -sf "$TARGET" "$ALIAS_TARGET"
    echo "Scaricato e installato con successo in $INSTALL_DIR:"
fi

echo "  -> $TARGET"
echo "  -> $ALIAS_TARGET"
echo ""
echo "Per iniziare, prova:"
echo "  caff --help"
