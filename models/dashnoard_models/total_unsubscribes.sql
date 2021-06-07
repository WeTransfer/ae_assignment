select
    temp.marketing_campaign_version,
    temp.marketing_campaign_name,
    temp.group_unsubscribe_cnt-temp.group_resubscribe_cnt+temp.unsubscribe as totalUnsubscribe
FROM
    (SELECT
        marketing_campaign_version,
        marketing_campaign_name,
        sum(case when event = "group_unsubscribe" then 1 else 0 end) as group_unsubscribe_cnt,
        sum(case when event = "group_resubscribe" then 1 else 0 end) as group_resubscribe_cnt,
        sum(case when event = "unsubscribe" then 1 else 0 end) as unsubscribe
    FROM {{ ref('sample_data_AE')}}
    WHERE marketing_campaign_split_id IS NOT NULL and marketing_campaign_version !=""
    GROUP BY
        marketing_campaign_name, marketing_campaign_version
    ) as temp
order by totalUnsubscribe desc
