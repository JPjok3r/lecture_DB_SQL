SELECT 
    p.id,
    p.first_name,
    p.last_name,
    COALESCE(SUM(m.budget), 0) AS total_movies_budget
FROM 
    People p
INNER JOIN 
    Movie_People mp ON p.id = mp.person_id AND mp.role = 'actor'
LEFT JOIN 
    Movies m ON mp.movie_id = m.id
GROUP BY 
    p.id, p.first_name, p.last_name
HAVING 
    SUM(m.budget) > 0
ORDER BY 
    total_movies_budget DESC;
