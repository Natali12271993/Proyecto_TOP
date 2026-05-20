-- Test singular: los únicos libros sin editorial permitidos son estos 6 libros.
-- Si aparece un libro nuevo sin editorial el test falla.

select id_libro
from {{ ref('stg_libro') }}
where id_editorial = 'SIN_EDITORIAL'
  and id_libro not in ('L0436', 'L0766', 'L0795', 'LM0398', 'LM0685', 'LM0765')