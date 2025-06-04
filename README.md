# KYC Experiments Project

This project is a monolithic simulation of a Know Your Customer (KYC) system built entirely using **PostgreSQL and PL/pgSQL**. It’s designed for learning purposes and demonstrates how financial systems can handle KYC-related processes through SQL alone, without external services or programming languages.

---

## Objectives

- Understand how KYC works in financial systems
- Practice SQL design with functions, procedures, triggers, and views
- Explore data validation, risk assessment, OCR simulation, and compliance logic
- Keep all business logic within a PostgreSQL monolith

---

## Modules

| Module # | Name                                  | Description                                                                 |
|----------|---------------------------------------|-----------------------------------------------------------------------------|
| 1        | **Document Validator**                | Validates identity documents (CPF, RG) using pure SQL                      |
| 2        | **KYC Registration Simulator**        | Simulates client onboarding with personal data and questions               |
| 3        | **Risk Analyzer**                     | Assigns a risk score based on customer profile and behavior                |
| 4        | **Sanctions List Checker**            | Simulates checking names against international sanctions lists             |
| 5        | **OCR Data Extractor**                | Mocks OCR extraction of data from image documents                          |
| 6        | **Compliance Dashboard**              | Central view of each customer's KYC status (approved, pending, rejected)  |

---

## Project Structure

Each module follows the same internal layout:
```sh
modules/
└── module_name/
├── sql/
│ ├── tables/
│ ├── functions/
│ ├── procedures/
│ ├── views/ -- if applicable
│ └── scripts/
│ └── init_module.sql
└── tests/
└── *.sql -- Manual test scripts
```

---

## Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/adoniasvitorio/kyc-fin-trust-pg-experiments.git
cd kyc-fin-trust-pg-experiments
```

### 2. Setup a PostgreSQL database
```sh
createdb <kyc_database>
psql -d <kyc_database>
```

### 3. Run module scripts

```sh
\i scripts/init_all.sql
```

## Dica: criar usuário e permissões
Se quiser um setup mais seguro e profissional, crie um usuário dedicado:
```sh
CREATE USER kyc_user WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE kyc_monolith TO kyc_user;
```

## Fixture

```sh
\i fixture/generate_kyc_fake_dataset.sql
```