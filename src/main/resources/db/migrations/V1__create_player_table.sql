DROP table if exists "player";

CREATE TABLE player
(
  id         serial PRIMARY KEY,
  username   VARCHAR(50) UNIQUE  NOT NULL,
  password   VARCHAR(50)         NOT NULL,
  email      VARCHAR(355) UNIQUE NOT NULL,
  created_on TIMESTAMP           NOT NULL,
  last_login TIMESTAMP
);

INSERT INTO player(id, username, password, email, created_on)
VALUES (DEFAULT, 'twcrone', '', 'twcrone@gmail.com', NOW());