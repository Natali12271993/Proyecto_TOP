with fecha as (
    select * from {{ ref('stg_fecha') }}
)

select
    id_fecha,
    fecha_completa,
    anyo,
    mes,
    dia
from fecha