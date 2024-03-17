use ds_jobschema;
ALTER TABLE Job
ADD INDEX idx_cid (cid);

CREATE TABLE Job (
    job_title_id INT AUTO_INCREMENT PRIMARY KEY,
    work_year INT,
    experience_level VARCHAR(100),
    employment_type VARCHAR(100),
    job_title VARCHAR(100),
    salary INT,
    salary_currency VARCHAR(10),
    salary_in_usd INT,
    cid VARCHAR(100));
    
    CREATE TABLE Company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_residence VARCHAR(100),
    remote_ratio INT,
    company_location VARCHAR(100),
    company_size varchar(100),
    cid VARCHAR(100),
    foreign key (cid) references job(cid)
);

INSERT INTO job (work_year, experience_level, employment_type, job_title, salary, salary_currency, salary_in_usd, cid)
SELECT DISTINCT work_year, experience_level, employment_type, job_title, salary, salary_currency, salary_in_usd, cid
FROM clean_job_dets;
    
INSERT INTO Company (employee_residence, remote_ratio, company_location, company_size,  cid)
SELECT distinct employee_residence, remote_ratio, company_location, company_size,  cid
FROM clean_company_ids;

SELECT *
FROM job;

SELECT *
FROM company;

