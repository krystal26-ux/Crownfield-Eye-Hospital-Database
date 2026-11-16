
USE crownfield_eye_hospital;

DROP PROCEDURE IF EXISTS GetClinicianAppointments;

DELIMITER $$

CREATE PROCEDURE GetClinicianAppointments(
    IN p_clinician_id INT
)
BEGIN
    SELECT
        a.appointment_id,
        p.full_name AS patient_name,
        c.full_name AS clinician_name,
        a.appointment_date,
        a.appointment_status
    FROM appointments a
    INNER JOIN patients p
        ON a.patient_id = p.patient_id
    INNER JOIN clinicians c
        ON a.clinician_id = c.clinician_id
    WHERE a.clinician_id = p_clinician_id
    ORDER BY a.appointment_date;
END $$

DELIMITER ;

CALL GetClinicianAppointments(1);
