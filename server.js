// server.js
require('newrelic');
const express = require('express');
const path = require('path');
const app = express();
const port = 5000;

// Serve static files (game frontend)
app.use(express.static(path.join(__dirname, 'public')));

// Game logic route
app.get('/game', (req, res) => {
  const secretNumber = Math.floor(Math.random() * 100) + 1;
  res.send({ secretNumber });
});

// Start the server
app.listen(port,'0.0.0.0', () => {
  console.log(`Server running at http://localhost:${port}`);
});
