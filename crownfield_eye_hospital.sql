
USE crownfield_eye_hospital;

CREATE TABLE patients (
    patient_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

USE crownfield_eye_hospital;

SHOW TABLES;
USE crownfield_eye_hospital;
DESCRIBE patients;

USE crownfield_eye_hospital;

CREATE TABLE specialties (
    specialty_id INT AUTO_INCREMENT PRIMARY KEY,
    specialty_name VARCHAR(100) NOT NULL UNIQUE
);
USE crownfield_eye_hospital;

SHOW TABLES;

USE crownfield_eye_hospital;

CREATE TABLE clinicians (
    clinician_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialty_id INT NOT NULL,
    CONSTRAINT fk_clinician_specialty
        FOREIGN KEY (specialty_id)
        REFERENCES specialties(specialty_id)
);

DESCRIBE clinicians;

USE crownfield_eye_hospital;

CREATE TABLE clinicians (
    clinician_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialty_id INT NOT NULL,
    FOREIGN KEY (specialty_id)
    REFERENCES specialties(specialty_id)
);

USE crownfield_eye_hospital;

USE crownfield_eye_hospital;

CREATE TABLE IF NOT EXISTS clinics (
    clinic_id INT AUTO_INCREMENT PRIMARY KEY,
    clinic_name VARCHAR(100) NOT NULL UNIQUE
);


DESCRIBE clinicians;

DESCRIBE clinics;

USE crownfield_eye_hospital;

CREATE TABLE IF NOT EXISTS appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(10) NOT NULL,
    clinician_id INT NOT NULL,
    clinic_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    appointment_status VARCHAR(20) NOT NULL
        DEFAULT 'Scheduled',

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (clinician_id)
        REFERENCES clinicians(clinician_id),

    FOREIGN KEY (clinic_id)
        REFERENCES clinics(clinic_id),

    CONSTRAINT chk_appointment_status
        CHECK (appointment_status IN
        ('Scheduled', 'Completed', 'Cancelled'))
);

DESCRIBE appointments;

USE crownfield_eye_hospital;

CREATE TABLE IF NOT EXISTS diagnoses (
    diagnosis_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    diagnosis_name VARCHAR(150) NOT NULL,

    FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
);

DESCRIBE diagnoses;

USE crownfield_eye_hospital;

CREATE TABLE IF NOT EXISTS medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL UNIQUE
);

DESCRIBE medicines;

USE crownfield_eye_hospital;

CREATE TABLE IF NOT EXISTS prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    prescribed_date DATE NOT NULL,

    FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
);

DESCRIBE prescriptions;

USE crownfield_eye_hospital;

CREATE TABLE IF NOT EXISTS prescription_items (
    prescription_item_id INT AUTO_INCREMENT PRIMARY KEY,
    prescription_id INT NOT NULL,
    medicine_id INT NOT NULL,
    dose VARCHAR(50) NOT NULL,
    route VARCHAR(50) NOT NULL,
    frequency VARCHAR(100) NOT NULL,
    duration_days INT NOT NULL,

    FOREIGN KEY (prescription_id)
        REFERENCES prescriptions(prescription_id),

    FOREIGN KEY (medicine_id)
        REFERENCES medicines(medicine_id),

    CONSTRAINT chk_duration
        CHECK (duration_days > 0)
);

DESCRIBE prescription_items;

USE crownfield_eye_hospital;

CREATE TABLE IF NOT EXISTS follow_up_plans (
    follow_up_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE,
    due_date DATE NOT NULL,
    priority VARCHAR(20) NOT NULL
        DEFAULT 'Routine',
    follow_up_status VARCHAR(20) NOT NULL
        DEFAULT 'Pending',
    notes VARCHAR(255),

    FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id),

    CONSTRAINT chk_followup_priority
        CHECK (priority IN
        ('Routine', 'High', 'Urgent')),

    CONSTRAINT chk_followup_status
        CHECK (follow_up_status IN
        ('Pending', 'Completed', 'Cancelled'))
);

