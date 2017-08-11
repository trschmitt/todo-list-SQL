
CREATE TABLE todos (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  details TEXT NULL,
  priority INTEGER NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL,
  completed_at TIMESTAMP NULL
);


INSERT INTO todos(title, details, priority, created_at, completed_at) VALUES
    ('Finish homework', 'Complete todays homework before heading home', 1, now(), null),
    ('Catch up on Notes', 'catch up n notes from the backend portion of class', 3, now(), null),
    ('Watch Game of Thrones', null, 2, now(), null),
    ('Practice Code', 'do all of the things', 3 , now(), now()),
    ('Go for a walk', null, 4, now(), null);

--Select all that are completed.
SELECT * FROM todos WHERE completed_at IS NOT NULL;

--Select all that have a priority above 1
SELECT * FROM todos where priority > 1;

--Update a todo to completed
UPDATE todos SET completed_at = now()
  WHERE id = 5;

-- delete all completed todos
DELETE FROM todos WHERE completed_at IS NOT NULL;
