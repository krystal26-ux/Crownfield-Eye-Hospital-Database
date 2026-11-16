# Crownfield Eye Hospital Database

## Project Overview

This repository contains the SQL scripts and Entity\-Relationship Diagram (ERD) developed for the fictional Crownfield Eye Hospital database as part of the CPU4:103 Introduction to Database assessment.

The database is designed to manage key aspects of the hospital's operations, including patients, clinicians, clinics, appointments, diagnoses, medicines, prescriptions, and follow\-up plans.

## Technologies Used

- MySQL
- MySQL Workbench
- diagrams.net

## Setup Instructions

1. Install MySQL and MySQL Workbench on your computer.
2. Open MySQL Workbench and connect to a local MySQL server.
3. Execute the crownfield\_eye\_hospital.sql script to create and populate the database.
4. Run the Part B testing scripts to verify the implementation.
5. Execute the Part C SQL queries, stored procedure, and trigger scripts.
6. Run the Part D security and data protection scripts using an account with appropriate privileges.

For successful execution, scripts should be run in dependency order. Existing database objects should also be reviewed before rerunning any creation scripts.

## Database Assumptions

The database design is based on the following assumptions:

- Each appointment is associated with a single patient, clinician, and clinic.
- An appointment may exist without a diagnosis or prescription being recorded.
- A single prescription can contain multiple medicines.
- All patient and clinical records included in the database are fictional and created solely for educational purposes.

## Individual Contributions

My assigned responsibilities included Task A1, the first two implementation requirements in Part B, all six individual SQL tasks in Part C, and Task D1 relating to database roles and user privileges.

The database design process and all other shared project components were completed collaboratively by the group.

## ER Diagram

The repository includes both the editable .drawio file and a PNG version of the Entity\-Relationship Diagram to support the database documentation and design process.

## Data Protection

This project uses synthetic data for educational purposes only. No real patient information should be stored, uploaded, or processed within the database.

