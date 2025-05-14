# Election-Result-Analysis

Absolutely! Here's a **GitHub-style README** for your **Election Result Analysis** SQL project, formatted similarly to the Hospital Data Analysis version you shared:

---

# 🗳️ Election Result Analysis (SQL Project)

This project is a **comprehensive SQL-based analysis** of **Indian election results**, showcasing how relational data can reveal deep insights into voting behavior, party performance, candidate margins, and state-level outcomes.
It demonstrates the use of **Joins**, **Subqueries**, **Views**, and **Aggregate functions** for meaningful electoral data analysis.

---

## 📋 Project Highlights:

* **Joins** to connect related tables like states, constituencies, and results.
* **Subqueries** for filtering records based on calculated criteria.
* **Views** to encapsulate complex logic and simplify querying.
* **Aggregate functions** (e.g., COUNT, SUM, AVG) to summarize data.
* **Filtering and sorting** with `WHERE`, `HAVING`, `ORDER BY`, and `LIMIT`.

---

## 📚 Queries Included:

1. **Find Winning Candidate with the Highest Vote Percentage**

   * **Join** between `CONSTITUENCYWISE_RESULTS` and `CONSTITUENCYWISE_DETAILS`, sorted by percentage descending.

2. **Find States Where Leading Candidate Won by More Than 3000 Votes**

   * **Subquery** to retrieve state names using `STATE_ID`.

3. **Party, Total Votes, and Vote % of 'Sachin Gupta' in Highest-Vote Constituency**

   * **Subquery** to find constituency with highest total votes + filter on candidate.

4. **Candidate with the Lowest Winning Margin Across All States**

   * **Sorting** based on `Margin` with `LIMIT 1`.

5. **States and Constituencies with Total Votes > 10,00,000**

   * **Join** + conditional filtering on vote count.

6. **First 5 Winning Candidates with Constituency and State Name**

   * **Join** + filter winning results, sorted and limited.

7. **Parties with at Least One Seat Won**

   * **Group By** on party with a `HAVING COUNT >= 1`.

8. **Total Seats Won by Each Party**

   * **Group By** on `Party` with `COUNT(*)`.

9. **Create View of States Where Leading Candidate Had Margin > 3000**

   * Encapsulates filtering logic for reuse.

10. **Create View with Constituency, Leading/Trailing Candidates, Margin**

    * Shows head-to-head result breakdown; queried to show first five entries.

---

## 🛠 Technologies Used:

* SQL (MySQL)
* SQL Features:

  * `JOIN` (INNER JOIN)
  * `GROUP BY`, `ORDER BY`, `LIMIT`, `HAVING`
  * `Subqueries` (inside `WHERE` and `SELECT`)
  * `Views` (Reusable SQL logic encapsulation)
  * `Aggregate Functions` (SUM, COUNT)

---

## 💡 How Subqueries and Views Add Value:

You can see subqueries and views used to:

* Extract specific cases like top-vote constituencies.
* Simplify repeated logic for readability and maintainability.
* Enable layered querying, such as summarizing margin-based results.


