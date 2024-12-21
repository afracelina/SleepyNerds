import React, { useState, useEffect } from "react";
import "./Tsites.css";

function ListeSites() {
  const [sites, setSites] = useState([]);
  const [filteredSites, setFilteredSites] = useState([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fakeData = [
      {
        id: 1,
        nom: "Grand Canyon",
        description: "A breathtaking natural wonder located in Arizona, USA.",
        localisation: "Arizona, USA",
        image_url: "https://via.placeholder.com/300x200?text=Grand+Canyon",
      },
      {
        id: 2,
        nom: "Eiffel Tower",
        description: "An iconic symbol of France and a marvel of engineering.",
        localisation: "Paris, France",
        image_url: "https://via.placeholder.com/300x200?text=Eiffel+Tower",
      },
      {
        id: 3,
        nom: "Great Wall of China",
        description:
          "A historic wall stretching thousands of miles across China.",
        localisation: "China",
        image_url: "https://via.placeholder.com/300x200?text=Great+Wall",
      },
    ];

    setTimeout(() => {
      setSites(fakeData);
      setFilteredSites(fakeData);
      setLoading(false);
    }, 1000);
  }, []);

  const handleSearch = () => {
    const filtered = sites.filter((site) =>
      site.nom.toLowerCase().includes(searchQuery.toLowerCase()) ||
      site.localisation.toLowerCase().includes(searchQuery.toLowerCase())
    );
    setFilteredSites(filtered);
  };

  const handleInputChange = (e) => {
    setSearchQuery(e.target.value);
  };

  const handleUpdate = (id) => {
    alert(`Update clicked for site ID: ${id}`);
  };

  const handleDelete = (id) => {
    alert(`Delete clicked for site ID: ${id}`);
  };

  if (loading) return <p>Loading...</p>;
  if (error) return <p>{error}</p>;

  return (
    <div className="site-list">
      <div className="header">
        <h2>Sites List</h2>
        <div className="search-container">
          <input
            type="text"
            className="search-bar"
            placeholder="Search by name or location..."
            value={searchQuery}
            onChange={handleInputChange}
          />
          <button className="search-btn" onClick={handleSearch}>
            Search
          </button>
        </div>
        <button className="btn add-btn">Add</button>
      </div>

      <div className="site-cards">
        {filteredSites.length > 0 ? (
          filteredSites.map((site) => (
            <div key={site.id} className="site-card">
              <img
                src={site.image_url}
                alt={site.nom}
                className="site-image"
              />
              <h3>{site.nom}</h3>
              <p>
                <strong>Description:</strong> {site.description}
              </p>
              <p>
                <strong>Location:</strong> {site.localisation}
              </p>
              <div className="card-buttons">
                <button
                  className="btn update-btn"
                  onClick={() => handleUpdate(site.id)}
                >
                  Update
                </button>
                <button
                  className="btn delete-btn"
                  onClick={() => handleDelete(site.id)}
                >
                  Delete
                </button>
              </div>
            </div>
          ))
        ) : (
          <p>No sites found.</p>
        )}
      </div>
    </div>
  );
}

export default ListeSites;
