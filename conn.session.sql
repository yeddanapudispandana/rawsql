CREATE TABLE dept(
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
INSERT INTO dept(dept_name)
VALUES ('Sales'),
    ('Tech'),
    ('Support');
SELECT *
FROM dept;
CREATE TABLE emp(
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    bio TEXT,
    job_title VARCHAR(50) NOT NULL,
    salary INT NOT NULL CHECK(salary > 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    hire_date DATE NOT NULL,
    last_login TIMESTAMP,
    emp_status VARCHAR(20) NOT NULL DEFAULT 'active' CHECK(
        emp_status IN ('active', 'terminated', 'on_leave')
    ),
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    --now() will enter the time when row is inserted
    dept_id INT REFERENCES dept(dept_id),
    manager_id INT REFERENCES emp(emp_id) --self referencing: manager is an emp, and every emp has a manager
);
INSERT INTO emp (
        first_name,
        last_name,
        email,
        phone,
        bio,
        job_title,
        salary,
        is_active,
        hire_date,
        last_login,
        emp_status,
        dept_id,
        manager_id
    )
VALUES -- 1. Top manager (manager_id is NULL)
    (
        'Alice',
        'Johnson',
        'alice.johnson@example.com',
        '555-0101',
        'Head of Technology and engineering lead.',
        'VP of Engineering',
        160000,
        TRUE,
        '2021-01-15',
        '2024-05-10 09:30:00',
        'active',
        2,
        NULL
    ),
    -- 2. Tech Lead reporting to Alice (emp_id: 1)
    (
        'Bob',
        'Smith',
        'bob.smith@example.com',
        '555-0102',
        'Full-stack software engineer and cloud architect.',
        'Tech Lead',
        125000,
        TRUE,
        '2021-06-01',
        '2024-05-09 14:15:00',
        'active',
        2,
        1
    ),
    -- 3. Senior Dev reporting to Bob (emp_id: 2)
    (
        'Charlie',
        'Brown',
        'charlie.brown@example.com',
        '555-0103',
        'Backend specialist focusing on PostgreSQL and Node.js.',
        'Senior Backend Developer',
        105000,
        TRUE,
        '2022-03-10',
        '2024-05-11 11:00:00',
        'active',
        2,
        2
    ),
    -- 4. Junior Dev reporting to Bob (emp_id: 2)
    (
        'Diana',
        'Prince',
        'diana.prince@example.com',
        '555-0104',
        'Frontend engineer enthusiastic about UI/UX and React.',
        'Junior Frontend Developer',
        72000,
        TRUE,
        '2023-08-20',
        '2024-05-10 16:45:00',
        'active',
        2,
        2
    ),
    -- 5. Sales Manager (manager_id is NULL)
    (
        'Evan',
        'Wright',
        'evan.wright@example.com',
        '555-0105',
        'Experienced sales director driving enterprise client growth.',
        'Sales Manager',
        130000,
        TRUE,
        '2020-11-05',
        '2024-05-08 08:30:00',
        'active',
        1,
        NULL
    ),
    -- 6. Sales Executive reporting to Evan (emp_id: 5)
    (
        'Fiona',
        'Gallagher',
        'fiona.gallagher@example.com',
        '555-0106',
        'Account manager handling B2B corporate contracts.',
        'Sales Executive',
        85000,
        TRUE,
        '2022-07-12',
        '2024-05-11 10:20:00',
        'active',
        1,
        5
    ),
    -- 7. Support Lead (manager_id is NULL)
    (
        'George',
        'Clark',
        'george.clark@example.com',
        '555-0107',
        'Customer experience specialist overseeing support queues.',
        'Customer Support Lead',
        90000,
        TRUE,
        '2021-09-01',
        '2024-05-11 09:10:00',
        'active',
        3,
        NULL
    ),
    -- 8. Support Agent reporting to George (emp_id: 7, currently on leave)
    (
        'Hannah',
        'Abbott',
        'hannah.abbott@example.com',
        '555-0108',
        'Customer service representative handling tier-1 tickets.',
        'Support Specialist',
        55000,
        TRUE,
        '2023-02-14',
        '2024-04-28 17:00:00',
        'on_leave',
        3,
        7
    );
ALTER TABLE emp
ADD COLUMN int_nnote VARCHAR(100) NOT NULL DEFAULT 'N/A';
select *
from emp;
ALTER TABLE emp
    RENAME COLUMN int_nnote to hr_note;