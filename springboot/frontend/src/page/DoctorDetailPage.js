import React, { useState, useEffect } from "react";
import "../css/doctorDetail.css";
import axios from "axios";
import DoctorDetail from "../component/DoctorDetail";
import { useParams } from "react-router-dom";

const DoctorDetailPage = () => {
  let { dnum } = useParams();
  const [doctor, setDoctor] = useState();
  const [loading, setLoading] = useState(false);

  //의사별 디테일 axios
  useEffect(() => {
    const getDoctorDetail = () => {
      axios.get("/doctor/ddetail?dnum=" + dnum).then((res) => {
        setDoctor(res.data);
      });
    };
    setLoading(false);
    getDoctorDetail();
  }, []);

  return (
    <div className="container-fluid detailPage">
      {doctor && <DoctorDetail doctor={doctor} />}
    </div>
  );
};

export default DoctorDetailPage;
