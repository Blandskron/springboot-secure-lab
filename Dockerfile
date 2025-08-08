# ---------- Build stage ----------
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Copiamos solo pom primero para cachear dependencias
COPY pom.xml .
RUN mvn -B -q -e -DskipTests dependency:go-offline

# Ahora copiamos el código y construimos
COPY src ./src
RUN mvn -B clean package -DskipTests

# ---------- Runtime stage ----------
FROM eclipse-temurin:17-jre
WORKDIR /app

# Crea un usuario no root por seguridad
RUN useradd -ms /bin/bash appuser
USER appuser

# Copia el JAR construido
COPY --from=build /app/target/*.jar app.jar

# Render expone la variable PORT; Spring Boot usará ese puerto
# No uses EXPOSE obligatoriamente en Render, pero no hace daño:
EXPOSE 8080

# Healthcheck opcional (ajusta el endpoint si quieres /actuator/health)
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD curl -f http://localhost:8080/hello || exit 1

# Inicia la app usando el puerto que entrega Render
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar --server.port=${PORT:-8080}"]
