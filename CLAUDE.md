# Gleesons Pub Sales SQL Analysis

## Project purpose

This is a **beginner-friendly SQL portfolio project**. It exists to demonstrate
clear, well-structured SQL analysis — not to showcase advanced tooling or
infrastructure. Prioritize readability and simplicity over cleverness.

## About the data

The dataset in `data/pub_sales_data.csv` is **simulated and anonymised**. It
was created for portfolio purposes and does **not** contain real internal POS
data from Gleesons (or any pub).

- Never describe the data as real, live, or sourced from an actual business.
- Any README text, comments, or commit messages should make the
  simulated/anonymised nature of the data clear if the topic comes up.

## SQL conventions

- Use **SQLite syntax** throughout (this project uses a local `.db` file, no
  other database engine).
- Keep queries **clear and well-commented** — a beginner reading the `.sql`
  files should be able to follow the logic and understand *why* a query is
  written the way it is, not just what it outputs.
- Prefer simple, readable SQL (CTEs, clear aliases) over dense or overly
  clever one-liners.
- Group related queries into the themed files under `sql/` (revenue/profit,
  product performance, category performance, staff activity, trading days,
  trading hours, margins) rather than scattering ad hoc queries.

## Tone

Keep all written content (README, comments, commit messages) **professional
but simple** — this is a learning-oriented portfolio piece, not a corporate
report. Avoid jargon that a beginner wouldn't recognize without explanation.

## Tooling

Do not overcomplicate the project with unnecessary tools, dependencies, or
infrastructure. Concretely:

- Stick to **SQLite** and the Python **standard library** (e.g. `sqlite3`,
  `csv`) for loading data — no ORMs, no extra frameworks, no external
  Python packages unless there's a clear, specific need.
- No Docker, no web app, no API layer. This is a SQL analysis project, not a
  full application.
- The `.db` file is built locally from the CSV via `scripts/build_db.py` and
  stays out of version control (see `.gitignore`) — don't commit it.
- Results are captured as screenshots referenced from the README, not via
  extra reporting scripts or dashboards, unless the user asks otherwise.
