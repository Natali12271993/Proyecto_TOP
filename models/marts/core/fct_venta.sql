{{
    config(
        materialized='incremental',
        unique_key='id_detalle',
        incremental_strategy='merge'
    )
}}

with venta as (
    select * from {{ ref('stg_venta') }}

    {% if is_incremental() %}
        where fecha > (select max(fecha) from {{ this }})
    {% endif %}
),

dim_cliente as (
    select sk_cliente, id_cliente
    from {{ ref('dim_cliente') }}
),

dim_libro as (
    select sk_libro, id_libro
    from {{ ref('dim_libro') }}
),

dim_libreria as (
    select sk_libreria, id_libreria
    from {{ ref('dim_libreria') }}
),

dim_fecha as (
    select sk_fecha, id_fecha, fecha_venta
    from {{ ref('dim_fecha') }}
)

select
    v.id_detalle,
    dc.sk_cliente,
    dl.sk_libro,
    dlb.sk_libreria,
    df.sk_fecha,
    v.cantidad,
    v.precio_unitario,
    v.total_venta,
    v.fecha,
    dlb.id_libreria,
    dl.id_libro,
    dc.id_cliente,
    df.fecha_venta

from venta v
left join dim_cliente  dc  on v.id_cliente  = dc.id_cliente
left join dim_libro    dl  on v.id_libro    = dl.id_libro
left join dim_libreria dlb on v.id_libreria = dlb.id_libreria
left join dim_fecha    df  on v.id_fecha    = df.id_fecha