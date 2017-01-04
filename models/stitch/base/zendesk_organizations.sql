select
  id,
  external_id,
  name,
  case when deleted_at is not null then true else false end as deleted,
  created_at,
  updated_at,
  deleted_at
from {{var('organizations_table')}}
