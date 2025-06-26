# 📊 SAS_ACP_AF_CLUSTER

Este proyecto consiste en un análisis estadístico multivariante aplicado a datos socioeconómicos y medioambientales de países de la Unión Europea. Se emplearon técnicas como **Análisis de Componentes Principales (ACP)**, **Análisis Factorial (AF)** y **Análisis de Clústeres (jerárquico y no jerárquico)**, utilizando **SAS** como herramienta principal.

## 👤 Autor

**Alexandro Bazán**  
Universidad Complutense de Madrid  
Curso 2024

## 📁 Archivos incluidos

| Archivo | Descripción |
|--------|-------------|
| `Examen2.sas` | Código SAS que implementa el ACP, AF y clustering. |
| `euro.sas7bdat` | Base de datos principal en formato SAS. |
| `euro_contam.xlsx` | Archivo complementario con datos medioambientales. |
| `salida.sas7bdat` y `salida2.sas7bdat` | Salidas de procedimientos estadísticos en SAS. |
| `PRÁCTICA ACP,AF y CLUSTER.docx` | Documento de análisis con resultados, interpretaciones y gráficos. |

## 📌 Objetivos del análisis

1. **Reducir la dimensionalidad** de los datos mediante ACP.
2. **Identificar factores latentes** usando análisis factorial.
3. **Agrupar países europeos** según sus perfiles socioeconómicos, demográficos y medioambientales mediante técnicas de clustering.
4. **Interpretar resultados y visualizarlos** en gráficos de mapas y diagramas de agrupación.

## 📈 Principales resultados

- **ACP**: Se retuvieron 6 componentes principales, explicando el 84% de la varianza.
- **Análisis factorial**: Se identificaron 4 factores interpretables:  
  - **Factor 1**: Impacto ambiental  
  - **Factor 2**: Demografía  
  - **Factor 3**: Salud  
  - **Factor 4**: Socioeconómico  
- **Clustering**:
  - Se identificaron 5–7 clústeres óptimos según el método jerárquico de Ward.
  - Los países se agruparon en perfiles similares con base en sus puntuaciones factoriales.
  - España, Alemania, Grecia e Irlanda fueron analizados con mayor detalle.

## 🧠 Herramientas utilizadas

- SAS (`PROC FACTOR`, `PROC CLUSTER`, `PROC FASTCLUS`)
- Excel (datos complementarios)
- Word (análisis interpretativo y redacción)

## 🗺️ Visualizaciones

Se generaron mapas y gráficos para ilustrar:
- Valores de los factores por país.
- Agrupaciones de países según clúster.
- Comparación entre métodos jerárquicos y no jerárquicos.

## 📚 Notas

Este repositorio forma parte de un trabajo universitario enfocado en técnicas de reducción de la dimensión y agrupamiento de datos multidimensionales. La calidad del análisis se fundamenta en criterios estadísticos sólidos como el criterio de Kaiser, MSA, cargas factoriales, RMSR, pseudo F y pseudo t².