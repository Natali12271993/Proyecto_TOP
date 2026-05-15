with source as (
    select * from {{ source('libreria', 'stock') }}
),

renamed as (
    select
        id_stock,
        id_libro,
        stock_inicial,
        unidades_vendidas,
        stock_actual,
        fecha_actualizacion
    from source
)

select * from renamed