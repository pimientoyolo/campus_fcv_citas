# Comandos Docker — Proyecto FCV Citas

Guía rápida de comandos de Docker para iniciar, monitorear y gestionar todos los servicios de la aplicación.

---

## 1. Iniciar los Contenedores

### Levantar la aplicación completa (crea e inicia contenedores):
```bash
docker compose up -d
```

> **Nota para incremento S2:** Si estás trabajando con el esquema y overlay S2:
> ```bash
> docker compose -f docker-compose.yml -f docker-compose.s2.yml up -d
> ```

### Si los contenedores ya existen y solo están detenidos:
```bash
docker compose start
```

---

## 2. Accesos Rápidos

Una vez levantados los contenedores, accede a través de:

- **Frontend (Web):** [http://localhost:5173](http://localhost:5173)
- **Backend (API):** [http://localhost:8080](http://localhost:8080)
- **Salud del Backend:** [http://localhost:8080/actuator/health](http://localhost:8080/actuator/health)
- **Base de Datos (MySQL):** `localhost:3307` (puerto interno: `3306`)

---

## 3. Revisar y Monitorear los Servicios

### Ver el estado de los contenedores:
```bash
docker compose ps
```
*Comprueba que los contenedores `fcv-citas-mysql`, `fcv-citas-api-dev` y `fcv-citas-web-dev` figuren como `Up` o `healthy`.*

### Ver los logs en tiempo real (todos los servicios):
```bash
docker compose logs -f
```

### Ver los logs de un servicio específico:
```bash
# Backend (Spring Boot)
docker compose logs -f citas-api-dev

# Frontend (React / Vite)
docker compose logs -f citas-web-dev

# Base de Datos (MySQL)
docker compose logs -f mysql
```

---

## 4. Reiniciar y Detener Servicios

### Reiniciar un servicio individual (útil si hay cambios o errores):
```bash
# Reiniciar backend
docker compose restart citas-api-dev

# Reiniciar frontend
docker compose restart citas-web-dev
```

### Detener los servicios sin borrarlos:
```bash
docker compose stop
```

### Bajar y remover los contenedores:
```bash
docker compose down
```

---

## 5. Acceder a la Terminal de los Contenedores (Opcional)

Si necesitas ejecutar comandos dentro de los contenedores:

```bash
# Entrar al backend
docker compose exec -it citas-api-dev bash

# Entrar al frontend
docker compose exec -it citas-web-dev sh

# Entrar a MySQL por terminal
docker compose exec -it mysql mysql -uroot -p
```
