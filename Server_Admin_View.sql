SELECT

  s.id AS site_id,
  s.name AS site_name,
  wb.project_id AS project_id,
  wb.project_name AS project_name,
  wb.id AS workbook_id,
  wb.name AS workbook_name,
  CAST(wb.workbook_url AS TEXT) AS workbook_url,
--   wb.size AS workbook_size,
--   wb.view_count AS workbook_view_count,
  wb.owner_id AS workbook_owner_id,
  wb.owner_name AS workbook_owner_name,
  wb.updated_at AS workbook_updated_at,
  vs.views_id AS view_id,
  vs.views_name AS view_name,
  CAST(vs.views_title AS TEXT) AS view_title,
  CAST(vs.views_url AS TEXT) AS view_url,
  vs.users_id AS user_id,
  vs.system_users_friendly_name AS user_name,
  vs.last_view_time AS user_last_viewed_date,
--   CAST(vs.device_type AS TEXT) AS view_device_type,
  vs.nviews AS user_total_views,
--   vs.system_users_name AS user_name,
  vs.users_login_at AS user_last_login  --,
--   vs.system_users_id AS view_system_users_id,
--   vs.views_owner_id AS views_owner_id,
--   vs.views_index AS views_index,
--   CAST(vs.views_caption AS TEXT) AS views_caption,
--   wb.created_at AS workbook_created_at,
--   wb.system_user_id AS workbook_system_user_id,
--   wb.domain_id AS workbook_domain_id,
--   wb.domain_name AS workbook_domain_name
FROM
  public._views_stats vs
  JOIN public._workbooks wb
    ON vs.views_workbook_id = wb.id
  JOIN public._sites s
    on wb.site_id = s.id
where wb.project_id != '56'
limit 100;
