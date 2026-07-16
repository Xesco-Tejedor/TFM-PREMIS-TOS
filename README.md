# TFM-PREMIS-TOS

## Descripción
Esquema, reglas de validación y ejemplos de la extensión PREMIS-TOS utilizada en el TFM sobre preservación digital del software español de 8 bits (1983-1992).

## Componentes
- **Namespace**: `https://uc3m.es/tfm/tos/1.0`
- **Elementos principales**:
  - `hardwareFixity`: Hash del hardware auditado
  - `analogFixity`: Hash del bitstream analógico (96 kHz/24 bit)
  - `chronodeck`: Tabla de traducción temporal
  - `affTelemetrySession`: Telemetría Z80 en tiempo real

## Validación
1. **Validar XML con `xmllint`**  
   ```bash
   xmllint --noout examples/Sir_Fred_TOS.xml schemes/tos.xsd
   ```

2. **Validar con jing (RELAX NG)**  
   ```bash
   jing schemes/tos.sch examples/Sir_Fred_TOS.xml
   ```

3. **Validar reglas Schematron**  
   ```bash
   schematron valido
   ```

## Docker
Detener el contenedor:  
```bash
docker stop tfm-premis-tos
```  

Validar en contenedor:  
```bash
docker build -t tfm-premis-tos .
docker run --rm -v "$PWD:/data" tfm-premis-tos xmllint --noout /data/examples/Sir_Fred_TOS.xml
```

## Ejemplos incluidos
- `examples/Sir_Fred_TOS.xml` – Caso de prueba básico.
- `examples/La_Abadia_Crimen_TOS.xml` – Caso de prueba con datos históricos.

## Requisitos
- **Al menos**: `xmlstarlet`, `jing`, `schematron`
- **Opcional**: `docker` (para validación en contenedor)

## Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.