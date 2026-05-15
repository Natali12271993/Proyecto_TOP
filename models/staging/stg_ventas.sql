with source as (
    select * from {{ source('libreria', 'ventas') }}
),

renamed as (
    select
        id_detalle,
        id_venta,
        id_cliente,
        id_libro,
        id_libreria,
        id_fecha,
        fecha,
        cantidad,
        precio_unitario,
        total_venta
    from source
)

select * from renamed