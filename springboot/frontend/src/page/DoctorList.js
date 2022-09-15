import React from "react";
import "../css/hospitalList.css";
import drImg from "../img/doctor.png";
import { Link } from "react-router-dom";

const HospitalList = () => {
  return (
    <div className="body container">
      <div className="body-inner text-center">
        <h2 className="h2">의사 리스트</h2>
        <hr />
      </div>
      <Link to="/detail" style={{ textDecoration: "none" }}>
        <div className="d-flex justify-content-center">
          <div className="card">
            <div className="row g-0">
              <div className="col-md-3 text-center">
                <img src={drImg} className="img-fluid p-3" alt="..." />
              </div>
              <div className="col-md-9">
                <div className="card-body">
                  <h5 className="card-title">
                    <strong>김길동 의사</strong>
                    <span>진료가능</span>
                  </h5>
                  <p className="card-text">김길동 만능 병원</p>
                  <p className="card-text">
                    <small className="text-muted">
                      <i className="bi bi-clock"></i> 09:00 ~ 20:00
                      <i className="bi bi-dot"></i> 점심 : 13:00 ~ 14:00
                    </small>
                  </p>
                  <div className="d-flex flex-start">
                    <button
                      className="btn btn-primary me-1 disabled"
                      type="button"
                    >
                      내과
                    </button>
                    <button
                      className="btn btn-primary me-1 disabled"
                      type="button"
                    >
                      이비인후과
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </Link>
    </div>
  );
};

export default HospitalList;
