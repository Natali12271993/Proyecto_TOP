with source as (
    select * from {{ source('libreria', 'librerias') }}
),

renamed as (
    select
        id_libreria,
        nombre_libreria,
        ciudad,
        direccion,
        CASE
            WHEN REGEXP_LIKE(telefono::VARCHAR, '^[0-9]+$') THEN telefono::VARCHAR
            ELSE NULL
        END                             as telefono,
        email,
        fecha_apertura::DATE            as fecha_apertura
    from source
)

select * from renamed