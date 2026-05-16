with librerias as (
    select * from {{ ref('stg_librerias') }}
)

select
    id_libreria,
    nombre_libreria,
    ciudad,
    direccion,
    telefono,
    email,
    fecha_apertura
from librerias