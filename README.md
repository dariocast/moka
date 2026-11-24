# MOKA (Mac Os Keep Alive)

```text
  __  __  ___  _  __   _   
 |  \/  |/ _ \| |/ /  /_\  
 | |\/| | (_) | ' <  / _ \ 
 |_|  |_|\___/|_|\_\/_/ \_\  v2.0
 [ Mac Os Keep Alive ]
```

CLI & TUI essenziale per macOS per controllare `caffeinate` con output grafico dal vivo, timer, barra di avanzamento e uscita pulita con un singolo tasto.

**Zero emoji**, estetica terminale pulita (stile UNIX / htop) e dipendenze esterne nulle (solo Python 3 integrato di macOS).

---

## Anteprima TUI

```text
  __  __  ___  _  __   _   
 |  \/  |/ _ \| |/ /  /_\  
 | |\/| | (_) | ' <  / _ \ 
 |_|  |_|\___/|_|\_\/_/ \_\  v2.0
 [ Mac Os Keep Alive ]
  -------------------------------------------------
  Status:       [ACTIVE]  (Display)
  PID:          12450
  Started:      16:30:00
  Active Time:  00:14:22  (14m 22s)
  Timer:        00:45:00  (45m)
  Remaining:    00:30:38  (eta: ~17:15:00)
  Progress:     [=====>..........] 31%
  -------------------------------------------------
  [q] Quit   [p] Pause   [+/-] +-5min   [Ctrl+C] Stop
```

All'uscita, il riquadro interattivo viene sostituito da un riepilogo tecnico ordinato:

```text
  -------------------------------------------------
  [OK] Moka session finished.
  [+] Total awake time:  00:14:22  (14m 22s)
  [*] Scheduled timer:   00:45:00  (45m - stopped with 30m 38s left)
  [!] Time spent paused: 00:03:00  (3m)
  [*] Energy management: Restored to normal
  -------------------------------------------------
```

---

## Installazione Rapida

### Metodo 1: One-liner via curl (Consigliato)
```bash
curl -fsSL https://raw.githubusercontent.com/dariocast/moka/main/install.sh | bash
```

### Metodo 2: Da repository locale
```bash
git clone https://github.com/dariocast/moka.git
cd moka
./install.sh
```

Comandi disponibili nel tuo `$PATH` (`~/.local/bin/`):
* **`moka`** (comando principale)
* **`caff`** (alias rapido)

---

## Utilizzo

```bash
# Avvio a tempo indeterminato (previene sonno display)
moka

# Con timer preimpostato (countdown e notifica di sistema al termine)
moka 30m
moka 2h
moka 1h30m

# Prevenzione completa (display, idle, disco e standby AC)
moka -dims 45m

# Mantieni sveglio fino al termine di un processo (es. build, script lungo)
moka -w 45123
```

---

## Controlli da Tastiera

Nessun bisogno di forzare `Ctrl+C`:
| Tasto | Azione |
| :--- | :--- |
| `q` o `ESC` | **Esci**: arresta `caffeinate`, ripristina la gestione energetica e stampa il riepilogo |
| `p` | **Pausa / Riprendi**: sospende o riattiva la protezione energetica |
| `+` | Aggiunge **+5 minuti** (trasforma anche una sessione continua in timer) |
| `-` | Sottrae **-5 minuti** |
| `Ctrl+C` | Interruzione pulita con signal trap |
