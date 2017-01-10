select
  id,
  organization_id,
  assignee_id,
  brand_id,
  group_id,
  priority,
  subject,
  recipient,
  requester_id,
  status,
  submitter_id,
  "type",
  via__channel as channel,
  url as api_url,
  created_at,
  updated_at
from {{var('tickets_table')}}
