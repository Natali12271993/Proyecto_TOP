{{ config(materialized='table') }}

with libreria as (
    select * from {{ ref('stg_libreria') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['id_libreria']) }} as sk_libreria,
    id_libreria,
    nombre_libreria,
    ciudad
from libreria