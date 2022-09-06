import React, { useState, useEffect } from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import logo from "./logo.svg";
import "./App.css";
import Header from "./component/header";
import Login from "./component/login";
import Memberlist from "./component/data/member";
import axios from 'axios';

function App() {
  const [date, setDate] = useState([]);
  const [memberlist, setMemberlist] = useState([]);
  //const [users, setUsers] = useState();
 

  axios({
    url : '/memberlist'
  });
  
  // useEffect(() => {
  //     fetch("/memberlist")
  //       .then((response) => response.text())
  //       .then((memberlist) => {
  //         setMemberlist(memberlist);
  //       });
  //       console.log(memberlist ,"데이터타입 =>", typeof memberlist);
  //   },[]);

  // useEffect(() => {
  //   axios({
  //     method: "GET",
  //     url: "http://localhost:83/memberlist",
  //   }).then((response) => setUsers(response.data));
  // });


  useEffect(() => {
    fetch("/memberlist")
      .then((response) => response.text())
      .then((memberlist) => {
        setMemberlist(memberlist);
      });
      console.log(memberlist , typeof memberlist);
  }, []);

  // useEffect(() => {
  //   fetch("/hello")
  //     .then((response) => response.text())
  //     .then((date) => {
  //       setDate(date);
  //     });
  //     console.log(date);
  // }, []);


  // const result = memberlist.map((list) => <li key={list.num}> {list.name} : {list.tel} </li>)

  return (
    <BrowserRouter>
      <Header />
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
        <Route path="/memberlist" element={<p>{memberlist}</p>}></Route>
        <Route path="/login" element={<Login />}></Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
