CREATE TABLE track_awards (
	trkaw_id INT PRIMARY KEY NOT NULL,
	track_id INT             NOT NULL,
	award_id INT             NOT NULL
);

CREATE TABLE awards (
	award_id INT PRIMARY KEY NOT NULL,
	aw_name  VARCHAR(20)     NOT NULL
);

CREATE TABLE alb_awards (
	albaw_id INT PRIMARY KEY NOT NULL,
	alb_id   INT             NOT NULL,
	award_id INT             NOT NULL
);

CREATE TABLE city_list (
	city_id   INT PRIMARY KEY NOT NULL,
	city_name VARCHAR(10)     NOT NULL
);

CREATE TABLE country_list (
	country_id   INT PRIMARY KEY NOT NULL,
	country_name VARCHAR(10)     NOT NULL
);

CREATE TABLE cities_in_country (
	cic_id     INT PRIMARY KEY NOT NULL,
	city_id    INT             NOT NULL,
	country_id INT             NOT NULL
);

CREATE TABLE selling (
	sel_id    INT PRIMARY KEY NOT NULL,
	cd_id     INT             NOT NULL,
	city_id   INT             NOT NULL,
	sold      INT             NOT NULL,
	sold_date DATE            NOT NULL
);

COMMIT;

ALTER TABLE track_awards
  ADD FOREIGN KEY (track_id) REFERENCES tracks (track_id);

ALTER TABLE track_awards
  ADD FOREIGN KEY (award_id) REFERENCES awards (award_id);

ALTER TABLE alb_awards
  ADD FOREIGN KEY (alb_id) REFERENCES albums (alb_id);

ALTER TABLE alb_awards
  ADD FOREIGN KEY (award_id) REFERENCES awards (award_id);

ALTER TABLE cities_in_country
  ADD FOREIGN KEY (city_id) REFERENCES city_list (city_id);

ALTER TABLE cities_in_country
  ADD FOREIGN KEY (country_id) REFERENCES country_list (country_id);

ALTER TABLE selling
  ADD FOREIGN KEY (cd_id) REFERENCES cds (cd_id);

ALTER TABLE selling
  ADD FOREIGN KEY (city_id) REFERENCES city_list (city_id);

COMMIT;