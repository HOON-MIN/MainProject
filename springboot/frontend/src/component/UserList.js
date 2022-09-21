import axios from "axios";
import React, { useState, useEffect } from "react";

export function UserList() {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(false);

  // useEffect hook  : 특정한 작업을 마운트 할 때 마다 감지하는 hook

  useEffect(() => {
    const getUserList = (a) => {
      axios.get("/member/memberlist").then((res) => {
        setUsers(res.data);
        console.log(res.data);
      });
    };
    setLoading(false);
    getUserList();
  }, []); // useEffect end
  return users;
}
