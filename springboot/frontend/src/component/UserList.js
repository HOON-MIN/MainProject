import axios from "axios";
import React, { useState, useEffect } from "react";

const UserList = () => {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(false);

  // useEffect hook  : 특정한 작업을 마운트 할 때 마다 감지하는 hook

  useEffect(() => {
    const getUserList = (a) => {
      axios.get("/member/memberlist").then((res) => {
        setUsers(res.data);
      });
    };
    setLoading(false);
    getUserList();
  }, []); // useEffect end
  return (
    <div>
      <h2 className="text-center">Emp List</h2>
      <div className="row">
        <table className="table table-striped table-bordered">
          <thead>
            <tr>
              <td className="text-right" colSpan={4}>
                currentPage : 1
              </td>
            </tr>
            <tr>
              <th>이름</th>
              <th>아이디</th>
              <th>나이</th>
              <th>이메일</th>
            </tr>
          </thead>

          <tbody>
            {users.map((post) => (
              <tr key={post.id}>
                <td>{post.name}</td>
                <td>{post.id}</td>
                <td>{post.age}</td>
                <td>{post.email}</td>
                <td>
                  <button className="btn btn-info">update</button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div>
        <button className="btn btn-primary">Add Employee</button>
      </div>
    </div>
  );
};

export default UserList;
