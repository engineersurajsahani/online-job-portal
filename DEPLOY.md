# Deploying the Online Job Portal on Render

The project now runs on **SQLite** (no MySQL server needed) and ships as a
Docker image that Render builds and hosts directly from this repository.

## What changed (summary)

| Before | After |
|---|---|
| MySQL `localhost:3306` hardcoded in 30+ files | `util.DB.get()` — SQLite via `SQLITE_DB_PATH` env var |
| `&&` / `\|\|` SQL operators (MySQL-only) | `AND` / `OR` (standard SQL) |
| MySQL dump `database/backup.sql` | Seed files `src/main/resources/seed/` auto-loaded on first run |
| Windows report paths `report\\x.jasper` | `report/x.jasper` (works on Linux) |
| Secrets hardcoded | Same defaults kept, overridable via `ADMIN_USERNAME`, `ADMIN_PASSWORD`, `MAIL_USERNAME`, `MAIL_PASSWORD` env vars |
| No build tool | Maven WAR build + Dockerfile + render.yaml |

All original data from `backup.sql` (28 jobs, 5 categories, 3 users,
1 recruiter, 8 applications, 4 contacts, 1 feedback) is loaded automatically
the first time the app starts.

## Render deployment steps

1. Push this repository to GitHub/GitLab.
2. On [render.com](https://render.com) → **New → Blueprint**, select the repo.
   Render reads `render.yaml` automatically.
3. In the service settings:
   - Runtime: **Docker** (detected from the Dockerfile)
   - Instance type: **Starter** (paid) — needed for the persistent disk, or see free option below.
4. Fill in the env vars marked `sync: false`:
   - `ADMIN_USERNAME` / `ADMIN_PASSWORD` — admin panel login (defaults: `Omkar` / `82081`)
   - `MAIL_USERNAME` / `MAIL_PASSWORD` — Gmail credentials used by interview mails (defaults kept as-is)
5. Deploy. First boot creates `/data/online_job_portal.db`, loads schema +
   backup data, then Tomcat serves the app on port 8080.

## Important notes

- **Free plan option:** Render free web services don't support disks and the
  filesystem is ephemeral — the SQLite DB resets on every deploy/restart.
  Works for demos; data (new signups, jobs, applications) is lost on restart.
  If that's acceptable, delete the `disk:` block from `render.yaml` and set
  plan to `free` — the app will still work, reseeding each restart.
- **JSP recompilation:** Tomcat 11 recompiles all 49 JSPs on first request;
  the first page load takes a few extra seconds. This is normal.
- **Reports (PDF):** the 12 JasperReports `.jasper` files were compiled with
  JasperReports 5.6.0 and run against the SQLite connection — query syntax in
  them is plain SQL and works unchanged.
- **Emails:** Render blocks outbound port 25; SMTP over 587/465 is allowed.
  If Gmail rejects the login, generate a fresh app password and set
  `MAIL_PASSWORD` accordingly (existing value kept as default).
- **Backups:** the SQLite file lives on the Render disk at
  `/data/online_job_portal.db`. Use Render's disk snapshots, or download the
  file periodically for backups.

## Local Docker test

```bash
docker build -t online-job-portal .
docker run --rm -p 8080:8080 -v jobportal-data:/data online-job-portal
# then open http://localhost:8080/index.jsp
```
