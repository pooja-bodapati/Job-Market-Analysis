-------- 1 -------------------------------------------- 
#  Get data from the database with the given credentials.

SELECT * FROM project_job_market_analysis.Market;

----- 2 -----------------------------------
# States with Most Number of Jobs.
SELECT 
    Job_Location, COUNT(*) AS job_count
FROM
    project_job_market_analysis.Market
GROUP BY Job_Location
ORDER BY job_count DESC;

----- 3 ------------------------------------
# Average Minimal and Maximal Salaries in Different States.
SELECT 
    AVG(Lower_Salary), AVG(Upper_Salary), Job_Location AS States
FROM
    project_job_market_analysis.Market
GROUP BY Job_Location
ORDER BY AVG(Lower_Salary) DESC;

----- 4 -----------------------------------------------
# Average Salary in Different States.

select Job_Location, avg(Avg_SalaryK) as average_sal from project_job_market_analysis.Market
group by Job_Location
order by average_sal desc;

------ 5 ----------------------------------------------------
# Top 5 Industries with Maximum Number of Data Science Related Job Postings.
select Industry, count(*) as NoOfPostings
from project_job_market_analysis.Market
where Python is not null or spark is not null or aws is not null
	or sql_ is not null or keras is not null or pytorch is not null 
group by Industry
order by NoOfPostings desc
limit 5;

----- 6 ---------------------------------------------------------
# Companies with Maximum Number of Job Openings.

SELECT Company_Name, COUNT(*) AS job_count FROM project_job_market_analysis.Market
GROUP BY Company_Name ORDER BY job_count DESC;
    

----- 7 -------------------------------------------------------
# Job Titles with Most Number of Jobs.
SELECT 
    job_title, COUNT(*) AS job_count
FROM
    project_job_market_analysis.Market
GROUP BY job_title
ORDER BY job_count DESC;

----- 8 ----------------------------------------------------------
# Salary of Job Titles with Most Number of Jobs.
SELECT job_title,COUNT(*) AS job_count, avg(Salary_Estimate) as average_salary 
FROM  project_job_market_analysis.Market GROUP BY job_title ORDER BY job_count DESC;

----- 9 --------------------------------------------------------------
# Skills Required by Companies for Each Job Title.
 SELECT
	Job_Title,
	MAX(CASE WHEN Python = 'Yes' THEN 'Python' END) AS Python,
	MAX(CASE WHEN spark = 'Yes' THEN 'Spark' END) AS Spark,
	MAX(CASE WHEN aws = 'Yes' THEN 'AWS' END) AS AWS,
	MAX(CASE WHEN excel = 'Yes' THEN 'Excel' END) AS Excel,
	MAX(CASE WHEN sql_ = 'Yes' THEN 'SQL' END) AS sql_,
	MAX(CASE WHEN sas = 'Yes' THEN 'Keras' END) AS Keras,
	MAX(CASE WHEN keras = 'Yes' THEN 'Keras' END) AS Keras,
	MAX(CASE WHEN pytorch = 'Yes' THEN 'PyTorch' END) AS PyTorch,
	MAX(CASE WHEN scikit = 'Yes'
	THEN 'Scikit-learn' END) AS Scikit_learn,
	MAX(CASE WHEN tensor = 'Yes' THEN 'TensorFlow' END) AS TensorFlow,
	MAX(CASE WHEN hadoop = 'Yes' THEN 'Hadoop' END) AS Hadoop,
	MAX(CASE WHEN tableau = 'Yes' THEN 'Tableau' END) AS Tableau,
	MAX(CASE WHEN bi = 'Yes' THEN 'BI' END) AS BI,
	MAX(CASE WHEN flink = 'Yes' THEN 'Flink' END) AS Flink,
	MAX(CASE WHEN mongo = 'Yes' THEN 'MongoDB' END) AS MongoDB,
    MAX(CASE WHEN google_an = 'Yes' THEN 'Google Analytics' END) AS Google_Analytics
FROM project_job_market_analysis.Market
GROUP BY Job_Title;
----- 10 -----------------------------------------------------------------------------
# Relation between Average Salary and Education.

SELECT Degree, AVG(Avg_salaryK) AS average_salary
FROM project_job_market_analysis.Market GROUP BY Degree ORDER BY average_salary DESC; 

