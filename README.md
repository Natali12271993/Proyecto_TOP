# Librería Mágica — Proyecto Cívica

Pipeline de Data Engineering end-to-end construido con **dbt + Snowflake**.

## Arquitectura

- **Bronze** — 7 tablas RAW cargadas desde CSV en Snowflake
- **Silver** — 7 modelos `stg_*` con limpieza, normalización y tests
- **Gold** — Modelo dimensional con dims y fct_venta incremental y tests

## Casos de uso

1. ¿Qué librería genera más ingresos?  `fct_venta + dim_libreria`
2. ¿Qué libros se venden más?  `fct_venta + dim_libro`
3. ¿Qué especie de cliente compra más?  `fct_venta + dim_cliente`
4. ¿En qué mes se vende más?  `fct_venta + dim_fecha`

## Estructura del proyecto

Proyecto_TOP/
  dbt_project.yml      # configuración principal del proyecto
  packages.yml         # crear surrogate key (dbt_utils)
  README.md            # documentación del proyecto
  
  models/
    staging/           # Capa Silver
      stg_cliente.sql
      stg_editorial.sql
      stg_fecha.sql
      stg_libreria.sql
      stg_libro.sql
      stg_venta.sql
    
      _stg_models.yml  # tests y documentación Silver
      _raw_sources.yml # declaración de fuentes Bronze
      
    marts/
      core/            # Capa Gold
        dim_cliente.sql
        dim_fecha.sql
        dim_libreria.sql
        dim_libro.sql
        fct_venta.sql
        _marts_models.yml # tests y documentación Gold
  
  snapshots/
    snp_stock.sql      # SCD Tipo 2
  
  tests/
    libros_sin_editorial.sql         → test singular
  
  macros/
    generate_schema_name.sql  → macro de schemas por entorno

## Cómo ejecutar

# Ejecutar los modelos SQL
dbt run

# Ejecutar tests
dbt test

# Instalar dependencias
dbt deps

# Ejecutar pipeline completo
dbt build

# Ejecutar snapshot
dbt snapshot
```

## 🗄️ Entornos Snowflake

| Entorno | Bronze | Silver | Gold |
|---------|--------|--------|------|
| DEV | DEV_PROYECTO_BRONZE | DEV_PROYECTO_SILVER | DEV_PROYECTO_GOLD |
| PRE | PRE_PROYECTO_BRONZE | PRE_PROYECTO_SILVER | PRE_PROYECTO_GOLD |
| PRO | PRO_PROYECTO_BRONZE | PRO_PROYECTO_SILVER | PRO_PROYECTO_GOLD |