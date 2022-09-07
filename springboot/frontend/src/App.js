import React, { useState , useEffect } from "react";
import { BrowserRouter, Routes, Route, useParams } from "react-router-dom";
import logo from "./logo.svg";
import "./App.css";
import Header from "./component/header";
import Login from "./component/login";
import axios from 'axios';
import Memberlist from "./component/data/member";

function App() {  

  return (
    <div>
      <Memberlist/>
    </div>

  );
};
export default App;
