CREATE DATABASE skincare_db;
USE skincare_db;

CREATE TABLE IF NOT EXISTS category (
    id INT AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS data_source (
    id INT AUTO_INCREMENT,
    ds_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS brand (
    id INT AUTO_INCREMENT,
    brand_name VARCHAR(255) NOT NULL,
    ds_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (ds_id) REFERENCES data_source(id)
);

CREATE TABLE IF NOT EXISTS product (
    id INT AUTO_INCREMENT,
    product_url VARCHAR(255) NOT NULL,
    brand_id INT,
    product_name VARCHAR(255) NOT NULL,
    price DOUBLE,
    category_id INT,
    ds_id INT,
    review_num INT,
    avg_stars DOUBLE,
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (ds_id) REFERENCES data_source(id)
);

CREATE TABLE IF NOT EXISTS review (
    id INT AUTO_INCREMENT,
    product_id INT,
    review_date DATE NOT NULL,
    review_header VARCHAR(255) NOT NULL,
    review_comment TEXT NOT NULL,
    stars_num INT,
    PRIMARY KEY (id),
	FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO data_source (ds_name) VALUES ('Strawberrynet');
INSERT INTO data_source (ds_name) VALUES ('Sephora');
INSERT INTO data_source (ds_name) VALUES ('Both');

CREATE VIEW top_ratings_strawberrynet AS SELECT c.category_name, b.brand_name, p.product_name, p.price, p.avg_stars
		FROM product p
        JOIN brand b
        ON (p.brand_id = b.id)
        JOIN category c
        ON (p.category_id = c.id)
        JOIN data_source ds
        ON (p.ds_id = ds.id)
        WHERE ds.id = 1 ORDER BY p.avg_stars DESC, c.category_name ASC LIMIT 100;
CREATE VIEW top_ratings_sephora AS SELECT c.category_name, b.brand_name, p.product_name, p.price, p.avg_stars
		FROM product p
        JOIN brand b
        ON (p.brand_id = b.id)
        JOIN category c
        ON (p.category_id = c.id)
        JOIN data_source ds
        ON (p.ds_id = ds.id)
        WHERE ds.id = 2 ORDER BY p.avg_stars DESC, c.category_name ASC LIMIT 100;
CREATE VIEW top_brands_strawberrynet AS SELECT b.brand_name, avg(p.avg_stars) as avg_rating
		FROM product p
        JOIN brand b
        ON (p.brand_id = b.id)
        WHERE p.ds_id = 1 GROUP BY b.brand_name ORDER BY avg_rating DESC LIMIT 10;
CREATE VIEW top_brands_sephora AS SELECT b.brand_name, avg(p.avg_stars) as avg_rating
		FROM product p
        JOIN brand b
        ON (p.brand_id = b.id)
        WHERE p.ds_id = 2 GROUP BY b.brand_name ORDER BY avg_rating DESC LIMIT 10;