import React, { useState , useEffect } from "react";
import Axios from 'axios';
import "./App.css";
import Memberlist from "./component/data/member";

function App() {  
  const [users,setUsers] =useState();
  useEffect(() => {
  Axios.get('/memberlist').then((response) => {
    if(response.data){
      setUsers(response.data);
    }else{
      alert("failed to");
    }
  });
});
return (
<div>
  <ul>
    <li>{users.id}</li>
    <li>{users.name}</li>
  </ul>
    
  
</div>
)
};
export default App;
