SELECT 
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    JSON_BUILD_OBJECT(
        'id', pf.id,
        'file_name', pf.file_name,
        'mime_type', pf.mime_type,
        'url', pf.url
    ) AS poster,
    JSON_BUILD_OBJECT(
        'id', d.id,
        'first_name', d.first_name,
        'last_name', d.last_name,
        'photo', JSON_BUILD_OBJECT(
            'id', df.id,
            'file_name', df.file_name,
            'mime_type', df.mime_type,
            'url', df.url
        )
    ) AS director,
    COALESCE(
        (SELECT 
            JSON_AGG(
                JSON_BUILD_OBJECT(
                    'id', a.id,
                    'first_name', a.first_name,
                    'last_name', a.last_name,
                    'photo', JSON_BUILD_OBJECT(
                        'id', a.photo_id,
                        'file_name', a.photo_file_name,
                        'mime_type', a.photo_mime_type,
                        'url', a.photo_url
                    )
                )
            )
         FROM (SELECT DISTINCT ON (amp.person_id) 
                 amp.person_id, 
                 a.id, 
                 a.first_name, 
                 a.last_name, 
                 af.id AS photo_id, 
                 af.file_name AS photo_file_name, 
                 af.mime_type AS photo_mime_type, 
                 af.url AS photo_url
               FROM Movie_People amp
               JOIN People a ON amp.person_id = a.id
               LEFT JOIN Files af ON a.primary_photo_id = af.id
               WHERE amp.movie_id = m.id AND amp.role = 'actor'
              ) AS a
        ),
        '[]'
    ) AS actors,
    COALESCE(
        (SELECT 
            JSON_AGG(
                JSON_BUILD_OBJECT(
                    'id', g.id,
                    'name', g.name
                )
            )
         FROM (SELECT DISTINCT g.id, g.name
               FROM Movie_Genres mg
               JOIN Genres g ON mg.genre_id = g.id
               WHERE mg.movie_id = m.id) AS g
        ),
        '[]'
    ) AS genres
FROM 
    Movies m
LEFT JOIN 
    Files pf ON m.poster_id = pf.id
LEFT JOIN 
    Movie_People dmp ON m.id = dmp.movie_id AND dmp.role = 'director'
LEFT JOIN 
    People d ON dmp.person_id = d.id
LEFT JOIN 
    Files df ON d.primary_photo_id = df.id
WHERE 
    m.id = 1;