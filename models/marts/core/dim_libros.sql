with libros as (
    select * from {{ ref('stg_libro') }}
),

editorial as (
    select * from {{ ref('stg_editorial') }}
)

select
    l.id_libro,
    l.titulo,
    l.autor,
    l.categoria,
    l.precio,
    e.nombre as editorial,
    e.pais,
    e.especialidad
from libros l
left join editorial e on l.id_editorial = e.id_editorial