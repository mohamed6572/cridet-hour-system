const express = require('express');
const multer = require('multer');
const app = express();
const port = 3000;

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/');
  },
  filename: (req, file, cb) => {
    cb(null, file.originalname);
  },
});

const upload = multer({ storage });

app.post('/upload', upload.single('image'), (req, res) => {
  console.log('File uploaded:', req.file);
  res.status(200).send('File uploaded!');
});

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});
