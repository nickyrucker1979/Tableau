SELECT vs.users_id AS view_users_id,
  vs.system_users_name AS view_system_users_name,
  vs.users_login_at AS view_users_login_at,
  vs.system_users_friendly_name AS view_system_users_friendly_name,
  vs.views_id AS view_views_id,
  vs.system_users_id AS view_system_users_id,
  vs.views_name AS views_name,
  CAST(vs.views_url AS TEXT) AS views_url,
  vs.views_workbook_id AS views_workbook_id,
  vs.views_created_at AS views_created_at,
  vs.views_owner_id AS views_owner_id,
  vs.views_index AS views_index,
  CAST(vs.views_title AS TEXT) AS views_title,
  CAST(vs.views_caption AS TEXT) AS views_caption,
  CAST(vs.device_type AS TEXT) AS view_device_type,
  vs.nviews AS view_nviews,
  vs.last_view_time AS view_last_view_time,
  vs.site_id AS view_site_id,
  wb.id AS workbook_id,
  wb.name AS workbook_name,
  CAST(wb.workbook_url AS TEXT) AS workbook_url,
  wb.created_at AS workbook_created_at,
  wb.updated_at AS workbook_updated_at,
  wb.owner_id AS workbook_owner_id,
  wb.project_id AS workbook_project_id,
  wb.size AS workbook_size,
  wb.view_count AS workbook_view_count,
  wb.owner_name AS workbook_owner_name,
  wb.project_name AS workbook_project_name,
  wb.system_user_id AS workbook_system_user_id,
  wb.site_id AS workbook_site_id,
  s.name AS site_name,
  wb.domain_id AS workbook_domain_id,
  wb.domain_name AS workbook_domain_name
FROM
  public._views_stats vs
  JOIN public._workbooks wb
    ON vs.views_workbook_id = wb.id
  JOIN public._sites s
    on wb.site_id = s.id
limit 100;
