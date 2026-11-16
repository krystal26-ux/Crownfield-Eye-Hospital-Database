
USE crownfield_eye_hospital;

CREATE TABLE IF NOT EXISTS encrypted_diagnoses_demo (
    diagnosis_id INT PRIMARY KEY,
    encrypted_diagnosis VARBINARY(255)
);

INSERT INTO encrypted_diagnoses_demo
    (diagnosis_id, encrypted_diagnosis)
VALUES
    (1, AES_ENCRYPT(
        'Glaucoma',
        'CrownfieldDemoKey2026!'
    ));

SELECT
    diagnosis_id,
    HEX(encrypted_diagnosis) AS encrypted_value
FROM encrypted_diagnoses_demo;

SELECT
    diagnosis_id,
    CAST(
        AES_DECRYPT(
            encrypted_diagnosis,
            'CrownfieldDemoKey2026!'
        ) AS CHAR
    ) AS decrypted_diagnosis
FROM encrypted_diagnoses_demo;

UPDATE encrypted_diagnoses_demo
SET encrypted_diagnosis = AES_ENCRYPT(
    'Glaucoma',
    'CrownfieldKey123'
)
WHERE diagnosis_id = 1;

SELECT
    diagnosis_id,
    CAST(
        AES_DECRYPT(
            encrypted_diagnosis,
            'CrownfieldKey123'
        ) AS CHAR
    ) AS decrypted_diagnosis
FROM encrypted_diagnoses_demo;

