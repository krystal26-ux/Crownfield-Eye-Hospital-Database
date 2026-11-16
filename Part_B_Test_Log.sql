USE crownfield_eye_hospital;

SELECT COUNT(*) AS orphan_appointments
FROM appointments a
LEFT JOIN patients p
    ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

SELECT COUNT(*) AS orphan_diagnoses
FROM diagnoses d
LEFT JOIN appointments a
    ON d.appointment_id = a.appointment_id
WHERE a.appointment_id IS NULL;