USE task_management;

const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());

// MySQL Connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',  // your MySQL password
  database: 'task_manager'
});

db.connect(err => {
  if (err) throw err;
  console.log('Connected to MySQL database.');
});

// CREATE Task
app.post('/tasks', (req, res) => {
  const { userID, taskDescription, status, dueDate } = req.body;
  const sql = `INSERT INTO Tasks (UserID, TaskDescription, Status, DueDate) VALUES (?, ?, ?, ?)`;
  db.query(sql, [userID, taskDescription, status, dueDate], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Task created', taskID: result.insertId });
  });
});

// READ All Tasks
app.get('/tasks', (req, res) => {
  db.query('SELECT * FROM Tasks', (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
});

// READ Single Task
app.get('/tasks/:id', (req, res) => {
  db.query('SELECT * FROM Tasks WHERE TaskID = ?', [req.params.id], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    if (rows.length === 0) return res.status(404).json({ message: 'Task not found' });
    res.json(rows[0]);
  });
});

// UPDATE Task
app.put('/tasks/:id', (req, res) => {
  const { taskDescription, status, dueDate } = req.body;
  const sql = `UPDATE Tasks SET TaskDescription = ?, Status = ?, DueDate = ? WHERE TaskID = ?`;
  db.query(sql, [taskDescription, status, dueDate, req.params.id], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Task updated' });
  });
});

// DELETE Task
app.delete('/tasks/:id', (req, res) => {
  db.query('DELETE FROM Tasks WHERE TaskID = ?', [req.params.id], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Task deleted' });
  });
});

// Start Server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
