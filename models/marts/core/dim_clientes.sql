with clientes as (
    select * from {{ ref('stg_clientes') }}
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