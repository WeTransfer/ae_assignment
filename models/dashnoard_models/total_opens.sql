select
    marketing_campaign_name,
    marketing_campaign_version,
    COUNT(*) as total_opens
from {{ ref('sample_data_AE')}}
where
    event like 'open' and marketing_campaign_split_id IS NOT NULL
group by
    marketing_campaign_id,
    marketing_campaign_version,
    marketing_campaign_name
order by
    total_opens desc