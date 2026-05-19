{{ config(materialized='table') }}

with stock as (
    select * from {{ ref('stg_stock') }}
),

dim_libro as (
    select sk_libro, id_libro, titulo
    from {{ ref('dim_libro') }}
),

dim_libreria as (
    select sk_libreria, id_libreria, nombre_libreria
    from {{ ref('dim_libreria') }}
)

select
    s.id_stock,
    dl.sk_libro,
    dlb.sk_libreria,
    s.stock_inicial,
    s.unidades_vendidas,
    s.stock_actual,
    s.necesita_reposicion,
    s.fecha_actualizacion,
    dl.id_libro,
    dl.titulo,
    dlb.id_libreria,
    dlb.nombre_libreria
from stock s
left join dim_libro    dl  on s.id_libro    = dl.id_libro
left join dim_libreria dlb on s.id_libreria = dlb.id_libreria