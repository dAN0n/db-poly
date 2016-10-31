CREATE TABLE albums (
  alb_id         INT PRIMARY KEY NOT NULL,
  album          VARCHAR(100)    NOT NULL,
  label_id       INT,
  type_id        INT,
  "YEAR"         INT,
  rating         FLOAT,
  num_of_ratings INT
);

CREATE TABLE artists (
  art_id INT PRIMARY KEY NOT NULL,
  artist VARCHAR(100)    NOT NULL
);

CREATE TABLE cds (
  cd_id        INT PRIMARY KEY NOT NULL,
  code         VARCHAR(50)     NOT NULL,
  release_year INT
);

CREATE TABLE alb_art (
  alb_art_id INT PRIMARY KEY NOT NULL,
  alb_id     INT             NOT NULL,
  art_id     INT             NOT NULL
);

CREATE TABLE alb_in_cd (
  alb_cd_id INT PRIMARY KEY NOT NULL,
  cd_id     INT             NOT NULL,
  alb_id    INT             NOT NULL
);

CREATE TABLE labels (
  label_id INT PRIMARY KEY NOT NULL,
  label    VARCHAR(100)    NOT NULL
);

CREATE TABLE types (
  type_id INT PRIMARY KEY NOT NULL,
  type    VARCHAR(40)     NOT NULL
);

CREATE TABLE genres (
  genre_id INT PRIMARY KEY NOT NULL,
  genre    VARCHAR(40)     NOT NULL
);

CREATE TABLE tracks (
  track_id INT PRIMARY KEY NOT NULL,
  art_id   INT             NOT NULL,
  title    VARCHAR(100)    NOT NULL,
  duration TIME
);

CREATE TABLE tracklists (
  trklst_id INT PRIMARY KEY NOT NULL,
  alb_id    INT             NOT NULL,
  track_id  INT             NOT NULL
);

CREATE TABLE playlists (
  pl_id INT PRIMARY KEY NOT NULL,
  name  VARCHAR(200)    NOT NULL
);

CREATE TABLE pl_content (
  pl_cnt_id INT PRIMARY KEY NOT NULL,
  pl_id     INT             NOT NULL,
  track_id  INT             NOT NULL
);

CREATE TABLE alb_genres (
  alb_gen_id INT PRIMARY KEY NOT NULL,
  alb_id     INT             NOT NULL,
  genre_id   INT             NOT NULL
);

COMMIT;

ALTER TABLE albums
  ADD FOREIGN KEY (label_id) REFERENCES labels (label_id);

ALTER TABLE albums
  ADD FOREIGN KEY (type_id) REFERENCES types (type_id);

ALTER TABLE alb_art
  ADD FOREIGN KEY (alb_id) REFERENCES albums (alb_id);

ALTER TABLE alb_art
  ADD FOREIGN KEY (art_id) REFERENCES artists (art_id);

ALTER TABLE alb_in_cd
  ADD FOREIGN KEY (cd_id) REFERENCES cds (cd_id);

ALTER TABLE alb_in_cd
  ADD FOREIGN KEY (alb_id) REFERENCES albums (alb_id);

ALTER TABLE tracks
  ADD FOREIGN KEY (art_id) REFERENCES artists (art_id);

ALTER TABLE tracklists
  ADD FOREIGN KEY (alb_id) REFERENCES albums (alb_id);

ALTER TABLE tracklists
  ADD FOREIGN KEY (track_id) REFERENCES tracks (track_id);

ALTER TABLE pl_content
  ADD FOREIGN KEY (pl_id) REFERENCES playlists (pl_id);

ALTER TABLE pl_content
  ADD FOREIGN KEY (track_id) REFERENCES tracks (track_id);

ALTER TABLE alb_genres
  ADD FOREIGN KEY (alb_id) REFERENCES albums (alb_id);

ALTER TABLE alb_genres
  ADD FOREIGN KEY (genre_id) REFERENCES genres (genre_id);

COMMIT;