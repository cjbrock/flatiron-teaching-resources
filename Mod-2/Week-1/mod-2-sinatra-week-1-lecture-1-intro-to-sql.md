<!-- control + click to get the options menu to open sqlite browset -->
<!-- walk through how to run sqlite browser -->


<!-- Questions to ask? -->
<!-- Does case matter? - it depends! -->



# Lecture notes

1. Write the SQL to return all of the rows in the artists table?

```SQL
  SELECT * from artists
```

 - what if we just wanted the name?
```SQL
  SELECT name from artists
```

2. Write the SQL to select the artist with the name "Black Sabbath"

```SQL
  SELECT * from artists WHERE name = "Black Sabbath"
```
- what if we wanted all artists with black in the name?
```SQL
  SELECT * from artists WHERE name LIKE "%Black%"
```

3. Write the SQL to create a table named 'fans' with an autoincrementing ID that's a primary key and a name field of type text

```sql
  CREATE TABLE fans(id INTEGER PRIMARY KEY, name STRING)
```


4. Write the SQL to alter the fans table to have a artist_id column type integer?

```sql
  ALTER TABLE fans ADD COLUMN artist_id INTEGER
```

5. Write the SQL to add yourself as a fan of the Black Eyed Peas? ArtistId **169**

```sql
  INSERT INTO fans(name, artist_id) VALUES ('corinna', 169)
```

6. Check out the [Faker gem](https://github.com/stympy/faker). `gem install faker`, open up irb, run `require 'faker'` and then generate a fake name for yourself using `Faker::Name.name`. How would you update your name in the fans table to be your new name?
 <!-- gem install faker -->
 <!-- open irb -->
 <!-- run require 'faker' -->
 <!-- run Faker::Name.name -->
 <!-- copy name -->

```sql
  UPDATE fans
  SET name = "Whatever faker gives you"
  WHERE
  id = 1
```

or
```sql
  UPDATE fans
  SET name = "Whatever faker gives you"
  WHERE
  name = "current name"
```

7. Write the SQL to delete your row in the fans table.

```sql
  DELETE FROM fans WHERE id=1
```

8. Write the SQL to return fans that are not fans of the black eyed peas.
<!-- need to insert some stuff, add random stuff -->
INSERT INTO fans(name, artist_id) VALUES ('corinna', 169)

```sql
  SELECT * FROM fans WHERE artist_id != 169
```
SELECT * FROM fans WHERE artist_id IS NOT 169
SELECT * FROM fans WHERE artist_id <> 169