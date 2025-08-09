# README — Spring Boot Secure Lab (Swagger UI)

## Requisitos

* **JDK 17** (Temurin/Adoptium recomendado)
* **Maven 3.9+**
* Puerto **8080** libre

## Ejecutar en local

### 1) Clonar e instalar dependencias

```bash
git clone <tu-repo>.git springboot-secure-lab
cd springboot-secure-lab
mvn clean package -DskipTests
```

### 2A) Opción rápida: ejecutar con Maven

```bash
mvn spring-boot:run
```

### 2B) Opción jar ejecutable

> El nombre exacto del jar lo verás en `target/` tras el build.

```bash
java -jar target/<tu-jar-generado>.jar
```

### 3) Verificar la API y la documentación

* **Endpoint de ejemplo:**
  `GET http://localhost:8080/hello`
* **Swagger UI:**
  `http://localhost:8080/swagger-ui/index.html`
* **OpenAPI JSON:**
  `http://localhost:8080/v3/api-docs`

## Ejecutar pruebas

```bash
mvn test
```

## Estructura mínima sugerida

```
src/
 ├─ main/
 │   ├─ java/com/example/demo/
 │   │   ├─ DemoApplication.java
 │   │   └─ controller/HelloController.java
 │   └─ resources/application.properties
 └─ test/
     └─ java/com/example/demo/HelloControllerTest.java
pom.xml
```
