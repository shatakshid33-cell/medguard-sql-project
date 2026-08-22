SELECT * FROM patients;
SELECT name, allergies FROM patients;
SELECT name, dob FROM patients ORDER BY dob;
SELECT patients.name, drugs.drug_name, prescriptions.date_prescribed
FROM prescriptions
JOIN patients ON prescriptions.patient_id = patients.patient_id
JOIN drugs ON prescriptions.drug_id = drugs.drug_id;
