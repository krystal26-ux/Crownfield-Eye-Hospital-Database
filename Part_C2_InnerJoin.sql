
USE crownfield_eye_hospital;

SELECT
    a.appointment_id,
    p.full_name AS patient_name,
    c.full_name AS clinician_name,
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
