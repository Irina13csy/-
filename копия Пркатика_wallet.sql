CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "surname" varchar,
  "patronymic" varchar,
  "email" varchar,
  "phone" varchar,
  "password" varchar,
  "account_id" varchar,
  "created_at" timestamp
);

CREATE TABLE "accounts" (
  "id" integer PRIMARY KEY,
  "account_type" varchar,
  "payment_card" varchar,
  "user_id" integer NOT NULL,
  "total_balance" integer,
  "created_at" timestamp
);

CREATE TABLE "incomes" (
  "id" integer PRIMARY KEY,
  "account_id" integer,
  "payment_card_id" varchar,
  "receipts_type" varchar,
  "receipts_id" integer,
  "name_" varchar,
  "date_time" varchar,
  "user_id" integer NOT NULL,
  "income_period" varchar,
  "sum" integer,
  "created_at" timestamp
);

CREATE TABLE "expenses" (
  "id" integer PRIMARY KEY,
  "account_id" integer,
  "payment_card_id" varchar,
  "receipt_type" varchar,
  "receipt_id" integer,
  "name" varchar,
  "date_time" varchar,
  "user_id" integer NOT NULL,
  "sum" integer,
  "expenses_period" varchar,
  "created_at" timestamp
);

CREATE TABLE "balance" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "income_id" integer,
  "expenses_id" integer,
  "sum" integer,
  "created_at" timestamp
);

CREATE TABLE "incomes_and_expenses" (
  "id" integer,
  "period" datetime,
  "incomes_id" integer,
  "expenses_id" integer,
  "sum" integer,
  "user_id" integer,
  "account_id" integer,
  "created_at" timestamp
);

ALTER TABLE "accounts" ADD CONSTRAINT "users_accounts" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "incomes" ADD CONSTRAINT "accounts_incomes" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "expenses" ADD CONSTRAINT "accounts_expenses" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "expenses" ADD CONSTRAINT "users_expenses" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "incomes" ADD CONSTRAINT "users_incomes" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "balance" ADD CONSTRAINT "users_balance" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "balance" ADD CONSTRAINT "incomes_balance" FOREIGN KEY ("income_id") REFERENCES "incomes" ("id");

ALTER TABLE "balance" ADD CONSTRAINT "expenses_balance" FOREIGN KEY ("expenses_id") REFERENCES "expenses" ("id");

ALTER TABLE "incomes_and_expenses" ADD CONSTRAINT "users_incomes_and_expenses" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "incomes_and_expenses" ADD CONSTRAINT "accounts_incomes_and_expenses" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");
