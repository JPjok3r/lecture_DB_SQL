SELECT 
    m.id,
    m.title,
    COUNT(DISTINCT mp.person_id) AS actors_count
FROM 
    Movies m
LEFT JOIN 
    Movie_People mp ON m.id = mp.movie_id AND mp.role = 'actor'
WHERE 
    m.release_date >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY 
    m.id, m.title
ORDER BY 
    m.release_date DESC;