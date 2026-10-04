# 🎯 JobFinder — Online Job Portal

A full-stack **Java web application** that connects **job seekers (employees)**, **recruiters (companies)** and an **administrator** on one platform. Recruiters post jobs, candidates browse/apply, and admins manage the whole system with PDF reports.

> 🚀 **One-click deploy on Render:**
> [![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/engineersurajsahani/online-job-portal)

---

## 📋 Table of Contents

- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Database](#-database)
- [Getting Started (Local)](#-getting-started-local)
  - [Option 1: Docker (recommended)](#option-1-docker-recommended)
  - [Option 2: Eclipse + Tomcat](#option-2-eclipse--tomcat)
- [Deploying on Render](#-deploying-on-render)
- [Environment Variables](#-environment-variables)
- [Default Logins (Demo Data)](#-default-logins-demo-data)
- [PDF Reports](#-pdf-reports)
- [Email Notifications](#-email-notifications)
- [Screenshots](#-screenshots)
- [Troubleshooting](#-troubleshooting)
- [Security Notes](#-security-notes)
- [License](#-license)

---

## ✨ Features

### 👤 Employee (Job Seeker) — `e_*`
- Sign up / login / edit profile with photo
- Browse jobs by **category** (IT, Banking, Teaching, Sales & Marketing, Healthcare) and by **location / title search**
- View job details and **apply with resume** in one click
- Track all applied jobs with live **status** (Pending / Accept / Reject)
- Receive **interview date, time & location** by email once scheduled
- Submit **feedback** (with star rating) and **contact** messages

### 🏢 Recruiter (Company) — `r_*`
- Sign up / login / edit company profile with logo
- **Post jobs** under categories (title, description, salary, requirements, logo…)
- Edit / delete own job postings
- View **applied candidates** and **Accept / Reject** applications
- **Schedule interviews** (date, time, location) — candidate is notified by email automatically
- Browse category list and recruiter feedback

### 🛠️ Admin — `a_*`
- Hardened admin login (env-configurable credentials)
- Manage **employees**, **recruiters**, **jobs**, **categories**, **applications**, **contacts**, **feedback**
- Generate **12 PDF reports** — normal, ID-wise and date-wise (JasperReports)

---

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Language | **Java 21** |
| Web | **Jakarta Servlets 6.0 + JSP** (Tomcat **11.0**) |
| Database | **SQLite** (file-based, zero-config — via `sqlite-jdbc`) |
| Reports | **JasperReports 5.6.0** (`.jrxml` compiled at build time) |
| Email | **Jakarta Mail 2.0.1** (Gmail SMTP, port 587/465) |
| Frontend | **Bootstrap 3.3.7**, custom CSS, vanilla JS slider |
| Build | **Maven** (WAR packaging) |
| Hosting | **Docker** → **Render** (persistent disk for the DB file) |

> ℹ️ This project was originally built on **MySQL** and has been fully migrated to **SQLite** for cloud deployment. The original MySQL dump is preserved in `src/main/webapp/database/backup.sql` and is **auto-loaded as seed data** on first boot.

---

## 🏗 Architecture

```
Browser ──> Tomcat 11 (ROOT.war)
              ├── JSP pages (UI + read queries)  ──┐
              ├── Servlets (form actions) ──> Database helper ──┤
              └── JasperReports (PDF) ──────────────────────────┤
                                                                 ▼
                                              SQLite file: /data/online_job_portal.db
                                              (schema + seed data auto-created on first run)
```

- **`Database.java`** — legacy helper used by servlets (`Connectdb/Insert/update/delete/search`), now backed by SQLite.
- **`util/DB.java`** — central connection factory; reads `SQLITE_DB_PATH`, enables WAL + busy_timeout, and seeds the DB on first use.
- Every page/report shares the **same SQLite file**, so all roles see consistent data.

---

## 📁 Project Structure

```
online-job-portal/
├── pom.xml                      # Maven build (WAR)
├── Dockerfile                   # 2-stage build: Maven → Tomcat 11
├── render.yaml                  # Render Blueprint (disk + env vars)
├── docker/
│   ├── entrypoint.sh            # Container start script
│   └── CompileReports.java      # Build-time .jrxml → .jasper compiler
├── DEPLOY.md                    # Detailed Render deployment guide
├── tools/
│   ├── make_seed.py             # backup.sql → SQLite seed generator
│   └── migrate_sqlite.py        # One-shot MySQL → SQLite code migration
└── src/main/
    ├── java/                    # 40 servlets + helpers
    │   ├── Database.java        #   Legacy DB helper (SQLite-backed)
    │   ├── util/DB.java         #   SQLite connection factory + seeding
    │   ├── SendMail.java        #   Interview email (STARTTLS :587)
    │   ├── Send_Mail.java       #   Interview email (SSL :465)
    │   ├── a_*.java             #   Admin servlets
    │   ├── r_*.java             #   Recruiter servlets
    │   └── e_*.java             #   Employee servlets
    ├── resources/seed/
    │   ├── schema.sql           # 8 tables (CREATE IF NOT EXISTS)
    │   └── data.sql             # Original backup data (50 rows)
    └── webapp/                  # 50 JSPs + assets
        ├── index.jsp            #   Landing page (slider, companies)
        ├── WEB-INF/
        │   ├── web.xml          #   Jakarta EE 10 descriptor
        │   └── lib/             #   Runtime jars (Jasper, mail, groovy…)
        ├── report/              #   13 .jrxml + compiled .jasper
        ├── database/backup.sql  #   Original MySQL dump (reference)
        ├── css/  images/        #   Bootstrap theme + assets
        └── health.jsp           #   Render health check
```

---

## 🗄 Database

**8 tables** (all data stored in one SQLite file):

| Table | Purpose | Key Columns |
|---|---|---|
| `e_signup` | Employee accounts | id, fullname, username, email, gender, phone_no, password, photo |
| `r_signup` | Recruiter accounts | r_id, fullname, companyname, email, password, gender, phone_no, address, photo |
| `r_add_job` | Job postings | job_id, category, jobtitle, companyname, JobType, location, salary, job_discription, companylogo, requirement, job_upload_date, r_id |
| `e_apply_job` | Applications | a_id, job_id, job_title, company, location, applay_date, user_id, name, email, resume, **status**, interview_date/time/location, r_id |
| `add_catagory` | Job categories | id, categoryName, categoryInfo, categoryImage |
| `interview_schedule` | Scheduled interviews | interview_id, a_id, candudate_name, interview_time/date/location, status |
| `e_feedback` | Site feedback | e_id, name, email, rating, feedback, date |
| `e_contactus` | Contact messages | e_id, name, contactnumber, email, message |

**Seeding:** on first boot, if the database is empty, `util/DB.java` runs `schema.sql` + `data.sql` (generated from the original `backup.sql` by `tools/make_seed.py`). Restart-safe: seeding is skipped when tables already exist.

To regenerate the seed files after editing `backup.sql`:
```bash
python tools/make_seed.py
```

---

## 🚀 Getting Started (Local)

### Prerequisites
- **Docker Desktop** *(recommended)* — or JDK 21 + Maven 3.9 + Tomcat 11
- No database installation needed — SQLite is embedded

### Option 1: Docker (recommended)

```bash
# Build the image (compiles Java + all 13 Jasper reports)
docker build -t online-job-portal .

# Run with a persistent volume for the database
docker run --rm -p 8080:8080 -v jobportal-data:/data online-job-portal
```

Open **http://localhost:8080** — first boot creates the DB and loads all demo data.

> Windows note: if port 8080 is reserved, use `-p 8081:8080` instead.

### Option 2: Eclipse + Tomcat

1. **Import** → Existing Projects into Eclipse (this repo is an Eclipse Dynamic Web Project).
2. Add **Apache Tomcat v11.0** as the target runtime (Window → Preferences → Server).
3. Add **sqlite-jdbc** jar to the build path (it's already in `WEB-INF/lib` after a Maven build, or download `sqlite-jdbc-3.46.x.jar`).
4. Right-click project → **Run on Server**.
5. Set env var (optional) `SQLITE_DB_PATH` to a writable path, e.g. `C:/data/online_job_portal.db` — otherwise it defaults to `/data/...` which fails on Windows.

---

## ☁️ Deploying on Render

Full step-by-step guide: **[DEPLOY.md](DEPLOY.md)**

Short version:

1. Push this repo to GitHub (already done for this repository).
2. On [render.com](https://render.com) → **New +** → **Blueprint** → select the repo.
   Render auto-detects `render.yaml`.
3. Choose **Starter** plan (needed for the persistent disk that stores the SQLite file).
4. Optionally fill env vars marked `sync: false` (see table below — all have working defaults).
5. **Deploy.** First boot: image build → WAR deploy → DB auto-seed → health check at `/health.jsp`.

**Free plan caveat:** free web services have **no persistent disk** — the DB resets on every deploy/restart (fine for demos). The app still works and re-seeds itself each boot.

**Data backup:** the live DB is a single file at `/data/online_job_portal.db` on the Render disk — download it periodically or use disk snapshots.

---

## ⚙️ Environment Variables

| Variable | Default | Purpose |
|---|---|---|
| `SQLITE_DB_PATH` | `/data/online_job_portal.db` | SQLite file location (keep it on the mounted disk in production) |
| `ADMIN_USERNAME` | `Omkar` | Admin panel login username |
| `ADMIN_PASSWORD` | `82081` | Admin panel login password |
| `MAIL_USERNAME` | `pratikpadalkar0011@gmail.com` | Sender account for interview emails |
| `MAIL_PASSWORD` | *(built-in app password)* | Gmail **App Password** for the sender account |

> All defaults match the original project. Overrides are optional but recommended for production.

---

## 🔑 Default Logins (Demo Data)

Loaded automatically from the original database backup:

| Role | URL | Username | Password |
|---|---|---|---|
| **Admin** | `/a_login.jsp` | `Omkar` | `82081` |
| **Employee** | `/e_login.jsp` | `Kunal` | `1234` |
| **Employee** | `/e_login.jsp` | `Partyaa` | `2092` |
| **Employee** | `/e_login.jsp` | `Shaniraj01` | `82081` |
| **Recruiter** | `/r_login.jsp` | `pratik@gmail.com` | `9970` |

You can also create fresh accounts from the sign-up pages.

---

## 📊 PDF Reports

Admin → **Reports** (`/Report.jsp`) → generated live from the DB by JasperReports:

**Normal reports:** User List · Recruiter List · Job List · Category List · Apply List · Feedback List

**ID-wise reports:** ID User · ID Recruiter · ID Job · ID Apply

**Date-wise reports:** Date Apply List (`dd/MM/yyyy`) · Date Feedback List

Report templates live in `src/main/webapp/report/*.jrxml`. They are **recompiled at Docker build time** (by `docker/CompileReports.java`) so the compiled `.jasper` files always match the bundled JasperReports engine — this fixed the classic `ClassCastException` from stale precompiled reports.

To edit a report: modify the `.jrxml` (or open in Jaspersoft Studio) and rebuild the Docker image.

---

## 📧 Email Notifications

When a recruiter schedules an interview, the candidate receives:

```
Subject: Interview Scheduled

Dear Candidate,
Your interview has been scheduled.
Date: 2026-10-10
Time: 10:30
Location: Zoom
Regards, HR Team
```

- Uses **Gmail SMTP** with the account in `MAIL_USERNAME` / `MAIL_PASSWORD` (must be a Gmail **App Password**, not the account password).
- Two implementations exist: `SendMail` (STARTTLS :587) and `Send_Mail` (SSL :465) — the interview flow uses `Send_Mail`.
- Render allows outbound 587/465. If Gmail rejects login, generate a fresh App Password and set `MAIL_PASSWORD`.

---

## 🖼 Screenshots

| | |
|---|---|
| ![Landing](src/main/webapp/images/frount1.jpg) | ![Jobs](src/main/webapp/images/job1.jpg) |

*(Add your own screenshots here after deploying — home page, job list, recruiter dashboard, PDF report.)*

---

## 🧯 Troubleshooting

| Problem | Cause / Fix |
|---|---|
| First page load is slow | Tomcat compiles all 50 JSPs on first hit — one-time cost. |
| `SQLITE_CANTOPEN` / DB errors on Windows | `/data` isn't writable on Windows; set `SQLITE_DB_PATH` to e.g. `C:/data/online_job_portal.db`. |
| PDF report download fails after custom changes | A `.jrxml` didn't compile — check the Docker build log (report compile step fails fast, `Compiled 13/13`). |
| Port 8080 busy (Windows) | Reserved port range — run with `-p 8081:8080`. |
| Emails not arriving | Gmail needs an **App Password**; verify `MAIL_PASSWORD`, or check container logs for `Email Failed!`. |
| Data disappeared after redeploy (free plan) | Free plan has no disk — upgrade to Starter or accept reseeding. |
| Login shows raw SQL strings | Old MySQL build cached — rebuild the image (`docker build` without cache). |

---

## 🔐 Security Notes

- ⚠️ Passwords are stored **in plain text** (as in the original college project) and SQL is built by string concatenation — fine for learning/demo, **not** for real production use. Consider BCrypt + `PreparedStatement` before going live.
- Admin and mail credentials have working defaults (kept intentionally for continuity) — override them via env vars on any shared deployment.
- The repo is public: **do not commit** stronger real credentials; use Render environment variables instead.

---

## 📜 License

This project was developed as a BCA final-year project. Free to use and modify for educational purposes.

---

## 🙌 Contributors

- **Omkar / Pratik / Kunal / Shaniraj** — original development team
- SQLite migration, Docker packaging & Render deployment — 2026
