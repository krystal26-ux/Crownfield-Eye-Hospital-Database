USE crownfield_eye_hospital;

SELECT
    table_name,
    table_rows
FROM information_schema.tables
WHERE table_schema = 'crownfield_eye_hospital'
  AND table_type = 'BASE TABLE';
  SELECT 'patients' AS table_name, COUNT(*) AS total_records FROM patients
UNION ALL
SELECT 'clinicians', COUNT(*) FROM clinicians
UNION ALL
SELECT 'clinics', COUNT(*) FROM clinics
UNION ALL
SELECT 'specialties', COUNT(*) FROM specialties
UNION ALL
SELECT 'appointments', COUNT(*) FROM appointments
UNION ALL
SELECT 'diagnoses', COUNT(*) FROM diagnoses
UNION ALL
SELECT 'medicines', COUNT(*) FROM medicines
UNION ALL
SELECT 'prescriptions', COUNT(*) FROM prescriptions
UNION ALL
SELECT 'prescription_items', COUNT(*) FROM prescription_items
UNION ALL
SELECT 'follow_up_plans', COUNT(*) FROM follow_up_plans;
  