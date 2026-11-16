
USE crownfield_eye_hospital;

SELECT
    p.patient_id,
    p.full_name AS patient_name,
    COUNT(a.appointment_id) AS total_appointments
FROM patients p
INNER JOIN appointments a
    ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.full_name
HAVING COUNT(a.appointment_id) > (
    SELECT AVG(appointment_count)
    FROM (
        SELECT COUNT(*) AS appointment_count
        FROM appointments
        GROUP BY patient_id
    ) AS patient_totals
)
ORDER BY total_appointments DESC;
