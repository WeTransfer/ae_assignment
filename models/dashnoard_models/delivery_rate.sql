select
    temp.marketing_campaign_name,
    temp.marketing_campaign_version,
    (temp.delivered/(temp.delivered+temp.deferred+temp.dropped+temp.bounce))*100 as deliveryrate
FROM
    (
        SELECT
            marketing_campaign_version,
            marketing_campaign_name,
            sum(case when event = "delivered" then 1 else 0 end) as delivered,
            sum(case when event = "processed" then 1 else 0 end) as processed,
            sum(case when event = "deferred" then 1 else 0 end) as deferred,
            sum(case when event = "dropped" then 1 else 0 end) as dropped,
            sum(case when event = "bounce" then 1 else 0 end) as bounce
        FROM {{ ref('sample_data_AE')}}
        WHERE marketing_campaign_split_id IS NOT NULL and marketing_campaign_version !=""
        GROUP BY
            marketing_campaign_name, marketing_campaign_version
    ) as temp
order by deliveryrate desc