DESCRIBE follow_up_plans;

USE crownfield_eye_hospital;

INSERT INTO patients (patient_id, full_name, postcode)
VALUES
('OP001', 'Amina Yusuf', 'NE1 4AB'),
('OP002', 'Daniel Reed', 'N16 7QP'),
('OP003', 'Sofia Bennett', 'E8 2LD'),
('OP004', 'Michael Okoro', 'SE6 3RT'),
('OP005', 'Emma Wilson', 'B15 2TT'),
('OP006', 'James Carter', 'M14 5RL'),
('OP007', 'Olivia Brown', 'LS1 4AP'),
('OP008', 'Noah Williams', 'B21 8PQ'),
('OP009', 'Isabella Clarke', 'SW1 3AB'),
('OP010', 'Ethan Taylor', 'L1 7DF'),
('OP011', 'Grace Thompson', 'NG2 4LP'),
('OP012', 'Lucas Martin', 'CV1 5QR'),
('OP013', 'Mia Robinson', 'BS1 6HY'),
('OP014', 'Henry Walker', 'S1 2AA');

SELECT patient_id, full_name, postcode
FROM patients
ORDER BY patient_id;

USE crownfield_eye_hospital;

INSERT INTO specialties (specialty_name)
VALUES
('Glaucoma'),
('Retina'),
('Cornea'),
('Cataract'),
('Paediatric Ophthalmology'),
('Neuro-Ophthalmology'),
('Oculoplastics'),
('Medical Retina'),
('Vitreoretinal Surgery'),
('Uveitis'),
('Low Vision'),
('Ocular Oncology'),
('Refractive Surgery');

SELECT specialty_id, specialty_name
FROM specialties
ORDER BY specialty_id;

USE crownfield_eye_hospital;

INSERT INTO clinicians (full_name, specialty_id)
VALUES
('Dr Maya Shah', 1),
('Dr Leo Grant', 2),
('Dr Priya Nair', 3),
('Dr Sarah Collins', 4),
('Dr James Wilson', 5),
('Dr Emily Carter', 6),
('Dr Daniel Brown', 7),
('Dr Olivia Taylor', 8),
('Dr Michael Evans', 9),
('Dr Sophia Martin', 10),
('Dr Henry Walker', 11),
('Dr Grace Thompson', 12),
('Dr Lucas Bennett', 13);

SELECT
    c.clinician_id,
    c.full_name,
    s.specialty_name
FROM clinicians c
INNER JOIN specialties s
    ON c.specialty_id = s.specialty_id
ORDER BY c.clinician_id;

USE crownfield_eye_hospital;

INSERT INTO clinics (clinic_name)
VALUES
('City Road'),
('Bedford'),
('Croydon'),
('North Wing'),
('South Wing'),
('East London'),
('West London'),
('Central Eye Clinic'),
('Riverside Clinic'),
('Greenfield Clinic'),
('Oakwood Clinic'),
('Hillside Clinic'),
('Parkside Clinic');

SELECT clinic_id, clinic_name
FROM clinics
ORDER BY clinic_id;

USE crownfield_eye_hospital;

INSERT INTO appointments
(patient_id, clinician_id, clinic_id,
 appointment_date, appointment_time, appointment_status)
