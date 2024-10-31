CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	tytle VARCHAR(80) UNIQUE NOT NULL
	
);

CREATE TABLE IF NOT EXISTS Singer (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL
	
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	tytle VARCHAR(220) NOT NULL,
	release_year INTEGER NOT NULL
	
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	tytle VARCHAR(220) NOT NULL,
	release_year INTEGER NOT NULL
	
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	tytle VARCHAR(220) NOT NULL,
	track_duration INTERVAL NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Album(id)
	
);

CREATE TABLE IF NOT EXISTS GenreSinger (
	genre_id INTEGER NOT NULL REFERENCES Genre(id),
	singer_id INTEGER NOT NULL REFERENCES Singer(id),
	CONSTRAINT gs primary key (genre_id,singer_id)
	
);

CREATE TABLE IF NOT EXISTS AlbumSinger (
	album_id INTEGER NOT NULL REFERENCES Album(id),
	singer_id INTEGER NOT NULL REFERENCES Singer(id),
	CONSTRAINT sa primary key (album_id,singer_id)
	
);

CREATE TABLE IF NOT EXISTS TrackCollection (
	track_id INTEGER NOT NULL REFERENCES Track(id),
	collection_id INTEGER NOT NULL REFERENCES Collection(id),
	CONSTRAINT tc primary key (track_id,collection_id)
	
);
