SELECT 
    drugs.drug_name,
    COUNT(prescriptions.prescription_id) AS times_prescribed
FROM prescriptions
JOIN drugs ON prescriptions.drug_id = drugs.drug_id
GROUP BY drugs.drug_name
ORDER BY times_prescribed DESC;
