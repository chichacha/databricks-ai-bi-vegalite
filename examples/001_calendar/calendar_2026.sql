-- Databricks SQL
-- Synthetic 2026 calendar dataset
-- Includes Monday-first weekday logic, Thanksgiving, Black Friday,
-- and a countdown-friendly field for dashboard examples.

WITH calendar AS (
  SELECT
    explode(sequence(DATE'2026-01-01', DATE'2026-12-31', interval 1 day)) AS calendar_date
),

year_constants AS (
  SELECT
    2026 AS calendar_year,
    DATE'2026-11-01' AS november_1
),

holiday_calc AS (
  SELECT
    calendar_year,

    -- Databricks dayofweek: 1 = Sunday, 2 = Monday ... 7 = Saturday
    -- Thanksgiving = 4th Thursday in November
    date_add(
      november_1,
      pmod(5 - dayofweek(november_1), 7) + 21
    ) AS thanksgiving_date

  FROM year_constants
),

features AS (
  SELECT
    c.calendar_date,
    year(c.calendar_date) AS calendar_year,
    quarter(c.calendar_date) AS calendar_quarter,

    month(c.calendar_date) AS month_num,
    date_format(c.calendar_date, 'MMM') AS month_name,
    date_format(c.calendar_date, 'MMMM') AS month_name_full,

    weekofyear(c.calendar_date) AS iso_week_num,

    -- Convert Databricks Sunday-first dayofweek to ISO-style Monday-first.
    ((dayofweek(c.calendar_date) + 5) % 7) + 1 AS iso_dow_num,
    date_format(c.calendar_date, 'E') AS dow_short,
    date_format(c.calendar_date, 'EEEE') AS dow_name,

    h.thanksgiving_date,
    date_add(h.thanksgiving_date, 1) AS black_friday_date

  FROM calendar c
  CROSS JOIN holiday_calc h
)

SELECT
  calendar_date,
  calendar_year,
  calendar_quarter,

  month_num,
  month_name,
  month_name_full,

  iso_week_num,
  iso_dow_num,
  concat(iso_dow_num, ' ', dow_short) AS iso_dow_label,
  dow_name,

  CASE
    WHEN iso_dow_num IN (6, 7) THEN true
    ELSE false
  END AS is_weekend,

  CASE
    WHEN calendar_date = trunc(calendar_date, 'MM') THEN true
    ELSE false
  END AS is_month_start,

  CASE
    WHEN calendar_date = last_day(calendar_date) THEN true
    ELSE false
  END AS is_month_end,

  thanksgiving_date,
  black_friday_date,

  datediff(black_friday_date, calendar_date) AS days_until_black_friday,

  CASE
    WHEN calendar_date = thanksgiving_date THEN true
    ELSE false
  END AS is_thanksgiving,

  CASE
    WHEN calendar_date = black_friday_date THEN true
    ELSE false
  END AS is_black_friday,

  CASE
    WHEN calendar_date < black_friday_date THEN 'Before Black Friday'
    WHEN calendar_date = black_friday_date THEN 'Black Friday'
    ELSE 'After Black Friday'
  END AS black_friday_period

FROM features
ORDER BY calendar_date;