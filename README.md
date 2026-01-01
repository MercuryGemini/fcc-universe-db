# Universe Database

A PostgreSQL database I built for the freeCodeCamp Relational Database Certification. 

## What?

A simple celestial bodies database with 5 tables modeling the hierarchy of the universe:

- **galaxy** → contains stars
- **star** → contains planets
- **planet** → contains moons and spacecraft
- **moon** → orbits planets
- **spacecraft** → originate from planets (because humans build them on Earth, though their destination might differ but I haven't accounted for that in the DB)

## Schema overview (generated)
```
galaxy (1) ──→ (M) star (1) ──→ (M) planet (1) ──┬──→ (M) moon
                                                 └──→ (M) spacecraft
```

Foreign keys enforce referential integrity down the chain. You can't have a star without a galaxy, a planet without a star, etc.

## Data

- 6 galaxies
- 6 stars 
- 12 planets (8 from our solar system + 4 fictional)
- 20 moons (real ones from our solar system + a few fictional)
- 3 spacecraft (Voyager 1, Apollo 11, Perseverance)

<b>NOTE:</b> Claude Opus 4.5 used for Data Generation. 

## Constraints used

- `PRIMARY KEY` with `SERIAL` for auto-increment
- `FOREIGN KEY` for relationships
- `NOT NULL` for required fields
- `UNIQUE` on all name columns

## How to restore
```bash
psql -U postgres < universe.sql
```

---
