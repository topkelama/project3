create DATABASE job_listing;
CREATE INDEX idx_company_location ON Location (company_location);
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    work_year INT,
    experience_level VARCHAR(50),
    employment_type VARCHAR(50),
    employee_residence VARCHAR(50),
    remote_ratio INT,
    job_title_id INT,
    company_location_id INT,
    FOREIGN KEY (job_title_id) REFERENCES Job(job_title_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Job (
    job_title_id INT AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(100),
    salary INT,
    salary_currency VARCHAR(10),
    salary_in_usd INT
    
);

CREATE TABLE Company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_location VARCHAR(100),
    company_size varchar(100),
    foreign key (company_location) references Location(company_location)
);

CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    company_location VARCHAR(100),
    employee_residence varchar(100)
);

INSERT INTO Employee (work_year, experience_level, employment_type, employee_residence, remote_ratio)
SELECT work_year, experience_level, employment_type, employee_residence, remote_ratio
FROM file;

INSERT INTO Location ( company_location, employee_residence)
SELECT DISTINCT company_location, employee_residence
FROM file;

INSERT INTO Job (job_title, salary, salary_currency, salary_in_usd)
SELECT DISTINCT  job_title, salary, salary_currency, salary_in_usd
FROM file;

INSERT INTO Company (company_location, company_size )
SELECT DISTINCT company_location, company_size
FROM file;
-- where values are null
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
UPDATE employee e
JOIN job j ON e.job_title_id = j.job_title_id
SET e.job_title_id = j.job_title_id;

describe location;

UPDATE employee e
JOIN location l ON e.employee_residence = l.company_residence
SET e.location_id = l.location_id;
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ALTER TABLE location CHANGE COLUMN company_residence employee_residence VARCHAR(100);
