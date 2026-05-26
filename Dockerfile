FROM eclipse-temurin:21

WORKDIR /app

COPY pom.xml .
COPY .mvn .mvn
COPY mvnw .
RUN chmod +x mvnw

RUN ./mvnw dependency:go-offline

COPY src src

EXPOSE 8080

CMD ["./mvnw", "spring-boot:run"]