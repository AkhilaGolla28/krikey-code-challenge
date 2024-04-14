import React, { useState, useEffect } from "react";
import axios from "axios";
import "./App.css";
import profileImage from "./assets/profile.png"; // Import the profile image

function App() {
  const [authors, setAuthors] = useState([]);
  const [authorName, setAuthorName] = useState("");
  const [error, setError] = useState("");
  const [showTopAuthors, setShowTopAuthors] = useState(true); // State to control the display of top authors

  useEffect(() => {
    fetchAuthors();
  }, []);

  const fetchAuthors = () => {
    axios
      .get("http://localhost:3001/authors")
      .then((response) => {
        if (response.data.error) {
          console.log("Response from server:", response.data);
          setError(response.data.error + ": " + response.data.details);
          setAuthors([]);
        } else {
          setAuthors(response.data);
          setError("");
        }
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
        setError("Internal server error: " + error.message);
        setAuthors([]);
      });
  };

  const handleSearch = () => {
    if (authorName.trim() === "") {
      setError("Please enter an author name");
      setAuthors([]);
      return;
    }

    axios
      .get("http://localhost:3001/authors", {
        params: { author_name: authorName },
      })
      .then((response) => {
        console.log("Response from server:", response.data);
        if (response.data.error) {
          setError(response.data.error);
          setAuthors([]);
        } else {
          setAuthors(response.data);
          setError("");
          setShowTopAuthors(false);
        }
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
        setError("Internal server error: " + error.message);
        setAuthors([]);
      });
  };

  const handleBack = () => {
    fetchAuthors();
    setShowTopAuthors(true);
    setAuthorName("");
  };

  return (
    <div className="container">
      <h1 className="title">Authors</h1>
      <div className="search-container">
        <input
          type="text"
          placeholder="Search by author name"
          value={authorName}
          onChange={(e) => setAuthorName(e.target.value)}
        />
        <button onClick={handleSearch}>Search</button>
      </div>
      {error && <p className="error">{error}</p>}
      {showTopAuthors && (
        <>
          <h2 className="section-title">Top 10 Authors</h2>
          <ul className="author-list">
            {authors.map((author, index) => (
              <li key={index} className="author-item">
                <img src={profileImage} alt="Profile" />
                <div>
                  <h2>{author.name}</h2>
                  <p>Total Sales: ${author.total_sales}</p>
                </div>
              </li>
            ))}
          </ul>
        </>
      )}
      {!showTopAuthors && (
        <>
          <button className="back-button" onClick={handleBack}>
            Back to Top 10 Authors
          </button>
          <ul className="author-list">
            {authors.map((author, index) => (
              <li key={index} className="author-item">
                <img src={profileImage} alt="Profile" />
                <div>
                  <h2>{author.name}</h2>
                  <p>Total Sales: ${author.total_sales}</p>
                </div>
              </li>
            ))}
          </ul>
        </>
      )}
    </div>
  );
}

export default App;
