SELECT 
    u.id,
    u.username,
    ARRAY_AGG(f.movie_id ORDER BY f.movie_id) AS favorite_movie_ids
FROM 
    Users u
LEFT JOIN 
    Favorites f ON u.id = f.user_id
GROUP BY 
    u.id, u.username
ORDER BY 
    u.id;