with source as (
    select * from {{ source('libreria', 'libros') }}
),

renamed as (
    select
        id_libro,
        id_editorial,
        titulo,
        autor,
        categoria,
        precio
    from source
)

select * from renamed