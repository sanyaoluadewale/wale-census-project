SELECT*
FROM census

SELECT*
FROM train


---OUTPUT THE RATE OF DIVORCED AS COMPARED TO THE TOTAL POPULATION IN THE DATASET

SELECT  DISTINCT marital_status
FROM census

SELECT  DISTINCT race
FROM census

SELECT COUNT(*) AS Total_dataset
FROM census

SELECT COUNT(*) AS Divorced
FROM census
WHERE marital_status = 'divorced'
--The result shows a total of 6,633 are divorced from their spouse

---OUTPUT FEMALE BLACKS THAT ARE UNMARRIED
SELECT*
FROM census
WHERE race = 'black' AND sex = 'female' AND relationship ='unmarried'

---OUTPUT age, marital_status, occupation, race and sex for divorced black individuals
SELECT age, marital_status, occupation,race,sex
FROM census 
WHERE marital_status='divorced' AND race='black'

---OUTPUT THE TOTAL NUMBER OF WHITE AND BLACK IN THE DATASET
SELECT COUNT(race) AS Total_race
FROM census

SELECT COUNT(*) AS Total_whites
FROM census
WHERE race = 'white'

SELECT COUNT(*) AS Total_black
FROM census
WHERE race = 'black'

SELECT 
    SUM(CASE WHEN race = 'white' THEN 1 ELSE 0 END) AS Total_whites,
    SUM(CASE WHEN race = 'black' THEN 1 ELSE 0 END) AS Total_black
FROM census
---
SELECT 
    COUNT(CASE WHEN race = 'white' THEN 1 END) AS Total_whites,
    COUNT(CASE WHEN race = 'black' THEN 1 END) AS Total_black
FROM census

--OUTPUT TOTAL NUMBER OF DIVORCE BLACK AND WHITE INDIVIDUALS 
SELECT COUNT(race) AS White_divorced
FROM census 
WHERE marital_status='divorced' AND race = 'white'

SELECT COUNT(race) AS Black_divorced
FROM census 
WHERE marital_status='divorced' AND race='black'

---WHAT PERCENTAGE OF THE WHITE ABD BLACK ARE DIVORCED---
WITH WALE AS
(SELECT 
COUNT(CASE WHEN race = 'white' THEN 1 END )AS Total_white,
COUNT(CASE WHEN race = 'black' THEN 1 END)AS Total_black,
COUNT(CASE WHEN Race = 'white' and marital_status = 'divorced' THEN 1 END )AS Divorced_white,
COUNT(CASE WHEN Race = 'black' and marital_status = 'divorced' THEN 1 END )AS Divorced_black
FROM census)
SELECT * , Divorced_white *100/Total_white AS Percentage_white_divorced, Divorced_black*100/Total_black AS Percentage_black_divorced
FROM WALE

--WITHOUT CTE
SELECT 
    COUNT(CASE WHEN race = 'white' THEN 1 END) AS Total_white,
	COUNT(CASE WHEN race = 'white' AND marital_status = 'divorced' THEN 1 END) AS Total_White_divorced,
    (COUNT(CASE WHEN race = 'white' AND marital_status = 'divorced' THEN 1 END) * 100.0 / COUNT(CASE WHEN race = 'white' THEN 1 END)) AS Percentage_white_divorced,
	COUNT(CASE WHEN race = 'black' THEN 1 END) AS Total_black,
	COUNT(CASE WHEN race = 'black' AND marital_status = 'divorced' THEN 1 END) AS Total_Black_divorced,
	(COUNT(CASE WHEN race = 'black' AND marital_status = 'divorced' THEN 1 END) * 100.0 / COUNT(CASE WHEN race = 'black' THEN 1 END)) AS Percentage_black_divorced
FROM census;

---USING SUBQUERY
SELECT *, Divorced_white *100/Total_white AS Percentage_white_divorced, Divorced_black*100/Total_black AS Percentage_black_divorced
FROM (
SELECT 
COUNT(CASE WHEN race = 'white' THEN 1 END )AS Total_white,
COUNT(CASE WHEN race = 'black' THEN 1 END)AS Total_black,
COUNT(CASE WHEN Race = 'white' and marital_status = 'divorced' THEN 1 END )AS Divorced_white,
COUNT(CASE WHEN Race = 'black' and marital_status = 'divorced' THEN 1 END )AS Divorced_black
FROM census) AS TABLE_1

--The result shows a total of 5,684 which is about 14% of the total white population in the dataset, While 15% of the black population are divorced

---OUTPUT INDIVIDUALS WITH INCOME >50K
SELECT age, education, race, sex, income
FROM census 
WHERE income = '>50k'

---OUTPUT RATE OF DIVORCED AMOUNG INDIVIDUALS WITH UNIVERSITY EDUCATION COMPARE TO THOSE WITHOUT UNIVERSITY EDUCATION

---Result with university degress
SELECT age, education, marital_status, relationship, race
FROM census
WHERE marital_status = 'divorced' AND education IN('masters','doctorate', 'Bachelors')

SELECT COUNT(*) AS Total_number_with_university_degree_divorced
FROM census
WHERE marital_status = 'divorced' AND education IN('masters','doctorate', 'Bachelors')

SELECT COUNT(*) AS Total_number_with_university_degree_individuals
FROM census
WHERE education IN('masters','doctorate', 'Bachelors')

---Result without university degrees
SELECT age, education, marital_status, relationship, race
FROM census
WHERE marital_status = 'divorced' AND education  NOT LIKE '%masters%''%doctorate%''%Bachelors%'

SELECT COUNT(*) AS Total_number_without_university_degree_divorced
FROM census
WHERE marital_status = 'divorced' AND education  NOT LIKE '%masters%''%doctorate%''%Bachelors%'

SELECT COUNT(*) AS Total_number_without_university_degree
FROM census
WHERE education  NOT LIKE '%masters%''%doctorate%''%Bachelors%'

---The result shows that the level of education doesn't have inpact on marital life and could be regarded as an individual attribute 


