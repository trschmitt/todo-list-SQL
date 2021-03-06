
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
    ('Go for a walk', null, 4, now(), null),
    ('Start Ozark', null, 5, now(), null),
    ('Play Overwatch', 'one of the best games known to man', 1, now(), now()),
    ('Play Destiny', 'yep loved this one', 4, now(), now()),
    ('Watch all HP movies','done this SO MANY TIMES... bout time for a rematch', 1, '2017-06-20 9:30', now()),
    ('Stuff', 'stuff goes here', 1, now(), null),
    ('Finish this class', 'almost there', 1, now(), null),
    ('Catch up on facebook', null, 4, now(), null),
    ('Watch stripes', null, 2, now(), now()),
    ('Practice Code', 'do more of all of the things', 4, now(), now()),
    ('Go for a run', null, 4, now(), null),
    ('Start another series', null, 5, now(), null),
    ('Go for a run', null, 1, '2017-06-20 9:30', null),
    ('Go for a run', null, 2, now(), now()),
    ('Go for a run', null, 3, now(), null),
    ('Go for a run', null, 5, '2017-08-21 11:00', now());

--Select all that are not complete and are priority of 3
SELECT * FROM todos WHERE completed_at IS NULL AND priority = 3;

--Statement to find the number of incomplete todos by priority
SELECT priority, COUNT(*)
FROM todos
WHERE completed_at IS NULL
GROUP BY priority
ORDER BY priority;

--Statement to find the number of todos by priority created in the last 30 days.
SELECT priority, COUNT(*)
FROM todos
WHERE created_at > now()::date - 30
GROUP BY priority
ORDER BY priority;

-- Statement to find the next todo you should work on. This is the todo with the highest priority that was created first.

SELECT title, details, priority, created_at
FROM todos
WHERE completed_at IS NULL
ORDER BY priority, created_at
LIMIT 1;
