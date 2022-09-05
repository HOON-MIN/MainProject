import React, { useState, useEffect } from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import logo from "./logo.svg";
import "./App.css";
import Header from "./component/header";
import Login from "./component/login";
import axios from "axios";

function App() {
  const [date, setDate] = useState([]);
  const [users, setUsers] = useState();

  useEffect(() => {
    axios({
      method: "GET",
      url: "https://jsonplaceholder.typicode.com/users",
    }).then((response) => setUsers(response.data));
  });

  useEffect(() => {
    fetch("/hello")
      .then((response) => response.text())
      .then((date) => {
        setDate(date);
      });
  }, []);
  return (
    <BrowserRouter>
      <Header />
      {date}
      <Routes>
        <Route
          path="/"
          element={
            <header className="App-header">
              <img src={logo} className="App-logo" alt="logo" />
            </header>
          }
        ></Route>

        <Route path="/date" element={<span>{date}</span>}></Route>

        <Route path="/login" element={<Login />}></Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
