with source as (
    select * from {{ source('libreria', 'editorial') }}
),

renamed as (
    select
        id_editorial,
        nombre,
        pais,
        ciudad,
        tipo_editorial,
        especialidad,
        email,
        telefono,
        contacto
    from source
)

select * from renamed