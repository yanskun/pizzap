CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE tv_stations (
  id uuid NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  name character varying(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT tv_stations_name_key UNIQUE (name)
);

CREATE TYPE category AS ENUM ('news', 'sports', 'entertainment', 'kids', 'movies', 'music', 'documentary', 'religion', 'lifestyle', 'educational', 'anime', 'reality', 'game', 'variety', 'shopping', 'adult');

CREATE TABLE tv_programs (
  id uuid NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4(),
  tv_station_id uuid NOT NULL REFERENCES tv_stations(id),
  title character varying(255) NOT NULL,
  start_time timestamp with time zone NOT NULL,
  end_time timestamp with time zone NOT NULL,
  categories category[] NOT NULL,
  CONSTRAINT fk_tv_station_id FOREIGN KEY (tv_station_id) REFERENCES tv_stations (id)
);

CREATE INDEX tv_programs_tv_station_id_idx ON tv_programs (tv_station_id);
