GNU nano 8.0            /home/kali/Desktop/Coinbase.com/tecnicas_osint.sh                      
#!/bin/bash

# Ruta de salida para los resultados
OUTPUT_DIR="/home/kali/Desktop/Coinbase.com"

# Crear la carpeta si no existe
mkdir -p $OUTPUT_DIR

echo "Iniciando técnicas OSINT..."

# ExifTool - Analizar metadatos de ejemplo (debe cambiar la ruta según la imagen o archivo objet>
echo "Ejecutando ExifTool..."
exiftool /ruta/del/archivo > $OUTPUT_DIR/exiftool_output.txt

# Spiderfoot - Iniciar Spiderfoot (requiere ejecución manual en el navegador)
echo "Iniciando Spiderfoot..."
spiderfoot -l localhost:8082 > $OUTPUT_DIR/spiderfoot_output.txt &

# dnstwist - Detectar dominios similares (typosquatting)
echo "Ejecutando dnstwist..."
dnstwist -r coinbase.com > $OUTPUT_DIR/dnstwist_output.txt

echo "Técnicas OSINT finalizadas. Los resultados se encuentran en: $OUTPUT_DIR"


#!/bin/bash

# Ruta de salida para los resultados
OUTPUT_DIR="/home/kali/Desktop/Coinbase.com"

# Crear la carpeta si no existe
mkdir -p $OUTPUT_DIR

echo "Iniciando técnicas OSINT..."

# ExifTool - Analizar metadatos de ejemplo (debe cambiar la ruta según la imagen o archivo objetivo)
echo "Ejecutando ExifTool..."
exiftool /ruta/del/archivo > $OUTPUT_DIR/exiftool_output.txt

# Spiderfoot - Iniciar Spiderfoot (requiere ejecución manual en el navegador)
echo "Iniciando Spiderfoot..."
spiderfoot -l localhost:8082 > $OUTPUT_DIR/spiderfoot_output.txt &

# dnstwist - Detectar dominios similares (typosquatting)
echo "Ejecutando dnstwist..."
dnstwist -r coinbase.com > $OUTPUT_DIR/dnstwist_output.txt

echo "Técnicas OSINT finalizadas. Los resultados se encuentran en: $OUTPUT_DIR"
