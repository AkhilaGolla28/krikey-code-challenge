const express = require("express");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const cors = require("cors"); // Import cors package

const app = express();
const port = 3001;

// Use body-parser middleware
app.use(bodyParser.json());

// Enable CORS for all routes
app.use(cors());

// Create a MySQL connection pool
const pool = mysql.createPool({
  connectionLimit: 10,
  host: "localhost",
  user: "root",
  password: "akhila",
  database: "authors",
  port: 3306,
  insecureAuth: true,
});

app.get("/authors", (req, res) => {
  const authorName = req.query.author_name;

  let query = `
    SELECT authors.name, SUM(item_price * quantity) AS total_sales
    FROM sale_items
    JOIN books ON sale_items.book_id = books.id
    JOIN authors ON books.author_id = authors.id
    GROUP BY authors.name
    ORDER BY total_sales DESC
    LIMIT 10;
  `;

  const queryParams = authorName ? [authorName] : [];

  if (authorName) {
    query = `
      SELECT authors.name, SUM(item_price * quantity) AS total_sales
      FROM sale_items
      JOIN books ON sale_items.book_id = books.id
      JOIN authors ON books.author_id = authors.id
      WHERE authors.name = ?
      GROUP BY authors.name;
    `;
  }

  console.log("Executing query:", query);

  pool.getConnection((err, connection) => {
    if (err) {
      console.error("Error connecting to database:", err);
      res.status(500).json({ error: "Internal server error" });
      return;
    }

    connection.query(query, queryParams, (error, results) => {
      connection.release();

      if (error) {
        console.error("Error executing query:", error);
        res
          .status(500)
          .json({ error: "Internal server error", details: error.message });
        return;
      }

      if (!results.length) {
        res.status(404).json({ error: "Author not found" });
        return;
      }

      res.json(results);
    });
  });
});
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
