# ☕ Caffeinate UI (caffeinate-cli)

Un tool a riga di comando elegante, reattivo e informativo per macOS intorno al comando nativo `caffeinate -d`.

Risolve i due problemi principali del `caffeinate` standard:
1. **Zero feedback**: `caffeinate -d` resta muto senza mostrare se è attivo o da quanto tempo.
2. **Chiusura scomoda**: per chiuderlo dovevi ricorrere a `Ctrl+C` forzato.

Con **Caffeinate UI** hai una dashboard live nel terminale con cronometro, countdown con barra di avanzamento, animazione vapore tazza e uscita pulita con un semplice tasto `q` o `ESC`.

---

## 📸 Anteprima CLI

```text
   ☕  CAFFEINATE MAC CLI  v1.1
   ─────────────────────────────────────────────
   Stato:        ● ATTIVO  (Prevenzione: Schermo)
   PID Processo: 12450
   Avviato alle: 13:50:45
   Tempo attivo: 00:14:22
   Rimanente:    30m 38s  (termine: ~14:35:45)
   Progresso:    [███████░░░░░░░░░░░░░] 31%
   Vapore tazza:   (  (  
   ─────────────────────────────────────────────
   [q] Esci pulito   [p] Pausa   [+/-] ±5min   [Ctrl+C] Stop
```

---

## ⚡ Installazione

Poiché usa esclusivamente Python 3 nativo di macOS, **non richiede librerie o pacchetti di terze parti (`pip`)**.

### Metodo 1: One-liner via curl (Consigliato)
```bash
curl -fsSL https://raw.githubusercontent.com/dariocast/caffeinate-ui/main/install.sh | bash
```

### Metodo 2: Da repository locale
```bash
git clone https://github.com/dariocast/caffeinate-ui.git
cd caffeinate-ui
./install.sh
```

I comandi saranno disponibili immediatamente nel tuo terminale (`~/.local/bin/`):
- `caffeinate-ui`
- `caff` *(alias compatto)*

---

## 🚀 Utilizzo

### 1. Avvio indefinito (previene sonno display)
```bash
caffeinate-ui
# oppure con l'alias rapido:
caff
```

### 2. Con durata prestabilita (countdown + notifica nativa al termine)
```bash
caff 30m       # 30 minuti
caff 2h        # 2 ore
caff 1h30m     # 1 ora e mezza
caff 45s       # 45 secondi
```

### 3. Altre modalità energetiche macOS
```bash
caff -dims 1h  # Blocca display, idle sistema, disco e standby AC per 1 ora
caff -i        # Previene solo idle sleep
caff -s 2h     # Previene sonno di sistema con alimentatore AC
```

### 4. Monitora un processo esistente (es. build, script lungo)
```bash
caff -w 45123  # Rimane sveglio finché il PID 45123 non termina
```

---

## ⌨️ Controlli Interattivi da Tastiera

Durante l'esecuzione non è necessario usare `Ctrl+C`:
| Tasto | Azione |
| :--- | :--- |
| `q` o `ESC` | **Esci pulito**: termina `caffeinate`, ripristina la gestione energetica e stampa il riepilogo |
| `p` o `Spazio` | **Pausa / Riprendi**: sospende temporaneamente l'effetto senza chiudere il terminale |
| `+` / `=` | Aggiunge **+5 minuti** al timer |
| `-` | Sottrai **-5 minuti** al timer |
| `Ctrl+C` | Interruzione pulita (gestita con signal trap, nessun dump di errore) |

---

## 🔔 Notifiche Native macOS

Se imposti una durata (es. `caff 45m`), alla scadenza del timer il tool emette un avviso acustico ed una notifica di sistema nativa macOS per avvisarti che il Mac è tornato alla normale modalità energetica.
(Disattivabile con l'opzione `--no-notify`).
