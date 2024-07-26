SELECT 
    p.id AS director_id,
    CONCAT(p.first_name, ' ', p.last_name) AS director_name,
    COALESCE(AVG(m.budget), 0) AS average_budget
FROM 
    People p
LEFT JOIN 
    Movie_People mp ON p.id = mp.person_id AND mp.role = 'director'
LEFT JOIN 
    Movies m ON mp.movie_id = m.id
GROUP BY 
    p.id, p.first_name, p.last_name
HAVING 
    COUNT(m.id) > 0
ORDER BY 
    average_budget DESC;