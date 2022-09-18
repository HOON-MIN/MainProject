import React from "react";
import Reservation from "../component/Reservation";

const ReservationPage = () => {
  return (
    <div className="body container">
      <div className="body-inner text-center">
        <h2 className="h2">예약</h2>
        <hr />
      </div>
      <Reservation />
    </div>
  );
};

export default ReservationPage;
