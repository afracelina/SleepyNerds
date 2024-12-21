import React, { useState, useEffect } from 'react';
import axios from 'axios';

const HotelsForm = () => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Fetch data from the PHP backend
  useEffect(() => {
    axios.get('http://localhost/path/to/api.php') // Replace with your actual PHP file path
      .then((response) => {
        setData(response.data);  // Update state with the fetched data
        setLoading(false);        // Set loading to false once data is fetched
      })
      .catch((error) => {
        setError('Error fetching data');
        setLoading(false);        // Set loading to false if there's an error
      });
  }, []);

  // Display a loading message or error if needed
  if (loading) return <p>Loading...</p>;
  if (error) return <p>{error}</p>;

  return (
    <div>
      <table>
        <thead>
          <tr>
            <th>Nom</th>
            <th>Description</th>
            <th>Localisation</th>
            <th>Image</th>
          </tr>
        </thead>
        <tbody>
          {data.length > 0 ? (
            data.map(item => (
              <tr key={item.id}>
                <td>{item.nom}</td>
                <td>{item.description}</td>
                <td>{item.localisation}</td>
                <td>
                  <img src={item.image_url} alt={item.nom} width="50" />
                </td>
              </tr>
            ))
          ) : (
            <tr>
              <td colSpan="4">No data available</td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  );
};

export default HotelsForm;
