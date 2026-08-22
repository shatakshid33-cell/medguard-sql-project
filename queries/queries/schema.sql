CREATE TABLE patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    dob TEXT,
    allergies TEXT
);
CREATE TABLE prescribers (
    prescriber_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT
);

CREATE TABLE drugs (
    drug_id INTEGER PRIMARY KEY,
    drug_name TEXT NOT NULL,
    drug_class TEXT
);
CREATE TABLE drug_interactions (
    interaction_id INTEGER PRIMARY KEY,
    drug_id_1 INTEGER NOT NULL,
    drug_id_2 INTEGER NOT NULL,
    severity TEXT,
    FOREIGN KEY (drug_id_1) REFERENCES drugs(drug_id),
    FOREIGN KEY (drug_id_2) REFERENCES drugs(drug_id)
);
CREATE TABLE prescriptions (
    prescription_id INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    prescriber_id INTEGER NOT NULL,
    drug_id INTEGER NOT NULL,
    date_prescribed TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (prescriber_id) REFERENCES prescribers(prescriber_id),
    FOREIGN KEY (drug_id) REFERENCES drugs(drug_id)
);
CREATE TABLE dispense_log (
    dispense_id INTEGER PRIMARY KEY,
    prescription_id INTEGER NOT NULL,
    date_dispensed TEXT,
    quantity INTEGER,
    FOREIGN KEY (prescription_id) REFERENCES prescriptions(prescription_id)
);