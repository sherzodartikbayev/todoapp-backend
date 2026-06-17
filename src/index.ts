import express from "express";

const app = express();

const todos = [
  { id: 1, title: "Buy milk" },
  { id: 2, title: "Do English homerworks" },
  { id: "Check emails" },
];

app.get("/", (req, res) => {
  return res.status(200).json(todos);
});

app.listen(3000, () => {
  console.log(`Server is running on port: 3000`);
});
