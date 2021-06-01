select
  sg_event_id as event_id,
  event,
  email,
  "timestamp",
  marketing_campaign_id as campaign_id,
  marketing_campaign_split_id as campaign_split_id,
  marketing_campaign_version as campaign_version,
  marketing_campaign_name as campaign_name
from {{ ref('sample_data_AE')}}