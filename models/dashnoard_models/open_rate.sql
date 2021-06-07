select
    marketing_campaign_name,
    marketing_campaign_version,
    (opens/delivered)*100 as open_rate
from
    (
    select
        marketing_campaign_name,
        marketing_campaign_version,
        sum(case when event = 'delivered' then 1 else 0 end) as delivered,
        sum(case when event = 'open' then 1 else 0 end) as opens
    from {{ ref('sample_data_AE')}}
    where
        marketing_campaign_split_id is not null
    group by
        marketing_campaign_name, marketing_campaign_version
    ) as temp
order by open_rate desc