with source as (
    select * from {{ source('libreria', 'stock') }}
),

renamed as (
    select
        id_stock,
        UPPER (id_libro)               as id_libro,
        stock_inicial,
        unidades_vendidas,
        stock_actual,
        fecha_actualizacion,
        CASE
            WHEN stock_actual <= 10 THEN true
            ELSE false
        END                             as necesita_reposicion
    from source
)

select * from renamed