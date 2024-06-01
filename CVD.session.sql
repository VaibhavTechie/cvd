CREATE TABLE Patients (
    PATIENT_ID VARCHAR(10) PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SSN VARCHAR(11),
    BIRTH_DATE DATE,
    SEX CHAR(1),
    ADDRESS VARCHAR(100),
    DEPT_ID VARCHAR(10)
);
CREATE TABLE Medical_History (
    MEDICAL_HISTORY_ID VARCHAR(10) PRIMARY KEY,
    PATIENT_ID VARCHAR(10),
    DIAGNOSIS_DATE DATE,
    DIAGNOSIS_CODE VARCHAR(10),
    MEDICAL_CONDITION VARCHAR(100),
    DEPT_ID VARCHAR(10),
    FOREIGN KEY (PATIENT_ID) REFERENCES Patients(PATIENT_ID)
);
CREATE TABLE Medical_Procedures (
    PROCEDURE_ID VARCHAR(10) PRIMARY KEY,
    PROCEDURE_NAME VARCHAR(50),
    PROCEDURE_DATE DATE,
    PATIENT_ID VARCHAR(10),
    DEPT_ID VARCHAR(10),
    FOREIGN KEY (PATIENT_ID) REFERENCES Patients(PATIENT_ID)
);
CREATE TABLE Medical_Departments (
    DEPT_ID VARCHAR(10) PRIMARY KEY,
    DEPT_NAME VARCHAR(50),
    MANAGER_ID VARCHAR(10),
    LOCATION_ID VARCHAR(10)
);
CREATE TABLE Medical_Locations (
    DEPT_ID VARCHAR(10) PRIMARY KEY,
    DEPT_NAME VARCHAR(50),
    MANAGER_ID VARCHAR(10)
);

LOAD DATA INFILE 'PATIENTS.csv'
INTO TABLE Patients
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(PATIENT_ID, FIRST_NAME, LAST_NAME, SSN, BIRTH_DATE, SEX, ADDRESS, DEPT_ID);

LOAD DATA INFILE 'MEDICAL_HISTORY.csv'
INTO TABLE Medical_History
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(MEDICAL_HISTORY_ID, PATIENT_ID, DIAGNOSIS_DATE, DIAGNOSIS_CODE, MEDICAL_CONDITION, DEPT_ID);

LOAD DATA INFILE 'medical_procedures.csv'
INTO TABLE Medical_Procedures
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(PROCEDURE_ID, PROCEDURE_NAME, PROCEDURE_DATE, PATIENT_ID, DEPT_ID);

LOAD DATA INFILE 'medical_departments.csv'
INTO TABLE Medical_Departments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DEPT_ID, DEPT_NAME, MANAGER_ID, LOCATION_ID);

LOAD DATA INFILE 'medical_locations.csv'
INTO TABLE Medical_Locations
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DEPT_ID, DEPT_NAME, MANAGER_ID);