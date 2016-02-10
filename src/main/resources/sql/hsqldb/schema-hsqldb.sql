-- Digest Table

DROP TABLE IF EXISTS digest;

CREATE SEQUENCE digest_digest_id_seq;
CREATE TABLE digest (
  digest_id INTEGER GENERATED BY DEFAULT AS SEQUENCE digest_digest_id_seq PRIMARY KEY,
  title varchar(50) NOT NULL,
  published_date DATE,
  created_date DATE default current_date
);

--------------------------------------------------------------

-- Topic Table
DROP TABLE IF EXISTS topic;
CREATE SEQUENCE topic_topic_id_seq;
CREATE TABLE topic (
  topic_id INTEGER GENERATED BY DEFAULT AS SEQUENCE topic_topic_id_seq PRIMARY KEY,
  topic_name varchar(50) NOT NULL,
  order_priority Integer NOT NULL
);
--------------------------------------------------------------


-- Article Table
DROP TABLE IF EXISTS article;

CREATE SEQUENCE article_article_id_seq;
CREATE TABLE article (
    article_id INTEGER GENERATED BY DEFAULT AS SEQUENCE article_article_id_seq PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    description LONGVARCHAR,
    created_date DATE default current_date,
    updated_date DATE,
    topic_id INT,
    FOREIGN KEY (topic_id) REFERENCES topic (topic_id)
);
--------------------------------------------------------------

-- Digest-Topic-Article table
DROP TABLE IF EXISTS topic_articles;

CREATE TABLE topic_articles (
  topic_id INTEGER NOT NULL,
  article_id Integer NOT NULL,
  PRIMARY KEY ( topic_id, article_id ) );
--------------------------------------------------------------

-- Digest-Topic-Article table
DROP TABLE IF EXISTS digest_topic_article;

CREATE SEQUENCE digest_topic_article_dta_id_seq;
CREATE TABLE digest_topic_article (
  dta_id INTEGER GENERATED BY DEFAULT AS SEQUENCE digest_topic_article_dta_id_seq PRIMARY KEY,
  digest_id Integer NOT NULL,
  topic_id Integer NOT NULL,
  article_id Integer NOT NULL
  );

