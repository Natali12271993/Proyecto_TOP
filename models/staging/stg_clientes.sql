with source as (
    select * from {{ source('libreria', 'clientes') }}
),

renamed as (
    select
        id_cliente,
        nombre,
        apellido,
        tipo_cliente,
        especie,
        ciudad,
        direccion,
        telefono,
        email
    from source
),                   

deduplicado as (
    select *,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id_cliente) as rn
    from renamed
)

select * exclude (rn)
from deduplicado
where rn = 1

-- stg_ventas: normalizar id_cliente al formato HC
CASE
    WHEN id_cliente LIKE 'HC%' THEN id_cliente
    WHEN id_cliente LIKE 'C%'  
    THEN 'HC' || LPAD(REPLACE(id_cliente,'C',''), 4, '0')
END as id_cliente

- name: especie
        tests:
          - not_null
     - name: especie 
     tests:
          - accepted_values:
              values: ['mago', 'mugle', 'elfo', 'fantasma', 'centauro', 'duende', 'gigante', 'trol']
      - name: tipo_cliente
        tests:
          - accepted_values:
              values: ['mugle', 'puro_sangre', 'semimagico', 'mestizo', 'mugle_magico']