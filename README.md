# TFM-PREMIS-TOS

## Descripción
Esquema, reglas de validación y ejemplos de la extensión PREMIS-TOS utilizada en el TFM sobre preservación digital del software español de 8 bits (1983-1992).

## Contexto del TFM
**"Arqueología del Silicio: La Edad de Oro del Software Español como Retención Terciaria y Patrimonio Cultural Vivo"** (2025) investiga la supervivencia digital del software español de 8 bits (1983-1992). Este período corresponde a la era dorada de la industria del software español, con productos icónicos como *La Abadía del Crimen*, *Sir Fred*, y *Crossfire*.

### Contexto académico
- **Fundamentación teórica:** Basado en los trabajos de Matthew Kirschenbaum ("Mechanisms: New Media and the Forensic Imagination") y Wolfgang Ernst ("Digital Memory and the Archive"), aplicando el marco forense de la materialidad digital a juegos icónicos.
- **Laboratorio de investigación:** Basado en el análisis forense informático del software español conservado en discos de casset, con especial énfasis en juegos ZX Spectrum.

### Metodología de investigación
- **Fase 1 - Restauración (Fase 1 - Restauración):** Cuenta con el análisis técnico del apoyo físico (medios magnéticos) para determinar su estado de salud.
- **Fase 2 - Vaciado (Fase 2 - Volcado):** Extracción de bajo nivel de los juegos en formato .TZX manteniendo la temporización y los valores originales.
- **Fase 3 - Auditoría (Fase 3 - Auditoría):** Verificación SHA-256, incorporación de metadatos PREMIS extendidos con parámetros específicos (Z80 a 3.5 MHz, contención de memoria).
- **Fase 4 - Emulación Activa (Fase 4 - Emulación Activa):** Validación de los juegos recuperados en émulos con sincronización temporal para asegurar la autenticidad de su Eigenzeit original.

### Objetivos principales
1. **Preservación forense del software español de 8 bits** - Crear un AIP (Paquete de Información de Archivo) forense con chips de consola completos en formato TZX con hash SHA-256.
2. **Actualización del PREMIS con metadata específica** - Extender el esquema PREMIS estándar con parámetros específicos: velocidades de reloj, patrones de contención de memoria, fidelidad temporal y degradación de hardware.
3. **Desarrollo de herramientas validadoras** - Proporcionar un conjunto de tools (README, Dockerfile, Schematron) para validar los esquemas PREMIS-TOS.
4. **Creación de un entorno reproducible** - Proporcionar un Dockerfile con xmllint/jing/schematron para entornos CI/CD.
5. **Aportación al acervo digital español** - Diseñar una estructura extensible que pueda aplicarse posteriormente a software industrial, médico y a otros ámbitos tempranos.

### Resultados esperados
- **AIP validado** con el esquema PREMIS-TOS完整 y los estándares técnicos incorporados.
- **DIP estándar** accesible – juegos emulados disponibles, con su fidelidad temporal precisa y metadata completa.
- **Kit de herramientas estructurado** para uso por instituciones, investigadores y la comunidad.
- **Patente de metodología** que puede ser reutilizada para otra transición digital.

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