
USE crownfield_eye_hospital;

DROP TRIGGER IF EXISTS before_appointment_insert;

DELIMITER $$

CREATE TRIGGER before_appointment_insert
BEFORE INSERT ON appointments
FOR EACH ROW
BEGIN
    IF NEW.appointment_date < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Appointment date cannot be in the past';
    END IF;
END $$

DELIMITER ;



-- Test C6: Attempt to insert an appointment
-- with a date in the past.

USE crownfield_eye_hospital;

INSERT INTO appointments
    (patient_id, clinician_id, clinic_id,
     appointment_date, appointment_status)
SELECT
    patient_id,
    1,
    1,
    '2020-01-01',
    'Scheduled'
FROM patients
LIMIT 1;

