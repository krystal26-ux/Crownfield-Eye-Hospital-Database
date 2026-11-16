
USE crownfield_eye_hospital;

SELECT
    c.clinician_id,
    c.full_name AS clinician_name,
    COUNT(a.appointment_id) AS total_appointments
FROM clinicians c
INNER JOIN appointments a
    ON c.clinician_id = a.clinician_id
GROUP BY c.clinician_id, c.full_name
HAVING COUNT(a.appointment_id) > 1
ORDER BY total_appointments DESC;
