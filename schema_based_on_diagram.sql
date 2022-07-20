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
  "total_amount" DECIMA,
  "generated_at" TIMESTAMP,
  "payed_at" TIMEESTAMP,
  "medical_history_id" INT,
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
  CONSTRAINT "FK_invoice_items.invoice_id"
    FOREIGN KEY ("invoice_id")
      REFERENCES "invoices"("id")
);

CREATE TABLE "treatments" (
  "id" INT,
  "type" VARCHAR(100),
  "name" VARCHAR(100),
  PRIMARY KEY ("id")
);