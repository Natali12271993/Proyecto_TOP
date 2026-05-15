with source as (
    select * from {{ source('libreria', 'fecha') }}
),

renamed as (
    select
        id_fecha,
        fecha_completa,
        anyo,
        mes,
        dia
    from source
)

select * from renamed