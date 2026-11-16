USE crownfield_eye_hospital;

CREATE TABLE IF NOT EXISTS part_b_update_delete_demo (
    test_id INT PRIMARY KEY,
    test_note VARCHAR(100) NOT NULL
);
INSERT INTO part_b_update_delete_demo
(test_id, test_note)
VALUES
(1, 'Original test record');

UPDATE part_b_update_delete_demo
SET test_note = 'Updated test record'
WHERE test_id = 1;
SELECT *
FROM part_b_update_delete_demo
WHERE test_id = 1;
DELETE FROM part_b_update_delete_demo
WHERE test_id = 1;

SELECT *
FROM part_b_update_delete_demo
WHERE test_id = 1;