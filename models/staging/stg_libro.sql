with source as (
    select * from {{ source('libreria', 'libros') }}
),

renamed as (
    select
        UPPER(id_libro)                                         as id_libro,
        COALESCE(UPPER(id_editorial), 'SIN_EDITORIAL')          as id_editorial,
        INITCAP(titulo)                                         as titulo,
        INITCAP(autor)                                          as autor,
        COALESCE(LOWER(TRIM(categoria)), 'sin_categoria')       as categoria,
        precio::FLOAT                                           as precio
    from source
    where id_libro is not null
),

deduplicado as (
    select *,
        ROW_NUMBER() OVER (PARTITION BY id_libro ORDER BY titulo) as rn
    from renamed
)

select * exclude (rn)
from deduplicado
where rn = 1