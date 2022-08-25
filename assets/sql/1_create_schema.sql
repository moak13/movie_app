CREATE TABLE IF NOT EXISTS movie (
    id INTEGER PRIMARY KEY,
    Title Text,
    Rated Text,
    Released DATETIME,
    Plot Text,
    Language Text,
    Country Text,
    Poster Text,
    imdbRating Text,
    Type Text
);

CREATE TABLE IF NOT EXISTS blocked (
    id INTEGER PRIMARY KEY,
    Title Text
);