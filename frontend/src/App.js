import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Define the URL of your backend API
    // In development, this is localhost:5000.
    // In production, this will be your deployed backend URL.
    const apiUrl = 'http://localhost:5000/api/products';

    axios.get(apiUrl)
      .then(response => {
        setProducts(response.data);
        setLoading(false);
      })
      .catch(error => {
        console.error('There was an error fetching the products!', error);
        setLoading(false);
      });
  }, []);

  if (loading) {
    return <div className="loading-message">Loading products...</div>;
  }

  return (
    <div className="App">
      <header className="App-header">
        <h1>Welcome to Quikart!</h1>
        <p>Your one-stop shop for everything you need.</p>
      </header>
      <main className="product-list">
        <h2>Our Products</h2>
        {products.length > 0 ? (
          <div className="products-grid">
            {products.map(product => (
              <div key={product.id} className="product-card">
                <h3>{product.name}</h3>
                <p className="product-price">${product.price.toFixed(2)}</p>
                <p className="product-description">{product.description}</p>
              </div>
            ))}
          </div>
        ) : (
          <p>No products available.</p>
        )}
      </main>
    </div>
  );
}

export default App;