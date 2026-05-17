with source as (
    select * from {{ source('libreria', 'librerias') }}
),

renamed as (
    select
        id_libreria,
        nombre_libreria,
        ciudad,
        direccion,
        telefono,
        email,
        fecha_apertura
    from source
)

select * from renamed