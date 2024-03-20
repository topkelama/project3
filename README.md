# Project 3: Identifying Most Valuable Data Science Skills
## Group Members:
Will Berritt
Chhring Lama
Puja Roy
Collaboration Tools:
## Communication:
We will leverage Outlook for formal communication within the team. Important announcements, updates, and scheduled meetings will be communicated through Outlook
Code Sharing:
Our code sharing and version control will be managed through GitHub/Git. We've created a private repository where team members can collaborate, contribute, and review code changes. The use of Git allows us to track changes, collaborate seamlessly, and maintain version history.
## Project Documentation:
For detailed project documentation, we will use a combination of Google Docs and the project's README.md file on GitHub. Google Docs will house comprehensive project documentation, including meeting notes, decision logs, and detailed explanations. The README.md file on GitHub will contain essential information about the project structure, setup, and key decisions related to the codebase.
## Data Sources & Loading Data:
For data collection, we plan to utilize datasets from Kaggle that contain Data Scientist Jobs compiled from Indeed. We want to focus on the job specs and pay range based on the job description of the roles. 
We will utilize R scripts for possible web scraping, reading, and data cleaning. The use of R allows us to efficiently handle data manipulation tasks and ensures compatibility with further analysis.

## Logical Model for Normalized Database:
We have designed a logical model for our normalized database to ensure efficient data storage and retrieval. The main tables include:

### Company Table:
company_id (Primary Key)
employee_residence
Remote_ratio
Company_location
Company_size
cid (company_name)

### Job Details Table:
job_title_id (Primary Key)
Work_year
Experience_level
Employment_type
Job_title
Salary
Salary_currency
Salary_in_usd
Cid (company name)


## Entity-Relationship Diagram:
  +-------------------+             +------------------+
  |     Company       |             |   Job Details    |
  +-------------------+             +------------------+
  | company_id (PK)   |1    ->     N| job_title_id (PK)|
  | employee_residence|-------------| Work_year        |
  | Remote_ratio      |             | Experience_level |
  | Company_location  |             | Employment_type  |
  | Company_size      |             | Job_title        |
  | cid (PK)          |             | Salary           |
  +-------------------+             | Salary_currency  |
                                    | Salary_in_usd    |
                                    | Cid (FK)         |
                                    +------------------+
  Each company can have multiple job details associated with it, but each job detail belongs to only one company.
  
