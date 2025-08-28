#!/data/data/com.termux/files/usr/bin/bash

# Atualiza Termux
pkg update -y && pkg upgrade -y

# Instala Python
pkg install -y python

# Baixa script Python do seu link e salva como whad.py
wget -O whad.py https://raw.githubusercontent.com/DOCTORcoringa/Apis-puxa-dados-/main/whad.psj

# Dá permissão (opcional)
chmod +x whad.py

# Executa o script Python
python3 whad.py
