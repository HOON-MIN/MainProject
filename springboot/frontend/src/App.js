import { BrowserRouter, Routes, Route } from "react-router-dom";
import "./App.css";
import Header from "./component/header";
import UserList from "./component/UserList";
import Mainpage from "./page/Mainpage";
import DoctorList from "./page/DoctorList";
import DoctorDetail from "./page/DoctorDetail";

function App() {
  return (
    <div>
      <Header />
      <Routes>
        <Route path="/" element={<Mainpage />} />
        <Route path="/ulist" element={<UserList />} />
        <Route path="/dlist/*" element={<DoctorList />} />
        <Route path="/detail/*" element={<DoctorDetail />} />
      </Routes>
    </div>
  );
}
export default App;
