CREATE TABLE "patients" (
  "id" INT,
  "name" VARCHAR(100),
  "date_of_birth" DATE,
  PRIMARY KEY ("id")
);

CREATE TABLE "medical_histories" (
  "id" INT,
  "admitted_at" TIMESTAMP,
  "patient_id" INT,
  "status" VARCHAR(100),
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_medical_histories.patient_id"
    FOREIGN KEY ("patient_id")
      REFERENCES "patients"("id")
);

CREATE TABLE "invoices" (
  "id" INT,
  "total_amount" DECIMAL,
  "generated_at" TIMESTAMP,
  "payed_at" TIMESTAMP,
  "medical_history__id" INT,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_invoices.medical_history__id"
    FOREIGN KEY ("medical_history__id")
      REFERENCES "medical_histories"("id")    
);

CREATE TABLE "treatments" (
  "id" INT,
  "type" VARCHAR(100),
  "name" VARCHAR(100),
  PRIMARY KEY ("id")
);

CREATE TABLE "invoice_items" (
  "id" INT,
  "unit_price" DECIMAL,
  "quantity" INT,
  "total_price" DECIMAL,
  "invoice_id" INT,
  "treatment_id" INT,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_invoice_items.treatment_id"
    FOREIGN KEY ("treatment_id")
      REFERENCES "treatments"("id"),
  CONSTRAINT "FK_invoice_items.invoice_id"
    FOREIGN KEY ("invoice_id")
      REFERENCES "invoices"("id")
);
