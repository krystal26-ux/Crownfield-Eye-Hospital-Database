
USE crownfield_eye_hospital;

SELECT
    a.appointment_id,
    p.full_name AS patient_name,
    a.appointment_date,
    a.appointment_status,
    pr.prescription_id
FROM appointments a
INNER JOIN patients p
    ON a.patient_id = p.patient_id
LEFT JOIN prescriptions pr
    ON a.appointment_id = pr.appointment_id
WHERE pr.prescription_id IS NULL
ORDER BY a.appointment_id;
