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
),                   

deduplicado as (
    select *,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id_cliente) as rn
    from renamed
)

select * exclude (rn)
from deduplicado
where rn = 1