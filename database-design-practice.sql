START TRANSACTION;

DROP TABLE IF EXISTS posts, reviews, movies;

CREATE TABLE movies (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    year INT,
    is_reviewed BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE reviews (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL REFERENCES movies(id),
    score DECIMAL(3,1) NOT NULL DEFAULT 0
);

CREATE TABLE posts (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL REFERENCES movies(id),
    posted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO movies (title, year, is_reviewed) 
VALUES 
('Fight Club', 1999, 1),
('Scott Pilgrim vs. the World', 2010, 1),
('Sorry to Bother You', 2018, 0),
('The Substance', 2024, 0),
('Vertigo', 1958, 1);

INSERT INTO reviews (movie_id, score) 
VALUES 
(1, 9.6),
(2, 9.5),
(3, 9.0),
(4, 9.6),
(5, 9.7);

INSERT INTO posts (movie_id) 
VALUES 
(1),
(2),
(3),
(4),
(5);

COMMIT;

SELECT * FROM reviews;