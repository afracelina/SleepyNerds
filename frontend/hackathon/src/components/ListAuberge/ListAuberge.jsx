import React, { useState, useEffect } from "react";
import "./ListAuberge.css";

function ListHotel() {
  const [hotels, setHotels] = useState([]);
  const [filteredHotels, setFilteredHotels] = useState([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fakeData = [
      {
        id: 1,
        nom: "Sunset Hotel",
        adresse: "123 Ocean Blvd, Malibu",
        email: "contact@sunsethotel.com",
        telephone: "+1234567890",
        capacite: 50,
        type: "Luxury",
        disponible: true,
        description: "A luxurious beachfront hotel with stunning ocean views and top-notch amenities."
      },
      {
        id: 2,
        nom: "Mountain View Resort",
        adresse: "456 Mountain Rd, Denver",
        email: "contact@mountainviewresort.com",
        telephone: "+9876543210",
        capacite: 30,
        type: "Resort",
        disponible: false,
        description: "A serene resort nestled in the mountains, perfect for a relaxing getaway."
      },
      {
        id: 3,
        nom: "City Center Hotel",
        adresse: "789 City St, New York",
        email: "contact@citycenterhotel.com",
        telephone: "+5555555555",
        capacite: 100,
        type: "Business",
        disponible: true,
        description: "A modern hotel located in the heart of the city, ideal for business travelers and tourists."
      }
    ];

    setTimeout(() => {
      setHotels(fakeData);
      setFilteredHotels(fakeData);
      setLoading(false);
    }, 1000);
  }, []);

  const handleSearch = () => {
    const filtered = hotels.filter((hotel) =>
      hotel.nom.toLowerCase().includes(searchQuery.toLowerCase()) ||
      hotel.adresse.toLowerCase().includes(searchQuery.toLowerCase())
    );
    setFilteredHotels(filtered);
  };

  const handleInputChange = (e) => {
    setSearchQuery(e.target.value);
  };

  const handleUpdate = (id) => {
    alert(`Update clicked for hotel ID: ${id}`);
  };

  const handleDelete = (id) => {
    alert(`Delete clicked for hotel ID: ${id}`);
  };

  if (loading) return <p>Loading...</p>;
  if (error) return <p>{error}</p>;

  return (
    <div className="hotel-list">
      <div className="header">
        <h2>Inns List</h2>
        <div className="search-container">
          <input
            type="text"
            className="search-bar"
            placeholder="Search by name or address..."
            value={searchQuery}
            onChange={handleInputChange}
          />
          <button className="search-btn" onClick={handleSearch}>
            Search
          </button>
        </div>
        <button className="btn add-btn">Add</button>
      </div>

      <div className="hotel-cards">
        {filteredHotels.length > 0 ? (
          filteredHotels.map((hotel) => (
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
                <button
                  className="btn update-btn"
                  onClick={() => handleUpdate(hotel.id)}
                >
                  Update
                </button>
                <button
                  className="btn delete-btn"
                  onClick={() => handleDelete(hotel.id)}
                >
                  Delete
                </button>
              </div>
            </div>
          ))
        ) : (
          <p>No hotels found.</p>
        )}
      </div>
    </div>
  );
}

export default ListHotel;

