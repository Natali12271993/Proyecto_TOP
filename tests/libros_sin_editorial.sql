-- Test singular: los únicos libros sin editorial permitidos son estos 6 libros.
-- Si aparece un libro nuevo sin editorial el test falla.

select id_libro
from {{ ref('stg_libros') }}
where id_editorial is null
  and id_libro not in ('L0436', 'L0766', 'L0795', 'LM0398', 'LM0685', 'LM0765')