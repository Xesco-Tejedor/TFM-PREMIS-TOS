<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <pattern id="PREMIS-TOS-rules">
    <!-- R1: Cada TZXObject debe tener analogFixity coincidente -->
    <rule context="tos:TZXObject">
      <assert test="exists(tos:analogFixity[tos:sourceHash = $analogHash])">
        El hash analógico debe coincidir con el TZX.
      </assert>
    </rule>

    <!-- R2: DegradationIndex menor a 0.3 -->
    <rule context="tos:Chronodeck">
      <assert test="@degradationIndex &lt; 0.3">
        Degradación física debe ser menor a 0.3.
      </assert>
    </rule>

    <!-- R3: FidelityScore máximo según contentionEvents -->
    <rule context="tos:EmulationValidation">
      <assert test="not(@contentionEvents > 0) or @fidelityScore &lt;= 0.95">
        La fidelidad de emulación no puede superar 0.95 si hay eventos de contención.
      </assert>
    </rule>

    <!-- R4: Deterministicidad de reglas Chronodeck -->
    <rule context="tos:Chronodeck">
      <assert test="@deterministic = 'true'">
        Las reglas Chronodeck deben ser determinísticas.
      </assert>
    </rule>
  </pattern>
</schema>