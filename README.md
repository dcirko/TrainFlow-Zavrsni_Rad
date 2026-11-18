# TrainFlow

TrainFlow is a full-stack web application for building workout plans, logging completed workouts, and tracking progress. It was developed as the undergraduate thesis for a Computer Science degree.

## Features

- Register, sign in, and manage your profile.
- Create and edit training plans with training days and exercises.
- Save training plans and log completed workouts.
- Use role-based access for users and administrators.

## Architecture

The Angular and TypeScript single-page application talks to a Java 21 Spring Boot REST API. The backend separates controllers, services, and repositories. It uses Spring Data JPA and Hibernate with MySQL, Spring Security with JWT access tokens, and BCrypt for password hashing.

## Getting started

Install Docker with Docker Compose and Node.js with npm. Compose starts the backend and MySQL. Run the Angular frontend separately.

1. Change to the backend directory.

   ```bash
   cd TrainFlowSpringBackend/TrainFlowSpringBackend
   ```

2. Create a local `.env` alongside `docker-compose.yml`. Use the local MySQL password configured in Compose and a generated Base64 JWT signing secret. Keep the file out of Git.

   ```dotenv
   SPRING_DATASOURCE_URL=jdbc:mysql://mysql:3306/trainflow
   SPRING_DATASOURCE_USERNAME=root
   SPRING_DATASOURCE_PASSWORD=YOUR_LOCAL_MYSQL_PASSWORD
   JWT_BASE64_SECRET=YOUR_BASE64_SIGNING_SECRET
   ```

3. Start the backend and database.

   ```bash
   docker compose up --build
   ```

4. In a second terminal, start Angular from the repository root.

   ```bash
   cd TrainFlowAngularFrontend
   npm ci
   npm start
   ```

The frontend runs at http://localhost:4200 and the backend at http://localhost:8080. Compose maps MySQL to port 3306. The repository includes a [database export](TrainFlowDatabase.sql).

## API overview

Use `POST /api/auth/login` to sign in:

```json
{
  "email": "user@example.com",
  "password": "example-password"
}
```

Use `POST /api/auth/register` to create an account:

```json
{
  "name": "John",
  "surname": "Doe",
  "email": "john@example.com",
  "password": "example-password",
  "age": 25,
  "height": 180,
  "weight": 75,
  "gender": "MALE"
}
```

Include `Authorization: Bearer <JWT_TOKEN>` for protected endpoints.

The main database entities cover users and roles, training plans, training days, exercises, workout logs, and saved plans. Further backend settings include `spring.jpa.hibernate.ddl-auto`, `jwt.base64-secret`, and `jwt.token-validity-seconds`.

## Future improvements

- Centralized logging and monitoring
- More unit and integration tests
- CI/CD
- Pagination and query optimization
- UI and usability improvements

## Author

Domagoj Čirko
