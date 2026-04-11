# 1. Build stage
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# kopiraj pom.xml i download dependencies (cache)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# kopiraj source
COPY src ./src

# build JAR
RUN mvn clean package -DskipTests

# 2. Run stage
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# kopiraj JAR iz build stagea
COPY --from=build /app/target/*.jar app.jar

# port na kojem app radi
EXPOSE 8080

# pokretanje aplikacije
ENTRYPOINT ["java", "-jar", "app.jar"]