#!/bin/bash

# Comprobar si las herramientas necesarias están instaladas
command -v dig >/dev/null 2>&1 || { echo >&2 "dig no está instalado. Instalando..."; sudo apt-get install -y dnsutils; }
command -v mapcidr >/dev/null 2>&1 || { echo >&2 "mapcidr no está instalado. Instalando..."; go install github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest; }
command -v shuffledns >/dev/null 2>&1 || { echo >&2 "shuffledns no está instalado. Instalando..."; go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest; }

# Variables
RANGO_IP="104.18.0.0/24"
OUTPUT_DIR="/home/kali/Desktop/Coinbase.com"
WORDLIST="/usr/share/wordlists/dns.txt" # Ruta a tu wordlist

# Crear directorio de salida si no existe
mkdir -p $OUTPUT_DIR

# 1. Reverse DNS utilizando dig en lugar de dnsx
echo "[+] Ejecutando Reverse DNS con dig..."
mapcidr -silent -range $RANGO_IP | while read ip; do
    dig -x $ip +short
done | tee $OUTPUT_DIR/reverse_dns.txt

# 2. DNS brute force con shuffledns (cambiar la wordlist si es necesario)
if [ -f "$WORDLIST" ]; then
    echo "[+] Ejecutando DNS Brute Force con shuffledns..."
    shuffledns -d coinbase.com -w $WORDLIST -r /path/to/resolvers.txt -o $OUTPUT_DIR/dns_bruteforce.txt
else
    echo "[ERROR] No se encontró la wordlist en $WORDLIST. Por favor, especifica una wordlist válida."
fi

# 3. Ejecutar Favicon Hashing (asegúrate de que favicon_hash.py esté presente)
if [ -f "/home/kali/favicon_hash.py" ]; then
    echo "[+] Ejecutando Favicon Hashing..."
    python3 /home/kali/favicon_hash.py > $OUTPUT_DIR/favicon_hash.txt
else
    echo "[ERROR] No se encontró favicon_hash.py. Por favor, coloca el script en /home/kali/"
fi

# 4. Scraping con katana
echo "[+] Ejecutando Scraping con katana..."
katana -u https://www.coinbase.com/ -o $OUTPUT_DIR/katana_output.txt

# 5. Permutaciones (revisar si alterx está instalado)
command -v alterx >/dev/null 2>&1 || { echo >&2 "[ERROR] alterx no está instalado. Por favor, instala alterx o utiliza una alternativa."; }

echo "[+] Script completado."
