SELECT 
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    JSON_BUILD_OBJECT(
        'id', f.id,
        'file_name', f.file_name,
        'mime_type', f.mime_type,
        'url', f.url
    ) AS poster,
    JSON_BUILD_OBJECT(
        'id', p.id,
        'first_name', p.first_name,
        'last_name', p.last_name
    ) AS director
FROM 
    Movies m
LEFT JOIN 
    Files f ON m.poster_id = f.id
LEFT JOIN 
    Movie_People mp ON m.id = mp.movie_id AND mp.role = 'director'
LEFT JOIN 
    People p ON mp.person_id = p.id
JOIN 
    Movie_Genres mg ON m.id = mg.movie_id
JOIN 
    Genres g ON mg.genre_id = g.id
WHERE 
    m.country_id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > INTERVAL '2 hours 15 minutes'
    AND g.name IN ('Action', 'Drama')
GROUP BY 
    m.id, m.title, m.release_date, m.duration, m.description, f.id, f.file_name, f.mime_type, f.url, p.id, p.first_name, p.last_name
ORDER BY 
    m.release_date DESC;