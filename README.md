![image](https://github.com/user-attachments/assets/76257ad1-2ad6-4586-8e6e-fc469cb23d9c)

# 🕵️‍♂️ Informe de Reconocimiento: coinbase.com

Este informe documenta un análisis completo de reconocimiento sobre el dominio `coinbase.com`, utilizando técnicas OSINT, fingerprinting y análisis de vulnerabilidades. El objetivo es identificar posibles vectores de ataque, tecnologías utilizadas, subdominios, servicios expuestos y configuraciones de seguridad.

## 📌 Herramientas y Técnicas Empleadas

### 🔎 Footprinting
- **Whois / NSLookup / Reverse DNS**: Información registral, IPs asociadas y proveedor DNS (Cloudflare).
- **Favicon Hashing**: Identificación de posibles activos mediante hash del favicon.
- **Scraping (Katana)**: Extracción de URLs y subdominios.
- **dnsgen / shuffledns**: Permutaciones y fuerza bruta para encontrar subdominios adicionales.
- **AnalyticsRelationships**: Búsqueda de sitios con el mismo Google Analytics ID.
- **TLS Probing / CTFR**: Análisis de certificados y configuración SSL/TLS.
- **Amass / Subfinder / Sublist3r / Assetfinder**: Recolección masiva de subdominios.

### 🧬 Fingerprinting
- **Nmap (básico, versión, agresivo)**: Puertos abiertos, servicios, versión y sistema operativo.
- **Masscan**: Escaneo de todos los puertos.
- **Httpx / GoWitness / WhatWeb**: Descubrimiento de servicios web activos y tecnologías.
- **Wafw00f**: Detección de WAF (Cloudflare).
- **ffuf**: Enumeración de directorios y archivos ocultos.

### 🛡️ Análisis de Vulnerabilidades
- **Greenbone (OpenVAS)**: Escaneo completo con base de datos CVEs.
- **Nuclei**: Detección de configuraciones y tecnologías (TLS, DNS, DMARC).
- **WPScan / Nikto**: Verificación de seguridad en tecnologías web comunes.
- **testssl.sh**: Evaluación detallada de configuraciones SSL/TLS.
- **Spoofcheck**: Evaluación de registros SPF y DMARC.
- **Subzy**: Verificación de subdominios vulnerables a takeover.

### 🌐 OSINT
- **Buscadores (Google, Bing)**: Búsqueda de documentos y páginas administrativas.
- **ExifTool**: Extracción de metadatos de capturas.
- **Spiderfoot**: Recolección masiva de emails, claves PGP y recursos expuestos.
- **dnstwist**: Identificación de dominios similares usados para typosquatting.

## ✅ Resultados Relevantes

- **Dominio protegido con Cloudflare** (WAF, DNS, CDN).
- **Uso de TLS moderno** (1.2/1.3) y cifrados fuertes (AES-GCM, ChaCha20).
- **SPF y DMARC bien configurados**, política p=reject.
- **Más de 50 subdominios descubiertos** a través de múltiples técnicas.
- **Alerta potencial: falta de encabezados HTTP como X-Frame-Options y HttpOnly en cookies**.

## 🧩 Recomendaciones
- Añadir encabezados de seguridad (X-Frame-Options, X-Content-Type-Options).
- Revisar uso de cifrados CBC para mitigar LUCKY13.
- Implementar `HttpOnly` en cookies sensibles.

---

Este informe fue generado con herramientas de código abierto desde un entorno Kali Linux. Solo se realizaron pruebas pasivas o autorizadas según el programa de HackerOne.

