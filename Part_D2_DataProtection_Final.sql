
-- Part D2: Data Protection Techniques
-- Crownfield Eye Hospital
-- Demonstration of AES encryption and decryption

USE crownfield_eye_hospital;

-- Create a separate table for encrypted medical data
CREATE TABLE IF NOT EXISTS encrypted_diagnoses_demo (
    diagnosis_id INT PRIMARY KEY,
    encrypted_diagnosis VARBINARY(255)
);

-- Encrypt a fictional diagnosis
-- Uses a demonstration key, not a production key
INSERT INTO encrypted_diagnoses_demo
    (diagnosis_id, encrypted_diagnosis)
VALUES
    (1, AES_ENCRYPT('Glaucoma', 'CrownfieldKey123'))
ON DUPLICATE KEY UPDATE
encrypted_diagnosis = AES_ENCRYPT('Glaucoma', 'CrownfieldKey123');

-- Display encrypted information
SELECT
    diagnosis_id,
    HEX(encrypted_diagnosis) AS encrypted_value
FROM encrypted_diagnoses_demo;

-- Decrypt using the same demonstration key
SELECT
    diagnosis_id,
    CAST(
        AES_DECRYPT(
            encrypted_diagnosis,
            'CrownfieldKey123'
        ) AS CHAR
    ) AS decrypted_diagnosis
FROM encrypted_diagnoses_demo;
