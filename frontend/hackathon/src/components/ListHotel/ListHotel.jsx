import React, { useState, useEffect } from "react";
import "./ListHotel.css";

function ListHotel() {
  const [hotels, setHotels] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch("/api/hotels")
      .then((response) => response.json())
      .then((data) => {
        setHotels(data);
        setLoading(false);
      })
      .catch((err) => {
        setError("Failed to load hotels");
        setLoading(false);
      });
  }, []);

  const handleUpdate = (id) => {
    alert(`Update clicked for hotel ID: ${id}`);
    // Logic for update goes here (redirect to form or modal with hotel data)
  };

  const handleDelete = (id) => {
    if (window.confirm("Are you sure you want to delete this hotel?")) {
      fetch(`/api/hotels/${id}`, { method: "DELETE" })
        .then((response) => {
          if (response.ok) {
            setHotels(hotels.filter((hotel) => hotel.id !== id));
          } else {
            alert("Failed to delete hotel.");
          }
        })
        .catch(() => alert("Error deleting hotel."));
    }
  };

  if (loading) return <p>Loading...</p>;
  if (error) return <p>{error}</p>;

  return (
    <div className="hotel-list">
      <h2>Hotel List</h2>
      {hotels.length > 0 ? (
        hotels.map((hotel) => (
          <div key={hotel.id} className="hotel-card">
            <h3>{hotel.nom}</h3>
            <p><strong>Address:</strong> {hotel.adresse}</p>
            <p><strong>Email:</strong> {hotel.email}</p>
            <p><strong>Phone:</strong> {hotel.telephone}</p>
            <p><strong>Capacity:</strong> {hotel.capacite}</p>
            <p><strong>Type:</strong> {hotel.type}</p>
            <p><strong>Availability:</strong> {hotel.disponible ? "Available" : "Not Available"}</p>
            <p><strong>Description:</strong> {hotel.description}</p>
            <div className="card-buttons">
              <button className="btn update-btn" onClick={() => handleUpdate(hotel.id)}>Update</button>
              <button className="btn delete-btn" onClick={() => handleDelete(hotel.id)}>Delete</button>
            </div>
          </div>
        ))
      ) : (
        <p>No hotels found.</p>
      )}
    </div>
  );
}

export default ListHotel;
