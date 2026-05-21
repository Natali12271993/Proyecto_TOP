with source as (
    select * from {{ source('libreria', 'clientes') }}
),

renamed as (
    select
        id_cliente,
        nombre,
        apellido,
        LOWER(TRIM(tipo_cliente))   as tipo_cliente,
        LOWER(TRIM(especie))        as especie,
        ciudad,
        direccion,
        telefono,
        email
    from source
    where id_cliente is not null
),

deduplicado as (                 # Por email 
    select *,
        ROW_NUMBER() OVER (PARTITION BY id_cliente ORDER BY id_cliente) as rn
    from renamed
)

select * exclude (rn)
from deduplicado
where rn = 1


