import React, { useState , useEffect } from "react";
import Axios from 'axios';
import "./App.css";

function App() {  
  const [users,setUsers] =useState();
  useEffect(() => {
  Axios.get('https://jsonplaceholder.typicode.com/users').then((response) => {
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
    <li>안녕</li>
    { users.map(function(username){
      return(
        <li>테스트</li>
      )
    })}
  </ul>  
</div>
)
};
export default App;
