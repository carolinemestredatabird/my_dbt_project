WITH session_data AS (
  SELECT
    user_pseudo_id,
    ga_session_id,
    MIN(event_timestamp) AS session_start_time,
    MAX(event_timestamp) AS session_end_time,
    COUNT(DISTINCT event_name) AS event_count,
    COUNT(CASE WHEN event_name = 'page_view' THEN 1 END) AS pages_viewed,
    MAX(browser) AS browser_used,
    MAX(traffic_medium) AS traffic_medium,
    MAX(traffic_source) AS traffic_source,
    MAX(traffic_name) AS traffic_name
  FROM {{ ref('stg_google_analytics__event_flattened') }}
  WHERE ga_session_id IS NOT NULL
  GROUP BY user_pseudo_id, ga_session_id
)

SELECT
  user_pseudo_id,
  ga_session_id,
  CONCAT(user_pseudo_id, '-', ga_session_id) AS unique_session_id, 
  session_start_time,
  session_end_time,
  TIMESTAMP_DIFF(session_end_time, session_start_time, SECOND) AS session_duration_seconds,
  pages_viewed,
  event_count,
  browser_used,
  traffic_medium,
  traffic_source,
  traffic_name
FROM session_data
