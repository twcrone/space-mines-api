CREATE SEQUENCE hibernate_sequence START 1;

DROP TABLE IF EXISTS "pod";
DROP TABLE IF EXISTS "sector";
DROP TABLE IF EXISTS "game";
DROP TABLE IF EXISTS "mine_field";

CREATE TABLE IF NOT EXISTS "mine_field"
(
  "id"   BIGINT PRIMARY KEY,
  "size" INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS "sector"
(
  "id"            BIGINT PRIMARY KEY,
  "mine_field_id" BIGINT  NOT NULL,
  "x"             INTEGER NOT NULL,
  "y"             INTEGER NOT NULL,
  "z"             INTEGER NOT NULL,
  "radiation"     INTEGER DEFAULT 0,
  "mine"          BOOLEAN DEFAULT FALSE,

  FOREIGN KEY ("mine_field_id") REFERENCES "mine_field" ("id")
);

CREATE TABLE IF NOT EXISTS "game"
(
  "id"            BIGINT PRIMARY KEY,
  "mine_field_id" BIGINT NOT NULL,

  FOREIGN KEY ("mine_field_id") REFERENCES "mine_field" ("id")
);

CREATE TABLE IF NOT EXISTS "pod"
(
  "id"        BIGINT PRIMARY KEY,
  "game_id"   INTEGER NOT NULL,
  "x"         INTEGER NOT NULL,
  "y"         INTEGER NOT NULL,
  "z"         INTEGER NOT NULL,
  "radiation" INTEGER NOT NULL,
  "flagged"   BOOLEAN DEFAULT FALSE,

  FOREIGN KEY ("game_id") REFERENCES "game" ("id")
);

INSERT INTO mine_field(id, size)
VALUES (1, 3);

INSERT INTO sector(id, mine_field_id, x, y, z, mine)
VALUES (1, 1, 1, 1, 1, true);
