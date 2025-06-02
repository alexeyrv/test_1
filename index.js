const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('Hello World! With dockerfile.');
});

app.listen(PORT, () => {
  console.log(`Test app listening at http://localhost:${PORT}`);
});
