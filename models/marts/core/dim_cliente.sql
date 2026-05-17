with clientes as (
    select * from {{ ref('stg_cliente') }}
)

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
from clientes