VALUES
('OP001', 1, 1, '2026-10-05', '09:00:00', 'Completed'),
('OP002', 2, 1, '2026-10-05', '09:30:00', 'Completed'),
('OP001', 1, 2, '2026-11-16', '10:15:00', 'Scheduled'),
('OP003', 1, 1, '2026-10-06', '11:00:00', 'Completed'),
('OP004', 3, 3, '2026-10-07', '14:00:00', 'Completed'),
('OP005', 4, 4, '2026-11-20', '09:00:00', 'Scheduled'),
('OP006', 5, 5, '2026-11-21', '10:30:00', 'Scheduled'),
('OP007', 6, 6, '2026-11-22', '11:15:00', 'Scheduled'),
('OP008', 7, 7, '2026-11-23', '13:00:00', 'Scheduled'),
('OP009', 8, 8, '2026-11-24', '14:30:00', 'Scheduled'),
('OP010', 9, 9, '2026-11-25', '09:45:00', 'Scheduled'),
('OP011', 10, 10, '2026-11-26', '10:00:00', 'Scheduled'),
('OP012', 11, 11, '2026-11-27', '11:30:00', 'Scheduled'),
('OP013', 12, 12, '2026-11-28', '12:15:00', 'Scheduled'),
('OP014', 13, 13, '2026-11-29', '15:00:00', 'Scheduled');

SELECT
    a.appointment_id,
    p.full_name AS patient,
    c.full_name AS clinician,
    cl.clinic_name,
    a.appointment_date,
    a.appointment_status
FROM appointments a
INNER JOIN patients p
    ON a.patient_id = p.patient_id
INNER JOIN clinicians c
    ON a.clinician_id = c.clinician_id
INNER JOIN clinics cl
    ON a.clinic_id = cl.clinic_id
ORDER BY a.appointment_id;

USE crownfield_eye_hospital;

INSERT INTO diagnoses (appointment_id, diagnosis_name)
VALUES
(1, 'Ocular hypertension'),
(2, 'Diabetic macular oedema'),
(3, 'Ocular hypertension'),
(4, 'Glaucoma suspect'),
(5, 'Keratoconus'),
(6, 'Age-related cataract'),
(7, 'Childhood strabismus'),
(8, 'Optic neuritis'),
(9, 'Ptosis'),
(10, 'Retinal vein occlusion'),
(11, 'Retinal detachment'),
(12, 'Anterior uveitis'),
(13, 'Low vision'),
(14, 'Choroidal melanoma'),
(15, 'Myopia');

SELECT
    d.diagnosis_id,
    p.full_name AS patient,
    d.diagnosis_name,
    a.appointment_date
FROM diagnoses d
INNER JOIN appointments a
    ON d.appointment_id = a.appointment_id
INNER JOIN patients p
    ON a.patient_id = p.patient_id
ORDER BY d.diagnosis_id;

USE crownfield_eye_hospital;

INSERT INTO medicines (medicine_name)
VALUES
('Latanoprost'),
('Timolol'),
('Aflibercept'),
('Sodium chloride drops'),
('Brimonidine'),
('Dorzolamide'),
('Travoprost'),
('Bimatoprost'),
('Prednisolone acetate'),
('Cyclopentolate'),
('Tropicamide'),
('Artificial tears'),
('Acetazolamide'),
('Olopatadine');

SELECT medicine_id, medicine_name
FROM medicines
ORDER BY medicine_id;

USE crownfield_eye_hospital;

INSERT INTO prescriptions
(appointment_id, prescribed_date)
VALUES
(1, '2026-10-05'),
(2, '2026-10-05'),
(3, '2026-11-16'),
(5, '2026-10-07'),
(6, '2026-11-20'),
(7, '2026-11-21'),
(8, '2026-11-22'),
(9, '2026-11-23'),
(10, '2026-11-24'),
(11, '2026-11-25'),
(12, '2026-11-26'),
(13, '2026-11-27'),
(14, '2026-11-28'),
(15, '2026-11-29');

SELECT
    pr.prescription_id,
    p.full_name AS patient,
    pr.prescribed_date
FROM prescriptions pr
INNER JOIN appointments a
    ON pr.appointment_id = a.appointment_id
INNER JOIN patients p
    ON a.patient_id = p.patient_id
ORDER BY pr.prescription_id;

SELECT
    pr.prescription_id,
    p.full_name AS patient,
    pr.prescribed_date
