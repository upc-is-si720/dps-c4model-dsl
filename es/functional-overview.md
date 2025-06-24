## Descripción general funcional

Los requisitos funcionales de alto nivel para el nuevo Sistema de Riesgos son los siguientes.

![Resumen funcional](images/functional-overview.png)

1. Datos comerciales de importación del Sistema de Datos Comerciales.
2. Importar datos de contraparte desde el Sistema de Datos de Referencia.
3. Unir los dos conjuntos de datos, enriqueciendo los datos comerciales con información sobre la contraparte.
4. Para cada contraparte, calcule el riesgo al que está expuesto el banco.
5. Genere un informe que se pueda importar a Microsoft Excel que contenga las cifras de riesgo de todas las contrapartes conocidas por el banco.
6. Distribuya el informe a los usuarios empresariales antes del inicio del siguiente día de negociación (9 a.m.) en Singapur.
7. Proporcione una forma para que un subconjunto de los usuarios empresariales configure y mantenga los parámetros externos utilizados por los cálculos de riesgo.
