🐟 fish2home-postgresql-database
================================
[![Readme Card](https://github-readme-stats.vercel.app/api/pin/?username=francescopiocirillo&repo=fish2home-postgresql-database)](https://github.com/francescopiocirillo/fish2home-postgresql-database)

**Relational Database in PostgreSQL for Seafood Delivery Management**  
A complete academic-to-production-grade project covering conceptual design, normalization, constraints, triggers, advanced queries, and data population for a real-world delivery scenario.

> Demonstrated expertise in PostgreSQL database design and implementation, including requirements analysis, E-R modeling, BCNF normalization, constraint and trigger-based business rule enforcement, advanced SQL queries, and performance-oriented schema optimization.

* * *

📌 Overview
-----------

**Fish2Home** is a seafood delivery service that connects **fishermen**, **riders**, and **customers** through a fully managed ordering and delivery process.  
This repository contains the **PostgreSQL implementation** of the Fish2Home database, developed as part of the _Database Systems_ course at University of Salerno (2023/2024).

The system manages:

* **Order processing & tracking**
    
* **Fishing methods & vessels**
    
* **Rider zoning & logistics**
    
* **Customer data & payment management**
    
* **Inventory bundles & pricing**
    

This project showcases **end-to-end database engineering skills**:  
from **requirements analysis** → **conceptual/logical design** → **normalization** → **optimized SQL schema** → **advanced query development** → **business-rule triggers**.

* * *

🌍 Language Note
----------------

All **code comments and internal documentation** are written in **Italian**, as the project was developed during a group exam at the **University of Salerno (Italy)**.

Despite this, the **codebase follows international best practices** which makes it easily understandable for global developers and recruiters.

* * *

🚀 Features
-----------

* **📄 Full SQL Schema** — Complete `CREATE TABLE` statements with PK, FK, CHECK, UNIQUE, and DOMAIN constraints.
    
* **🛡 Data Integrity Rules** — Implemented through declarative constraints and procedural triggers.
    
* **⚙ Automated Logic** — Business rule enforcement using PL/pgSQL triggers:
    
    * Ensure fishermen have at least one fishing method.
        
    * Auto-update bundle quantities in orders.
        
    * Enforce rider zone coverage.
        
    * Validate customer payment ownership.
        
* **📊 Analytical Queries** — Complex SELECT statements for:
    
    * Rider workload analysis.
        
    * Customer ordering patterns.
        
    * Quality tracking based on fish temperature at pickup.
        
    * Revenue and consumption rankings.
        
* **👁 Views** — Predefined for cost and weight aggregation per order and city.
    
* **🧪 Sample Data Population** — Ready-to-use dataset for immediate testing.
    
* **📈 Normalization up to BCNF** — Ensures minimal redundancy while optimizing read/write performance.
    

* * *

🗂 Project Structure
--------------------

```plaintext
📦 fish2home-postgresql-database/
│
├── 📁 diagrams/                         # Visual database design artifacts
│   ├── 00_entity_relationship_diagram.pdf
│   ├── 01_restructured_entity_relationship_diagram.pdf
│   └── 02_logic_design.pdf
│
├── 📁 docs/                             # Full technical documentation
│   ├── full_report_ENGLISH.pdf
│   └── full_report_ITALIAN.pdf
│
├── 📁 scripts/                          # SQL scripts for full database lifecycle
│   ├── 00_drop.sql                   # Drop all database objects
│   ├── 01_schema.sql                 # Database schema creation (tables, constraints, domains)
│   ├── 02_functions_and_triggers.sql # PL/pgSQL functions and business-rule triggers
│   ├── 03_seed.sql                   # Sample dataset population
│   ├── 04_views.sql                  # Predefined views for common aggregations
│   └── 05_queries.sql                # Analytical and operational queries
│
├── LICENSE
└── README.md
```

* * *

🛠 Technologies & Skills Demonstrated
-------------------------------------

**Database Technologies**

* PostgreSQL 15+
    
* PL/pgSQL
    
* SQL constraints, domains, triggers, and views
    

**Data Engineering Skills**

* Requirements analysis & specification
    
* Conceptual design (E-R modeling with business rules)
    
* Logical design & optimization
    
* Performance-driven redundancy evaluation
    
* Multi-table joins, aggregation, and nested queries
    
* Data integrity enforcement at the database level
    

**Concepts Implemented**

* **Domain modeling:** Fishermen, boats, customers, riders, fishing zones, bundles, orders, payment methods
    
* **Cardinality constraints & referential integrity**
    
* **Trigger-based automation** for derived attributes
    
* **Advanced query patterns:** Nested queries, set operations, aggregation with `HAVING`, and subqueries with binding
    
* **BCNF normalization** ensuring optimal schema quality
    

* * *

📊 Example Analytics
--------------------

### 1. Top Customers by Spend

```sql
SELECT cliente, SUM(costo_ordine) AS totale_spesa
FROM CostoOrdinazioni
JOIN Ordinazione ON costoOrdinazioni.ordinazione = codiceordine
GROUP BY cliente
ORDER BY totale_spesa DESC;
```

### 2. Riders Under Pressure

Find riders who are the only worker in their zone and deliver above the average.

```sql
SELECT nome, zona, citta
FROM Rider r1
WHERE NOT EXISTS (
    SELECT 1
    FROM Rider r2
    WHERE r1.CodiceRider <> r2.CodiceRider
      AND r1.Zona = r2.Zona
      AND r1.Citta = r2.Citta
)
AND (
    SELECT COUNT(*) FROM Ordinazione WHERE Rider = r1.CodiceRider
) > (
    SELECT AVG(ordinazioni_consegnate)
    FROM (
        SELECT rider, COUNT(*) AS ordinazioni_consegnate
        FROM Ordinazione
        WHERE Rider IS NOT NULL
        GROUP BY Rider
    ) sub
);
```

* * *

📚 Academic Context
-------------------

This project was developed as part of the **Database Systems** course (University of Salerno).  
It follows a **full database lifecycle**:

1. **Requirement Analysis** — Glossary, operational needs, business rules
    
2. **Conceptual Design** — E-R schema with patterns (evolution, historization)
    
3. **Logical Design** — Optimized schema with redundancy analysis
    
4. **Normalization** — Up to Boyce-Codd Normal Form (BCNF)
    
5. **Implementation** — PostgreSQL schema with constraints, triggers, and sample data
    
6. **Testing & Analytics** — Predefined queries and views
    
* * *

💡 Potential Applications
-------------------------

* **Food delivery platforms**
    
* **Local fisheries management**
    
* **Inventory tracking & logistics**
    
* **Last-mile delivery optimization**

* * *

🏆 Authors
----------

* [@francescopiocirillo](https://github.com/francescopiocirillo) – Schema design, triggers, queries
    
* [@alefaso-lucky](https://github.com/alefaso-lucky) – Schema design, data population, business rule enforcement

* * *

📬 Contacts
-----------

✉️ Got feedback or want to contribute? Feel free to open an Issue or submit a Pull Request!

* * *

📈 SEO Tags
-----------

```
PostgreSQL database, SQL schema design, Relational database project, Database management system (DBMS), PL/pgSQL triggers, Data integrity enforcement, Advanced SQL queries, Database normalization (BCNF), Entity Relationship Diagram (ERD), Logical database design, Seafood delivery database, Order management system, Payment processing database, Delivery logistics optimization, Food delivery data model, Inventory tracking database, Fisheries management system, Rider zone allocation, Business rules in SQL, Database project for portfolio, SQL development, Database engineering, Data modeling, Query optimization, Data analysis with SQL, Backend database design, Constraint-based data validation, Academic database project, SQL views and analytics, PL/pgSQL development
```

* * *

📄 License
----------

This project is licensed under the **MIT License**, a permissive open-source license that allows anyone to use, modify, and distribute the software freely, as long as credit is given and the original license is included.

> In plain terms: **use it, build on it, just don’t blame us if something breaks**.

> ⭐ Like what you see? Consider giving the project a star!

    
