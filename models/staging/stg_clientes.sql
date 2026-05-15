with source as (
    select * from {{ source('libreria', 'clientes') }}
),

renamed as (
    select
        id_cliente,
        nombre,
        apellido,
        tipo_cliente,
        especie,
        ciudad,
        direccion,
        telefono,
        email
    from source
)

select * from renamed