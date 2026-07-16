# Multi-stage Dockerfile for Spring Boot with JSP support
# Cache bust: 2026-07-16

# Stage 1: Build with Maven
FROM maven:3.9.6-eclipse-temurin-21 AS build

WORKDIR /app

# Copy Maven wrapper and pom.xml
COPY mvnw .
RUN chmod +x mvnw
COPY .mvn .mvn
COPY pom.xml .

# Download dependencies (cached layer)
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# Stage 2: Run with JRE
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

# Copy the built JAR from build stage
COPY --from=build /app/target/Project-2-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080
EXPOSE 8080

# Set environment variables
ENV PORT=8080
ENV JAVA_OPTS=""
ENV DATABASE_URL=jdbc:postgresql://neondb_owner:npg_uZMgIGSpNs25@ep-late-math-awxt39cn-pooler.c-12.us-east-1.aws.neon.tech/neondb?sslmode=require&channel_binding=require

# Run the application
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar app.jar"]
