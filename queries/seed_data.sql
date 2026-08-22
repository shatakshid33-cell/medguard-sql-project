-- Prescribers
INSERT INTO prescribers (name, specialty) VALUES
('Dr. Anjali Rao', 'Cardiology'),
('Dr. Vikram Sen', 'General Practice'),
('Dr. Priya Nair', 'Orthopedics');

-- Drugs
INSERT INTO drugs (drug_name, drug_class) VALUES
('Warfarin', 'Anticoagulant'),
('Aspirin', 'Antiplatelet'),
('Metformin', 'Antidiabetic'),
('Ibuprofen', 'NSAID'),
('Amoxicillin', 'Antibiotic');

-- Patients
INSERT INTO patients (name, dob, allergies) VALUES
('Ravi Kumar', '1958-03-12', 'Penicillin'),
('Sunita Sharma', '1975-11-02', NULL),
('Arjun Mehta', '1990-07-19', 'None'),
('Meera Iyer', '1982-01-25', 'Sulfa drugs'),
('Kabir Singh', '1966-09-08', NULL);

-- Drug interactions (the risky pairs)
INSERT INTO drug_interactions (drug_id_1, drug_id_2, severity) VALUES
(1, 2, 'Severe'),   -- Warfarin + Aspirin: bleeding risk
(2, 4, 'Moderate');  -- Aspirin + Ibuprofen: reduced effectiveness/GI risk

-- Prescriptions (events)
INSERT INTO prescriptions (patient_id, prescriber_id, drug_id, date_prescribed) VALUES
(1, 1, 1, '2026-01-10'),  -- Ravi: Warfarin
(1, 1, 2, '2026-01-10'),  -- Ravi: Aspirin (same day -> interacting pair!)
(2, 2, 3, '2026-02-05'),  -- Sunita: Metformin
(3, 3, 4, '2026-02-14'),  -- Arjun: Ibuprofen
(3, 2, 2, '2026-02-20'),  -- Arjun: Aspirin (now on both Aspirin + Ibuprofen)
(4, 2, 5, '2026-03-01'),  -- Meera: Amoxicillin
(5, 1, 1, '2026-03-05'),  -- Kabir: Warfarin
(5, 3, 4, '2026-03-10');  -- Kabir: Ibuprofen (no direct interaction defined, but same patient on multiple drugs)

-- Dispense log (pharmacy fulfilling prescriptions)
INSERT INTO dispense_log (prescription_id, date_dispensed, quantity) VALUES
(1, '2026-01-11', 30),
(2, '2026-01-11', 30),
(3, '2026-02-06', 60),
(4, '2026-02-15', 20),
(5, '2026-02-21', 20),
(6, '2026-03-02', 14),
(7, '2026-03-06', 30),
(8, '2026-03-11', 20);
