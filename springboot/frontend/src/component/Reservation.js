import React from "react";
import "../css/reservation.css";

const Reservation = () => {
  return (
    <div className="d-flex justify-content-center revPage p-3">
      <div className="card border-0 p-2">
        <div className="card-body ">
          <p className="h4 ps-2 mb-4">
            <strong>예약자 정보</strong>
          </p>
          <label for="exampleFormControlInput1" className="form-label">
            예약자 성명 : {localStorage.getItem("id")}
          </label>
          <br />
          <label for="exampleFormControlInput1" className="form-label mb-0">
            휴대폰 번호 : {localStorage.getItem("num")}
          </label>
        </div>
        <hr />
        <div className="card-body ">
          <p className="h4 ps-2 mb-4">
            <strong>증상 선택</strong>
          </p>
          <div className="flex-start">
            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option1"
              autocomplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option1"
            >
              Checked
            </label>

            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option2"
              autocomplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option2"
            >
              Radio
            </label>

            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option3"
              autocomplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option3"
            >
              Disabled
            </label>

            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option4"
              autocomplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option4"
            >
              Radio
            </label>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Reservation;
