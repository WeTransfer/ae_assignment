select
  sg_event_id,
  event,
  email,
  "timestamp",
  marketing_campaign_id,
  marketing_campaign_split_id,
  marketing_campaign_version,
  marketing_campaign_name
from {{ ref('sample_events')}}