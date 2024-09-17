#!/bin/bash

# Ruta de salida para los resultados
OUTPUT_DIR="/home/kali/Desktop/Coinbase.com"

# Crear la carpeta si no existe
mkdir -p $OUTPUT_DIR

echo "Iniciando análisis de vulnerabilidades..."

# Nuclei
echo "Ejecutando Nuclei..."
nuclei -u https://coinbase.com -o $OUTPUT_DIR/nuclei_output.txt

# Wpscan (Asegúrate de que el objetivo sea un sitio de WordPress)
echo "Ejecutando Wpscan..."
wpscan --url https://coinbase.com --enumerate u -o $OUTPUT_DIR/wpscan_output.txt

# Nikto
echo "Ejecutando Nikto..."
nikto -h https://coinbase.com -o $OUTPUT_DIR/nikto_output.txt

# testssl
echo "Ejecutando testssl..."
testssl https://coinbase.com > $OUTPUT_DIR/testssl_output.txt

# spoofcheck
echo "Ejecutando spoofcheck..."
spoofcheck coinbase.com > $OUTPUT_DIR/spoofcheck_output.txt

# Subzy
echo "Ejecutando Subzy..."
subzy -target coinbase.com > $OUTPUT_DIR/subzy_output.txt

echo "Análisis de vulnerabilidades finalizado. Los resultados se encuentran en: $OUTPUT_DIR"
