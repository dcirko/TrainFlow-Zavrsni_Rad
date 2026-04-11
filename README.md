# TrainFlow

TrainFlow je full-stack web aplikacija za upravljanje trening planovima i praćenje napretka korisnika. Sustav omogućuje autentifikaciju korisnika, kreiranje i upravljanje trening planovima te bilježenje izvedenih treninga kroz modularnu arhitekturu.

---

## Overview

Aplikacija je dizajnirana kao odvojeni frontend i backend sustav:

* Backend: REST API baziran na Spring Bootu
* Frontend: SPA aplikacija razvijena u Angularu
* Baza: relacijska baza podataka (MySQL)
* Deployment: Docker (containerized environment)

---

## Architecture

* Stateless backend (JWT autentifikacija)
* RESTful API dizajn
* Layered arhitektura:

  * Controller layer
  * Service layer
  * Repository layer
* Relacijski model baze s JPA/Hibernate ORM-om

---

## Technology Stack

### Backend

* Java 21
* Spring Boot
* Spring Security (JWT)
* Spring Data JPA (Hibernate)
* MySQL
* Maven

### Frontend

* Angular
* TypeScript

### Infrastructure

* Docker
* Docker Compose

---

## Core Features

* User registration i autentifikacija (JWT)
* Upravljanje korisničkim profilom
* Kreiranje i uređivanje trening planova
* Spremanje planova za korisnika
* Praćenje workout logova
* Role-based pristup (USER / ADMIN)

---

## Authentication & Security

Sustav koristi JWT (JSON Web Token) za autentifikaciju:

* Access token za autorizaciju zahtjeva
* Stateless session management
* Zaštićeni endpointi kroz Spring Security filter chain
* BCrypt hashiranje lozinki

---

## Getting Started

### Prerequisites

* Docker
* Docker Compose

---

### Environment Variables

Kreirati `.env` datoteku u root direktoriju projekta:

```env
MYSQL_DATABASE=trainflow
MYSQL_USER=root
MYSQL_PASSWORD=root
MYSQL_ROOT_PASSWORD=root

JWT_BASE64_SECRET=your_base64_secret_key
```

---

### Running the Application

```bash
docker compose up --build
```

---

### Default Services

* Backend API: http://localhost:8080
* Frontend: http://localhost:4200
* MySQL: port 3306

---

## API Overview

### Authentication

**POST /api/auth/login**

Request:

```json
{
  "email": "user@example.com",
  "password": "password"
}
```

---

**POST /api/auth/register**

Request:

```json
{
  "name": "John",
  "surname": "Doe",
  "email": "john@example.com",
  "password": "password",
  "age": 25,
  "height": 180,
  "weight": 75,
  "gender": "MALE"
}
```

---

### Authorization

Za zaštićene endpointove potrebno je poslati:

```
Authorization: Bearer <JWT_TOKEN>
```

---

## Database

Baza podataka sastoji se od sljedećih glavnih entiteta:

* users
* roles
* user_role
* training_plans
* training_days
* training_day_exercises
* exercises
* workout_logs
* user_saved_plans

Relacije su definirane putem JPA anotacija.

---

## Configuration

Ključne konfiguracije u Spring Boot aplikaciji:

```properties
spring.datasource.url
spring.datasource.username
spring.datasource.password

spring.jpa.hibernate.ddl-auto=update

jwt.base64-secret
jwt.token-validity-seconds
```

---

## Development Notes

* `.env` datoteka nije verzionirana (sigurnosni razlozi)
* `target/` direktorij ignoriran putem `.gitignore`
* Docker se koristi za konzistentno okruženje između developmenta i deploya
* Backend je stateless i skalabilan

---

## Future Improvements

* Centralized logging i monitoring
* Test coverage (unit/integration testovi)
* CI/CD pipeline
* Pagination i optimizacija query-ja
* UI/UX poboljšanja

---

## Author

Domagoj

---

## License

Ovaj projekt je razvijen u edukacijske svrhe (završni rad).
