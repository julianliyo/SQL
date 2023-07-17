-- 1
SELECT sum(billing.amount) as revenue, billing.charged_datetime as month
FROM billing
WHERE billing.charged_datetime LIKE '2012-03%';

-- 2
SELECT sum(b.amount) as total_revenue, c.client_id 
FROM billing b
JOIN clients c ON c.client_id = b.client_id
WHERE c.client_id = 2;

-- 3

SELECT s.domain_name as website, c.client_id 
FROM sites s
JOIN clients c ON c.client_id = s.client_id
WHERE c.client_id = 10;

-- 4

SELECT c.client_id, COUNT(*) AS website,YEAR(created_datetime) AS year, MONTH(created_datetime) AS month
FROM sites s
JOIN clients c ON c.client_id = s.client_id
WHERE c.client_id = 1
GROUP BY YEAR(created_datetime), MONTH(created_datetime) 
ORDER BY YEAR(created_datetime), MONTH(created_datetime);
-- id=20
SELECT c.client_id, COUNT(*) AS website,YEAR(created_datetime) AS year, MONTH(created_datetime) AS month
FROM sites s
JOIN clients c ON c.client_id = s.client_id
WHERE c.client_id = 20
GROUP BY YEAR(created_datetime), MONTH(created_datetime)
ORDER BY YEAR(created_datetime), MONTH(created_datetime);


-- 5

SELECT sites.domain_name AS website, COUNT(*) AS number_of_leads, leads.registered_datetime
FROM sites
JOIN leads ON leads.site_id = sites.site_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-02-15'
GROUP BY sites.domain_name, leads.registered_datetime;

-- 6 
SELECT concat(clients.first_name, clients.last_name) as name, COUNT(leads.first_name) AS leads 
FROM clients
JOIN sites ON sites.client_id = clients.client_id
JOIN leads ON leads.site_id = sites.site_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY clients.first_name, concat(clients.first_name, clients.last_name)
ORDER BY leads DESC;

-- 7
SELECT concat(clients.first_name, clients.last_name) as name, COUNT(leads.leads_id) as leads, month(leads.registered_datetime) as month
from clients
JOIN sites ON sites.client_id = clients.client_id
JOIN leads ON leads.site_id = sites.site_id
WHERE YEAR(leads.registered_datetime) = 2011 AND MONTH(leads.registered_datetime) BETWEEN 1 AND 6
GROUP BY clients.first_name, concat(clients.first_name, clients.last_name)
ORDER BY clients.first_name;

-- 8 
SELECT concat(clients.first_name,' ', clients.last_name ) as name, sites.domain_name as website, COUNT(leads.first_name) as leads, MAX(leads.registered_datetime) as date
FROM clients
JOIN sites ON sites.client_id = clients.client_id
JOIN leads ON leads.site_id = sites.site_id
WHERE leads.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY sites.domain_name, clients.first_name, clients.last_name,clients.client_id
ORDER BY clients.client_id;

-- segundo codigo
SELECT CONCAT(clients.first_name,' ', clients.last_name ) AS clients, sites.domain_name AS website, COUNT(leads.leads_id) AS leads 
FROM clients
JOIN sites ON sites.client_id = clients.client_id
JOIN leads ON leads.site_id = sites.site_id
WHERE YEAR(leads.registered_datetime) = 2011
GROUP BY sites.site_id
ORDER BY clients.client_id;

-- 9 

SELECT CONCAT(clients.first_name,' ', clients.last_name ) as name,SUM(billing.amount), MONTH(billing.charged_datetime) as month
FROM billing
JOIN clients ON clients.client_id = billing.client_id
GROUP BY MONTH(billing.charged_datetime), CONCAT(clients.first_name,' ', clients.last_name )
ORDER BY clients.client_id;

-- 10
SELECT CONCAT(clients.first_name,' ', clients.last_name ) as name, GROUP_CONCAT(sites.domain_name SEPARATOR '/') AS concatenated_domains
FROM sites
JOIN clients ON clients.client_id = sites.client_id
GROUP BY CONCAT(clients.first_name,' ', clients.last_name ), clients.client_id
ORDER BY clients.client_id;

