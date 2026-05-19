{{
    config(
        materialized='incremental',
        unique_key='id_stock',
        incremental_strategy='merge'
    )
}}

with stock as (
    select * from {{ ref('stg_stock') }}

    {% if is_incremental() %}
        where fecha_actualizacion > (select max(fecha_actualizacion) from {{ this }})
    {% endif %}
),

dim_libro as (
    select sk_libro, id_libro, id_editorial
    from {{ ref('dim_libro') }}
),

dim_editorial as (
    select sk_editorial, id_editorial
    from {{ ref('dim_editorial') }}
)

select
    s.id_stock,
    dl.sk_libro,
    de.sk_editorial,
    s.stock_inicial,
    s.unidades_vendidas,
    s.stock_actual,
    s.necesita_reposicion,
    s.fecha_actualizacion,
    dl.id_libro,
    de.id_editorial
from stock s
left join dim_libro     dl on s.id_libro      = dl.id_libro
left join dim_editorial de on dl.id_editorial = de.id_editorial
where s.stock_actual < 5