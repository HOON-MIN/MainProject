import React, { useState, useEffect } from "react";
import "../css/doctorDetail.css";
import axios from "axios";
import DoctorDetail from "../component/DoctorDetail";
import { useParams } from "react-router-dom";

const DoctorDetailPage = () => {
  let { dnum } = useParams();
  const [doctor, setDoctor] = useState();
  const [loading, setLoading] = useState(false);

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
    <div className="body container detailbody mt-5">
      {doctor && <DoctorDetail doctor={doctor} />}
    </div>
  );
};

export default DoctorDetailPage;
