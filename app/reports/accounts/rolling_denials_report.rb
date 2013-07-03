class Accounts::RollingDenialsReport < Dossier::Report
  def sql
    "
     SELECT
       CONCAT(users.first_name, ' ', users.last_name)   AS full_name,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = CURDATE() 
                  THEN status_changes.to ELSE NULL END) AS current_minus_0,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
                  THEN status_changes.to ELSE NULL END) AS current_minus_1,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 2 DAY) 
                  THEN status_changes.to ELSE NULL END) AS current_minus_2,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 3 DAY) 
                  THEN status_changes.to ELSE NULL END) AS current_minus_3,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 4 DAY) 
                  THEN status_changes.to ELSE NULL END) AS current_minus_4,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 5 DAY) 
                  THEN status_changes.to ELSE NULL END) AS current_minus_5,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 6 DAY) 
                  THEN status_changes.to ELSE NULL END) AS current_minus_6
     FROM
       status_changes 
       INNER JOIN users ON users.id = status_changes.changed_by_id
    WHERE
       status_changes.to = 'denial'
       AND status_changes.from != 'incomplete_account'
       AND status_changes.changed_at >= DATE_SUB(CURDATE(), INTERVAL 6 DAY)
     GROUP BY full_name

      UNION

     SELECT
       'Total'                                          AS full_name,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = CURDATE() 
                  THEN status_changes.to ELSE NULL END) AS current_minus_0,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 1 DAY)
                  THEN status_changes.to ELSE NULL END) AS current_minus_1,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 2 DAY) 
                  THEN status_changes.to ELSE NULL END) AS current_minus_2,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 3 DAY) 
                  THEN status_changes.to ELSE NULL END) AS current_minus_3,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 4 DAY) 
                  THEN status_changes.to ELSE NULL END) AS current_minus_4,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 5 DAY) 
                  THEN status_changes.to ELSE NULL END) AS current_minus_5,
       COUNT(CASE WHEN DATE(status_changes.changed_at) = DATE_SUB(CURDATE(), INTERVAL 6 DAY) 
                  THEN status_changes.to ELSE NULL END) AS current_minus_6
     FROM
       status_changes 
       INNER JOIN users ON users.id = status_changes.changed_by_id
     WHERE
       status_changes.to = 'denial'
       AND status_changes.changed_at >= DATE_SUB(CURDATE(), INTERVAL 6 DAY)
     ORDER BY FIELD(full_name, 'Total') ASC, full_name 
  "
  end

# def format_header(column_name)
#   d = Date.today
#   custom_headers = {
#   current_minus_0: 'd.strftime(%m/%d/%y)'
#   }
#   
# end

end
