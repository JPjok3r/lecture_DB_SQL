# Homework JS DB-SQL
### Mermaid ER Diagram

```
erDiagram
    Users ||--o| Files : "has avatar"
    Users {
        serial id PK
        varchar(50) username UK
        varchar(50) first_name
        varchar(50) last_name
        varchar(255) email UK
        varchar(255) password
        int avatar_id FK
        timestamp created_at
        timestamp updated_at
    }
    Files {
        serial id PK
        varchar(255) file_name
        varchar(100) mime_type
        varchar(255) key UK
        varchar(255) url
        boolean is_public
        timestamp created_at
        timestamp updated_at
    }
    Movies ||--|{ Movie_Genres : has
    Movies ||--o| Files : "has poster"
    Movies ||--|| Countries : "produced in"
    Movies {
        serial id PK
        varchar(255) title
        text description
        decimal budget
        date release_date
        interval duration
        int poster_id FK
        int country_id FK
        timestamp created_at
        timestamp updated_at
    }
    Countries {
        serial id PK
        varchar(100) name UK
        timestamp created_at
        timestamp updated_at
    }
    Genres {
        serial id PK
        varchar(50) name UK
        timestamp created_at
        timestamp updated_at
    }
    Movie_Genres {
        int movie_id PK,FK
        int genre_id PK,FK
    }
    Genres ||--|{ Movie_Genres : "categorizes"
    Characters ||--|| Movies : "appears in"
    Characters {
        serial id PK
        varchar(100) name
        text description
        character_role role
        int movie_id FK
        timestamp created_at
        timestamp updated_at
    }
    People {
        serial id PK
        varchar(50) first_name
        varchar(50) last_name
        text biography
        date date_of_birth
        gender gender
        int country_id FK
        int primary_photo_id FK
        timestamp created_at
        timestamp updated_at
    }
    People ||--o| Countries : "from"
    People ||--o| Files : "has primary photo"
    Movie_People {
        int movie_id PK,FK
        int person_id PK,FK
        movie_role role
        varchar(100) character_name
        timestamp created_at
        timestamp updated_at
    }
    Movies ||--|{ Movie_People : has
    People ||--|{ Movie_People : participates
    Person_Photos {
        serial id PK
        int person_id FK
        int file_id FK
        timestamp created_at
        timestamp updated_at
    }
    People ||--|{ Person_Photos : has
    Files ||--o{ Person_Photos : used_in
    Favorites {
        int user_id PK,FK
        int movie_id PK,FK
        timestamp created_at
        timestamp updated_at
    }
    Favorites }|--|| Users : "saved by"
    Movies ||--|{ Favorites : "is favorite of"
  
```

### Queries
1st query: Select actors with total budget [1_query](https://github.com/JPjok3r/lecture_DB_SQL/blob/main/1_select_actors_w_budget.sql)
2nd query: Select movies released in the last 5 years [2_query](https://github.com/JPjok3r/lecture_DB_SQL/blob/main/2_select_movies_released_5yago.sql)
3rd query: Select all users along with their favorite movies [3_query](https://github.com/JPjok3r/lecture_DB_SQL/blob/main/3_select_users_w_favorites.sql)
4th query: Select directors with average budget of their movies [4_query](https://github.com/JPjok3r/lecture_DB_SQL/blob/main/4_select_directors_w_avg_budget.sql)
5th query: Select detailed information about movies [5_query](https://github.com/JPjok3r/lecture_DB_SQL/blob/main/5_select_movie_detailed_info.sql)
6th query: Select detailed information about a movie [6_query](https://github.com/JPjok3r/lecture_DB_SQL/blob/main/6_select_detailed_info_for_a_certain_movie.sql)

### Data
I just added a file with a sql script to insert data for testing just in case you use it.