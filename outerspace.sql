CREATE TABLE stars (
    star_name TEXT PRIMARY KEY,
    star_temp_kelvin INT
);

CREATE TABLE planets (
    planet_name TEXT PRIMARY KEY,
    orbits_around TEXT references stars NOT NULL,
    orbital_period_years FLOAT
);

CREATE TABLE moons (
    moon_name TEXT PRIMARY KEY,
    planet TEXT references planets NOT NULL
);

INSERT INTO stars (star_name, star_temp_kelvin)
    VALUES ('The Sun', 5800),
            ('Proxima Centauri', 3042),
            ('Gliese 876', 3192);

INSERT INTO planets (planet_name, orbits_around, orbital_period_years)
    VALUES
        ('Earth', 'The Sun', 1.00),
        ('Mars', 'The Sun', 1.882),
        ('Venus', 'The Sun', 0.62),
        ('Proxima Centauri b', 'Proxima Centauri', 0.03),
        ('Gliese 876 b', 'Gliese 876', 0.236);

INSERT INTO moons (moon_name, planet)
    VALUES ('The Moon', 'Earth'),
            ('Phobos', 'Mars'),
            ('Deimos', 'Mars');

SELECT planets.planet_name, stars.star_name,
    SUM(CASE WHEN moons.planet = planets.planet_name THEN 1 ELSE 0 END) as moon_count
    FROM planets
    JOIN stars ON planets.orbits_around = stars.star_name
    LEFT JOIN moons on planets.planet_name = moons.planet
    GROUP BY planets.planet_name, stars.star_name
    ORDER BY planets.planet_name;