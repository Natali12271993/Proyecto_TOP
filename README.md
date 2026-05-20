# 📚 Librería Mágica — Proyecto Cívica

Pipeline de Data Engineering end-to-end construido con **dbt + Snowflake**.

## 🏗️ Arquitectura

- **Bronze** — 7 tablas RAW cargadas desde CSV en Snowflake
- **Silver** — 7 modelos `stg_*` con limpieza, normalización y tests
- **Gold** — Modelo dimensional con dims y fct_venta incremental

## 🎯 Casos de uso

1. ¿Qué librería genera más ingresos? → `fct_venta + dim_libreria`
2. ¿Qué libros se venden más? → `fct_venta + dim_libro`
3. ¿Qué especie de cliente compra más? → `fct_venta + dim_cliente`
4. ¿En qué mes se vende más? → `fct_venta + dim_fecha`

## 🗂️ Estructura del proyecto

## ⚙️ Cómo ejecutar

```bash
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