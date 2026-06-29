# 📅 Example 001 — 2026 Calendar

> *"Because every dashboard deserves a proper calendar."*

This example builds a reusable **2026 calendar dataset** entirely with Databricks SQL and demonstrates two custom Vega-Lite visualizations for Databricks AI/BI Dashboards.

No CSV files.

No manual date tables.

Just SQL. 🎉

---

## 🎯 What you'll learn

✅ Generate a complete calendar using `sequence()` and `explode()`

✅ Create ISO (Monday-first) weekdays

✅ Calculate Black Friday

✅ Build responsive Vega-Lite custom visualizations

✅ Use conditional colours

✅ Create interactive tooltips

---

# 🌟 Visualization 1 — Black Friday Countdown

A KPI card that automatically counts down to Black Friday.

Perfect for learning:

* Aggregations
* Conditional formatting
* Text layers
* KPI card layouts

Instead of updating numbers manually every day, SQL does the work for you.

---

# 🗓 Visualization 2 — Calendar Heatmap

A miniature calendar that visualizes every day of the year.

Colours indicate whether a day is:

* ⬛ Past
* 🟨 Today
* ⬜ Future
* 🔥 Black Friday

This example demonstrates how surprisingly flexible Vega-Lite can be—even though AI/BI doesn't provide a built-in calendar visual.

---

# 💡 Why this example?

Calendars appear everywhere:

* Marketing campaigns
* Promotions
* Release schedules
* Holiday planning
* Project timelines
* Data freshness monitoring

Learning how to generate one with SQL means you'll never need to hunt for a calendar table again.

---

# 🧪 Things to Try

Feeling adventurous?

Try one of these:

* 🎄 Highlight Christmas
* 🌸 Colour weekends differently
* 🌙 Add moon phases
* 🌊 Overlay tide information
* 🌼 Show flower blooming seasons
* 🥾 Create a hiking season calendar

---

# 📂 Files

| File                    | Description                              |
| ----------------------- | ---------------------------------------- |
| `calendar_2026.sql`     | Generates the synthetic calendar dataset |
| `countdown_card.json`   | Black Friday countdown KPI               |
| `calendar_heatmap.json` | Mini calendar heatmap                    |

---

## 🌱 Build something awesome

These examples are intentionally small.

Copy them.

Break them.

Improve them.

Then build something entirely your own.
