CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
  this creates the bookshelves table, where a unique instance of each bookshelf name will be stored. 

INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
  this pulls the unique bookshelf names and populates the bookshelf table with them. 

ALTER TABLE books ADD COLUMN bookshelf_id INT;
  this creates the column where bookshelf_id will be stored - starting the process of linking the two files 

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
  this tells SQ: that books and bookshel are going to be linked along the lines of bookshelf and bookshelf_id 

ALTER TABLE books DROP COLUMN bookshelf; 
  this drops the bookshelf column, thus eliminating excess data. 


ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
  finally, this changes bookshelves_id into a foriegn key that refrences bookshelves(id) linking two tables and creating the connection 