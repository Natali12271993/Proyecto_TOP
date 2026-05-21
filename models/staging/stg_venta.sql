with source as (
    select * from {{ source('libreria', 'ventas') }}
),

renamed as (
    select
        id_detalle,
        id_venta,
        CASE                                            --130 - HC0130
            WHEN id_cliente LIKE 'HC%' THEN id_cliente
            WHEN id_cliente LIKE 'C%'
            THEN 'HC' || LPAD(REPLACE(id_cliente,'C',''), 4, '0')
        END                             as id_cliente,
        UPPER(id_libro)                 as id_libro,
        id_libreria,
        id_fecha,
        fecha,
        cantidad,
        precio_unitario,
        total_venta
    from source
),

deduplicado as (
    select *,
        ROW_NUMBER() OVER (PARTITION BY id_detalle ORDER BY fecha) as rn
    from renamed
)

select * exclude (rn)
from deduplicado
where rn = 1