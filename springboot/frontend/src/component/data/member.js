import React, { useEffect, useState } from 'react';
import axios from 'axios';

const Memberlist = () => {
  const [users,setUsers] =useState();
    useEffect(() => {
      fetch('/memberlist')
        .then(response => { console.log(response.json());})
        .then(data => {setUsers(data);})
},[]);

return (
  <div>
    <h1>Users</h1>
    <ul>{users.map((name) => <li>{name}</li> </ul>
  </div>
);
};

  export default Memberlist;