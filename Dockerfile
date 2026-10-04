# ---------- Stage 1: build the WAR with Maven ----------
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app

# Cache dependencies first (faster rebuilds)
COPY pom.xml .
RUN mvn -B -q dependency:go-offline

COPY src ./src
COPY docker/CompileReports.java /tmp/CompileReports.java

# Recompile all .jrxml report templates with the exact JasperReports engine
# that ships in WEB-INF/lib, so .jasper serialization always matches runtime.
RUN mkdir -p /reports-tool && \
    javac -cp "/app/src/main/webapp/WEB-INF/lib/*" -d /reports-tool /tmp/CompileReports.java && \
    java -cp "/reports-tool:/app/src/main/webapp/WEB-INF/lib/*" CompileReports /app/src/main/webapp/report

RUN mvn -B clean package -DskipTests

# ---------- Stage 2: run on Tomcat 11 ----------
FROM tomcat:11.0-jdk21-temurin-jammy

ENV SQLITE_DB_PATH=/data/online_job_portal.db

# Persisted database directory (Render disk mounts here)
RUN mkdir -p /data

COPY --from=build /app/target/online_job_portal.war /usr/local/tomcat/webapps/ROOT.war
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
