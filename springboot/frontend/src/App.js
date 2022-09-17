import { Routes, Route } from "react-router-dom";
import "./App.css";
import Header from "./component/header";
import UserList from "./component/UserList";
import Mainpage from "./page/Mainpage";
import DoctorListPage from "./page/DoctorListPage";
import DoctorDetailPage from "./page/DoctorDetailPage";
import ReservationPage from "./page/ReservationPage";

function App() {
  return (
    <div>
      <Header />
      <Routes>
        <Route path="/" element={<Mainpage />} />
        <Route path="/ulist" element={<UserList />} />
        <Route path="/dlist" element={<DoctorListPage />} />
        <Route path="/detail/:dnum" element={<DoctorDetailPage />} />
        <Route path="reservation" element={<ReservationPage />} />
      </Routes>
    </div>
  );
}
export default App;
