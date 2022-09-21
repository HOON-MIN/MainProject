import { Routes, Route } from "react-router-dom";
import { SignIn } from "./auth";
import { UserList } from "./component/UserList";
import AuthRoute from "./AuthRoute";
import "./App.css";
import Header from "./component/header";

import Mainpage from "./page/Mainpage";
import DoctorListPage from "./page/DoctorListPage";
import DoctorDetailPage from "./page/DoctorDetailPage";
import ReservationPage from "./page/ReservationPage";
import { useState, useEffect } from "react";
import LoginModal from "./component/LoginForm";
import axios from "axios";

// 로그인 관련

function App() {
  const [user, setUser] = useState();
  const authenticated = user != undefined;
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
  }, []);
  console.log("users: ", users);

  const login = ({ id, pwd }) => setUser(SignIn({ id, pwd }));
  const logout = () => {
    setUser(null);
    localStorage.clear();
  };
  console.log("메인", UserList);
  return (
    <div>
      <Header authenticated={authenticated} logout={logout} />
      <Routes>
        <Route path="/" element={<Mainpage />} />
        <Route path="/ulist" element={<UserList />} />
        <Route path="/dlist" element={<DoctorListPage />} />
        <Route path="/detail/:dnum" element={<DoctorDetailPage />} />
        <Route path="reservation/:dnum" element={<ReservationPage />} />
        <Route
          path="/login"
          element={<LoginModal authenticated={authenticated} login={login} />}
        />
      </Routes>
    </div>
  );
}
export default App;
