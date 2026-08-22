SELECT DISTINCT
    p.name AS patient_name,
    d1.drug_name AS drug_1,
    d2.drug_name AS drug_2,
    di.severity
FROM prescriptions rx1
JOIN prescriptions rx2 
    ON rx1.patient_id = rx2.patient_id 
    AND rx1.drug_id < rx2.drug_id
JOIN drug_interactions di
    ON (rx1.drug_id = di.drug_id_1 AND rx2.drug_id = di.drug_id_2)
    OR (rx1.drug_id = di.drug_id_2 AND rx2.drug_id = di.drug_id_1)
JOIN patients p ON rx1.patient_id = p.patient_id
JOIN drugs d1 ON rx1.drug_id = d1.drug_id
JOIN drugs d2 ON rx2.drug_id = d2.drug_id;