FROM prescriptions pr
INNER JOIN appointments a
    ON pr.appointment_id = a.appointment_id
INNER JOIN patients p
    ON a.patient_id = p.patient_id
ORDER BY pr.prescription_id;

USE crownfield_eye_hospital;

INSERT INTO prescription_items
(prescription_id, medicine_id, dose, route, frequency, duration_days)
VALUES
(1, 1, '1 drop', 'Ophthalmic', 'Once daily', 42),
(1, 2, '1 drop', 'Ophthalmic', 'Twice daily', 42),
(2, 3, '2 mg', 'Intravitreal', 'As directed', 28),
(3, 1, '1 drop', 'Ophthalmic', 'Once daily', 84),
(4, 4, '1 drop', 'Ophthalmic', 'Twice daily', 56),
(5, 5, '1 drop', 'Ophthalmic', 'Twice daily', 30),
(6, 6, '1 drop', 'Ophthalmic', 'Twice daily', 30),
(7, 7, '1 drop', 'Ophthalmic', 'Once daily', 30),
(8, 8, '1 drop', 'Ophthalmic', 'Once daily', 30),
(9, 9, '1 drop', 'Ophthalmic', 'Four times daily', 14),
(10, 10, '1 drop', 'Ophthalmic', 'Twice daily', 7),
(11, 11, '1 drop', 'Ophthalmic', 'As directed', 1),
(12, 12, '1 drop', 'Ophthalmic', 'As needed', 30),
(13, 13, '250 mg', 'Oral', 'Twice daily', 7),
(14, 14, '1 drop', 'Ophthalmic', 'Twice daily', 14);

SELECT
    pi.prescription_item_id,
    m.medicine_name,
    pi.dose,
    pi.route,
    pi.frequency,
    pi.duration_days
FROM prescription_items pi
INNER JOIN medicines m
    ON pi.medicine_id = m.medicine_id
ORDER BY pi.prescription_item_id;

USE crownfield_eye_hospital;

SELECT COUNT(*) AS total_follow_up_plans
FROM follow_up_plans;

USE crownfield_eye_hospital;

INSERT INTO follow_up_plans
(appointment_id, due_date, priority, follow_up_status, notes)
VALUES
(1, '2026-11-16', 'High', 'Pending',
 'Review intraocular pressure'),
(2, '2026-11-20', 'Urgent', 'Pending',
 'Retinal assessment'),
(3, '2026-12-14', 'Routine', 'Pending',
 'Glaucoma monitoring'),
(4, '2026-12-01', 'High', 'Pending',
 'Repeat visual field test'),
(5, '2026-12-05', 'Routine', 'Pending',
 'Corneal review'),
(6, '2026-12-20', 'Routine', 'Pending',
 'Cataract assessment'),
(7, '2026-12-21', 'High', 'Pending',
 'Paediatric review'),
(8, '2026-12-22', 'Urgent', 'Pending',
 'Neuro-ophthalmology review'),
(9, '2026-12-23', 'Routine', 'Pending',
 'Oculoplastics follow-up'),
(10, '2026-12-24', 'High', 'Pending',
 'Retinal imaging'),
(11, '2026-12-25', 'Urgent', 'Pending',
 'Retinal surgery review'),
(12, '2026-12-26', 'High', 'Pending',
 'Inflammation monitoring'),
(13, '2026-12-27', 'Routine', 'Pending',
 'Low vision assessment'),
(14, '2026-12-28', 'Urgent', 'Pending',
 'Oncology review'),
(15, '2026-12-29', 'Routine', 'Pending',
 'Refractive assessment');

SELECT COUNT(*) AS total_follow_up_plans
FROM follow_up_plans;

USE crownfield_eye_hospital;

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'crownfield_eye_hospital'
AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, COLUMN_NAME;

USE crownfield_eye_hospital;

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'crownfield_eye_hospital'
ORDER BY TABLE_NAME, CONSTRAINT_TYPE;






















