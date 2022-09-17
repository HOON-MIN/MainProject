import React, { useState, useEffect, useCallback } from "react";
import "../css/hospitalList.css";
import drImg from "../img/doctor.png";

import { Link } from "react-router-dom";
import axios from "axios";
import DoctorList from "../component/DoctorList";
import Categories from "../component/Categories";

const DoctorListPage = () => {
  const [doctors, setDoctors] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const getDoctorList = (a) => {
      axios.get("/doctor/dlist").then((res) => {
        setDoctors(res.data);
      });
    };
    setLoading(false);
    getDoctorList();
  }, []);

  return (
    <div className="body container">
      <div className="body-inner text-center">
        <h2 className="h2">의사 리스트</h2>
        <Categories doctor={doctors} />
      </div>
      {doctors.map((doctor) => (
        <Link to={"/detail/" + doctor.dnum} style={{ textDecoration: "none" }}>
          <DoctorList key={doctor.dnum} doctor={doctor} />
        </Link>
      ))}
    </div>
  );
};

export default DoctorListPage;
