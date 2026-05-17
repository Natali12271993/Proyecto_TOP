with librerias as (
    select * from {{ ref('stg_libreria') }}
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