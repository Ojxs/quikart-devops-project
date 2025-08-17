const express = require('express');
const cors = require('cors');
const app = express();
const port = 5000;

// Use CORS middleware to allow cross-origin requests
app.use(cors());

// --- Product Data (in a real app, this would come from a database) ---
const products = [
  { id: 1, name: 'Wireless Mouse', price: 25.00, description: 'Ergonomic wireless mouse for all-day use.' },
  { id: 2, name: 'Mechanical Keyboard', price: 80.00, description: 'Clicky keys for a satisfying typing experience.' },
  { id: 3, name: 'HD Webcam', price: 45.00, description: 'Crystal clear video for meetings and streaming.' },
  { id: 4, name: 'USB-C Hub', price: 30.00, description: 'Expand your laptop\'s connectivity with this multi-port hub.' },
];

// --- API Endpoints ---

// Simple "Hello World" endpoint to check if the server is running
app.get('/', (req, res) => {
  res.send('Welcome to the Quikart API!');
});

// Endpoint to get all products
app.get('/api/products', (req, res) => {
  res.json(products);
});

// Start the server
app.listen(port, () => {
  console.log(`Quikart API server listening on http://localhost:${port}`);
});