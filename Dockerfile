# ===============================
# Etapa 1: Construcción del backend
# ===============================
FROM eclipse-temurin:17-jdk-alpine AS builder

WORKDIR /app

# Copiar archivos esenciales de Maven
COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
COPY mvnw.cmd .

# 🔧 Asegurar formato y permisos correctos
RUN dos2unix mvnw && chmod +x mvnw

# Descargar dependencias (mejora cache)
RUN ./mvnw dependency:go-offline -B || true

# Copiar el código fuente
COPY src ./src

# Compilar el proyecto sin tests
RUN ./mvnw clean package -DskipTests

# ===============================
# Etapa 2: Imagen final ligera
# ===============================
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copiar el JAR generado
COPY --from=builder /app/target/*.jar app.jar

#COPY .env .env

# Exponer puerto
EXPOSE 8080

# Variables de entorno opcionales
ENV SPRING_PROFILES_ACTIVE=prod

# Comando de ejecución
ENTRYPOINT ["java", "-jar", "app.jar"]
