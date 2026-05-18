with source as (
    select * from {{ source('libreria', 'libros') }}
),

renamed as (
    select
        UPPER(id_libro)         as id_libro,
        UPPER(id_editorial)     as id_editorial,
        INITCAP(titulo)         as titulo,
        INITCAP(autor)          as autor,
        LOWER(categoria)        as categoria,
        precio::FLOAT           as precio
    from source
    where id_libro is not null -- solo este filtro, quitamos precio/autor
    COALESCE(UPPER(id_editorial), 'SIN_EDITORIAL') as id_editorial
),

deduplicado as (
    select *,
        ROW_NUMBER() OVER (PARTITION BY id_libro ORDER BY titulo) as rn
    from renamed
)

select * exclude (rn)
from deduplicado
where rn = 1