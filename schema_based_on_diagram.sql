CREATE TABLE patients  (
    id SERIAL NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE treatments  (
    id SERIAL NOT NULL,
    type VARCHAR(20),
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id SERIAL NOT NULL,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(20),
    PRIMARY KEY (id)
);

ALTER TABLE medical_histories ADD FOREIGN KEY (patient_id) REFERENCES patients(id);

CREATE TABLE invoices  (
    id SERIAL NOT NULL,
    total_amount DECIMAL(6,3),
    generate_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT, 
    PRIMARY KEY (id)
);

ALTER TABLE invoices ADD FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id); 

CREATE TABLE invoice_items (
    id SERIAL NOT NULL,
    unit_price DECIMAL(6,2),
    quantity INT,
    total_price DECIMAL(6,2),
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY (id)
);

ALTER TABLE medical_histories ADD FOREIGN KEY (invoice_id) REFERENCES invoices(id);
ALTER TABLE medical_histories ADD FOREIGN KEY (treatment_id) REFERENCES treatments(id);

CREATE TABLE medical_histories_treatments (
    id SERIAL NOT NULL,
    medical_history_id INT,
    treatment_id INT,
    PRIMARY KEY (id)
);

ALTER TABLE medical_histories_treatments ADD FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);
ALTER TABLE medical_histories_treatments ADD FOREIGN KEY (treatment_id) REFERENCES treatments(id);
