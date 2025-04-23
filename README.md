# 🐳 DockerLaravel

A simple and reusable Docker environment for Laravel projects. This setup includes PHP-FPM, MySQL and Supervisor — ready for queue workers, scheduled tasks, and more.

---

## 📦 What’s Included

- PHP 8.4 (FPM, Alpine)
- MySQL
- Supervisor (for running queue workers and scheduled tasks)
- Composer (via multi-stage build)
- Optional support for GD, ZIP, etc.

---

## 🚀 Quick Start

### 1. Clone into a Laravel project:

```bash
git clone https://github.com/RezaParsian/DockerLaravel temp-docker
cd temp-docker
./setup.sh
cd ..
rm -rf temp-docker
```

### 2. Build and run containers:

```bash
docker-compose up -d --build
```

### 3. Install Laravel dependencies:

```bash
docker exec -it app composer install
```

### 4. Setup Laravel

```bash
docker exec -it app php artisan key:generate
docker exec -it app php artisan migrate
```

---

## 📁 Folder Structure

```
/
├── docker-compose.yaml        # Docker services
├── .docker/                   # Service configs
│   ├── php/                   # PHP + Supervisor setup
│   ├── nginx/                 # (optional) Nginx config
│   └── ...
```

---

## 🔄 Running Queue Worker

Supervisor runs Laravel scheduler via:

- `php artisan schedule:run`

To configure a custom worker or command, edit:

```ini
.docker/php/supervisord.conf
```

Then run:

```bash
docker exec -it web supervisorctl reread
docker exec -it web supervisorctl update
docker exec -it web supervisorctl restart all
```

---

## 📌 Notes

- PHP image is Alpine-based and lightweight.
- You can uncomment `gd`, `zip`, `soap` in Dockerfile if needed.
- MySQL Docker volumes for persistent data.

---

## 🧑‍💻 Author

Made with ❤️ by [Reza Parsian](https://github.com/RezaParsian)

