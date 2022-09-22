import React from "react";
import Reservation from "../component/Reservation";

const ReservationPage = () => {
  return (
    <div className="body container-fluid page">
      <h5 className="text-center text-white title">예약하기</h5>
      <Reservation />
    </div>
  );
};

export default ReservationPage;
