SELECT
    temp.marketing_campaign_id,
    temp.marketing_campaign_name,
    temp.marketing_campaign_version,
    (temp.total_clicks/temp.total_opens)*100 as percentage
from
    (
    SELECT
        marketing_campaign_id,
        marketing_campaign_version,
        marketing_campaign_name,
        count(case when event = "click" then event else NULL end) as total_clicks,
        count(case when event = "open" then event else NULL end) as total_opens
    FROM {{ ref('sample_data_AE')}}
    WHERE marketing_campaign_split_id IS NOT NULL
    GROUP BY
        marketing_campaign_id,
        marketing_campaign_version,
        marketing_campaign_name
    ) as temp
order by percentage desc
