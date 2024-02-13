CREATE TABLE schools_right (
id integer CONSTRAINT right_id_key PRIMARY KEY,
right_school varchar(30)
);

CREATE TABLE licenses (
license_id varchar(10),
first_name varchar(50),
last_name varchar(50),
CONSTRAINT licenses_key PRIMARY KEY (license_id)
);

CREATE TABLE registrations (
registration_id varchar(10),
registration_date date,
license_id varchar(10) REFERENCES licenses (license_id),
CONSTRAINT registration_key PRIMARY KEY (registration_id, license_id)
);

INSERT INTO licenses (license_id, first_name, last_name)
VALUES ('T229901', 'Lynn', 'Malero');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A203391', '3/11/2017', 'T229901');

INSERT INTO registrations (registration_id, registration_date, license_id)
VALUES ('A75772', '3/10/2017', 'T229901');


SELECT * FROM schools_right;

SELECT * FROM schools_left;

SELECT * FROM schools_left LEFT JOIN schools_right
ON schools_left.id=schools_right.id
WHERE schools_right.id IS NULL;

SELECT * FROM schools_left FULL OUTER JOIN schools_right
ON schools_left.id=schools_right.id;

SELECT lt.id, lt.left_school, en.enrollment, gr.grades
FROM schools_left AS lt LEFT JOIN schools_enrollment AS en
ON lt.id = en.id
LEFT JOIN schools_grades AS gr
ON lt.id = gr.id;

CREATE TABLE natural_key_example (
license_id varchar(10)  PRIMARY KEY,
first_name varchar(50),
last_name varchar(50)
);

CREATE TABLE natural_key_example (
license_id varchar(10),
first_name varchar(50),
last_name varchar(50),
CONSTRAINT license_key PRIMARY KEY (license_id)
);


INSERT INTO natural_key_example (license_id, first_name, last_name)
VALUES ('T229901', 'Lynn', 'Malero');


INSERT INTO natural_key_example (license_id, first_name, last_name)
VALUES ('T229901', 'Sam', 'Tracy');


DROP TABLE natural_key_example;

SELECT * FROM natural_key_example;

INSERT INTO schools_enrollment (id, enrollment)
VALUES
(1, 360),
(2, 1001),
(5, 450),
(6, 927);

INSERT INTO schools_grades (id, grades)
VALUES
(1, 'K-3'),
(2, '9-12'),
(5, '6-8'),
(6, '9-12');

CREATE TABLE schools_grades (
id integer,
grades varchar(10)
);


CREATE TABLE schools_enrollment (
id integer,
enrollment integer
);

SELECT * FROM schools_left LEFT JOIN schools_right
ON schools_left.id=schools_right.id;

SELECT * FROM schools_left JOIN schools_right
ON schools_left.id=schools_right.id;

SELECT lt.id,
lt.left_school,
rt.right_school
FROM schools_left AS lt LEFT JOIN schools_right AS rt
ON lt.id = rt.id;

SELECT schools_left.id,
schools_left.left_school,
schools_right.right_school
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id;

SELECT * FROM schools_left CROSS JOIN schools_right;


INSERT INTO schools_left (id, left_school) VALUES
(1, 'Oak Street School'),
(2, 'Roosevelt High School'),
(5, 'Washington Middle School'),
(6, 'Jefferson High School');


INSERT INTO schools_right (id, right_school) VALUES
(1, 'Oak Street School'),
(2, 'Roosevelt High School'),
(3, 'Morrison Elementary'),
(4, 'Chase Magnet Academy'),
(6, 'Jefferson High School');


CREATE TABLE schools_left (
id integer CONSTRAINT left_id_key PRIMARY KEY,
left_school varchar(30)
);


SELECT * FROM departments;

SELECT * FROM employees;

SELECT * FROM employees JOIN departments
ON employees.dept_id = departments.dept_id;