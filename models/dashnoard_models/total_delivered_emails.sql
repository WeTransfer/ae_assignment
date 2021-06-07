select
    marketing_campaign_name,
    marketing_campaign_version,
    sum(case when event = "delivered" then 1 else 0 end) as delivered
from {{ ref('sample_data_AE')}}
where
    marketing_campaign_split_id IS NOT NULL
group by
    marketing_campaign_id,
    marketing_campaign_version,
    marketing_campaign_name
order by
    delivered desc