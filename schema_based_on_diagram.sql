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

CREATE TABLE medical_history (
    id SERIAL NOT NULL,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE invoices  (
    id SERIAL NOT NULL,
    total_amount DECIMAL(6,3),
    generate_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_history(id), 
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id SERIAL NOT NULL,
    unique_price DECIMAL(6,2),
    quantity INT,
    total_price DECIMAL(6,2),
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY (id)
);
