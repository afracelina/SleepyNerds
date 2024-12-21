import React, { useState, useEffect } from "react";
import "./ListeTransport.css";

function ListeTransport() {
  const [transports, setTransports] = useState([]);
  const [filteredTransports, setFilteredTransports] = useState([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fakeData = [
      {
        id: 1,
        type: "Bus",
        nom: "City Bus",
        number_ligne: "101A",
        depart: "Downtown",
        destination: "Uptown",
        heure_depart: "08:00 AM",
        heure_arrivee: "09:00 AM",
        jours_operables: "Monday to Friday",
        disponibilite: true,
        tarif: "$2.50",
      },
      {
        id: 2,
        type: "Train",
        nom: "Metro Express",
        number_ligne: "M2",
        depart: "Central Station",
        destination: "Northside",
        heure_depart: "07:30 AM",
        heure_arrivee: "08:15 AM",
        jours_operables: "All Week",
        disponibilite: true,
        tarif: "$5.00",
      },
      {
        id: 3,
        type: "Taxi",
        nom: "City Taxi",
        number_ligne: "N/A",
        depart: "Any Location",
        destination: "Any Location",
        heure_depart: "On Request",
        heure_arrivee: "On Request",
        jours_operables: "All Week",
        disponibilite: false,
        tarif: "Varies",
      },
    ];

    setTimeout(() => {
      setTransports(fakeData);
      setFilteredTransports(fakeData);
      setLoading(false);
    }, 1000);
  }, []);

  const handleSearch = () => {
    const filtered = transports.filter((transport) =>
      transport.nom.toLowerCase().includes(searchQuery.toLowerCase()) ||
      transport.depart.toLowerCase().includes(searchQuery.toLowerCase()) ||
      transport.destination.toLowerCase().includes(searchQuery.toLowerCase())
    );
    setFilteredTransports(filtered);
  };

  const handleInputChange = (e) => {
    setSearchQuery(e.target.value);
  };

  const handleUpdate = (id) => {
    alert(`Update clicked for transport ID: ${id}`);
  };

  const handleDelete = (id) => {
    alert(`Delete clicked for transport ID: ${id}`);
  };

  if (loading) return <p>Loading...</p>;
  if (error) return <p>{error}</p>;

  return (
    <div className="transport-list">
      <div className="header">
        <h2>Transport List</h2>
        <div className="search-container">
          <input
            type="text"
            className="search-bar"
            placeholder="Search by name, departure, or destination..."
            value={searchQuery}
            onChange={handleInputChange}
          />
          <button className="search-btn" onClick={handleSearch}>
            Search
          </button>
        </div>
        <button className="btn add-btn">Add</button>
      </div>

      <div className="transport-cards">
        {filteredTransports.length > 0 ? (
          filteredTransports.map((transport) => (
            <div key={transport.id} className="transport-card">
              <h3>{transport.nom}</h3>
              <p><strong>Type:</strong> {transport.type}</p>
              <p><strong>Line Number:</strong> {transport.number_ligne}</p>
              <p><strong>Departure:</strong> {transport.depart}</p>
              <p><strong>Destination:</strong> {transport.destination}</p>
              <p><strong>Departure Time:</strong> {transport.heure_depart}</p>
              <p><strong>Arrival Time:</strong> {transport.heure_arrivee}</p>
              <p><strong>Operating Days:</strong> {transport.jours_operables}</p>
              <p><strong>Availability:</strong> {transport.disponibilite ? "Available" : "Not Available"}</p>
              <p><strong>Fare:</strong> {transport.tarif}</p>
              <div className="card-buttons">
                <button
                  className="btn update-btn"
                  onClick={() => handleUpdate(transport.id)}
                >
                  Update
                </button>
                <button
                  className="btn delete-btn"
                  onClick={() => handleDelete(transport.id)}>
                  Delete
                </button>
              </div>
            </div>
          ))
        ) : (
          <p>No transports found.</p>
        )}
      </div>
    </div>
  );
}

export default ListeTransport;
