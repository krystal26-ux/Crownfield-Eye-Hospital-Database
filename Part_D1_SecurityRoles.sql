
-- PART D1: DATABASE SECURITY CONTROLS
-- Crownfield Eye Hospital

USE crownfield_eye_hospital;

-- Create four database roles



USE crownfield_eye_hospital;

-- Administrator: Full database privileges
GRANT ALL PRIVILEGES
ON crownfield_eye_hospital.*
TO 'hospital_admin';

-- Doctor: Read clinical information
GRANT SELECT
ON crownfield_eye_hospital.patients
TO 'hospital_doctor';

GRANT SELECT
ON crownfield_eye_hospital.appointments
TO 'hospital_doctor';

GRANT SELECT, INSERT, UPDATE
ON crownfield_eye_hospital.diagnoses
TO 'hospital_doctor';

GRANT SELECT, INSERT, UPDATE
ON crownfield_eye_hospital.prescriptions
TO 'hospital_doctor';

-- Patient: Read approved general information
GRANT SELECT
ON crownfield_eye_hospital.clinics
TO 'hospital_patient';

GRANT SELECT
ON crownfield_eye_hospital.specialties
TO 'hospital_patient';

-- Receptionist: Manage registration and bookings
GRANT SELECT, INSERT, UPDATE
ON crownfield_eye_hospital.patients
TO 'hospital_receptionist';

GRANT SELECT, INSERT, UPDATE
ON crownfield_eye_hospital.appointments
TO 'hospital_receptionist';

GRANT SELECT
ON crownfield_eye_hospital.clinicians
TO 'hospital_receptionist';

GRANT SELECT
ON crownfield_eye_hospital.clinics
TO 'hospital_receptionist';


CREATE ROLE IF NOT EXISTS
    'hospital_admin',
    'hospital_doctor',
    'hospital_patient',
    'hospital_receptionist';

-- Verify that the roles exist

SELECT
    User AS role_name,
    Host
FROM mysql.user
WHERE User IN (
    'hospital_admin',
    'hospital_doctor',
    'hospital_patient',
    'hospital_receptionist'
)
ORDER BY User;



-- PART D1: VERIFY DATABASE ROLE PRIVILEGES

SHOW GRANTS FOR 'hospital_admin'@'%';

SHOW GRANTS FOR 'hospital_doctor'@'%';

SHOW GRANTS FOR 'hospital_patient'@'%';

SHOW GRANTS FOR 'hospital_receptionist'@'%';

