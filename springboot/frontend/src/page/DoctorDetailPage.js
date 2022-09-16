import React from "react";
import "../css/doctorDetail.css";
import DoctorDetail from "../component/DoctorDetail";

const DoctorDetailPage = (props) => {
  console.log(props);
  return (
    <div className="body container detailbody mt-5">
      <DoctorDetail />
    </div>
  );
};

export default DoctorDetailPage;
