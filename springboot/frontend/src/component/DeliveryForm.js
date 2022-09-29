import React from "react";
import { useNavigate } from "react-router-dom";
import "../css/deliveryForm.css";
const DeliveryForm = () => {
  const navigate = useNavigate();

  return (
    <div style={{ backgroundColor: "#3478f5", height: "" }}>
      <div className="delPage">
        <div className="d-flex justify-content-center p-3">
          <div className="card border-0 p-2">
            <div className="card-body ">
              <p className="h5 mb-4">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  fill="currentColor"
                  className="bi bi-truck"
                  viewBox="0 0 16 16"
                >
                  {" "}
                  <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                </svg>
                배송정보
              </p>
              <div className="row">
                <div className="col-9">
                  <label htmlFor="num" className="form-label ">
                    <small className="small">받는 주소</small>
                  </label>
                  <p className="delInfo">{localStorage.getItem("addr")}</p>
                </div>
                <div className="col-3 delInput1">
                  <button className="delBtn1"> 변경</button>
                </div>
              </div>
              <div className="row">
                <div className="col-9">
                  <label htmlFor="num" className="form-label ">
                    <small className="small">받는 사람</small>
                  </label>
                  <p className="delInfo">{localStorage.getItem("id")}</p>
                </div>
                <div className="col-3 delInput1">
                  <button className="delBtn1"> 변경</button>
                </div>
              </div>
              <div className="row">
                <div className="col-9">
                  <label htmlFor="num" className="form-label ">
                    <small className="small">연락처</small>
                  </label>
                  <p className="delInfo">{localStorage.getItem("tel")}</p>
                </div>
                <div className="col-3 delInput1">
                  <button className="delBtn1"> 변경</button>
                </div>
              </div>
              <label htmlFor="num" className="form-label mt-2 ">
                <small>배송 요청 사항</small>
              </label>
              <textarea
                className="form-control"
                name="symptomComm"
                id="exampleFormControlTextarea1"
                rows="3"
                placeholder="문 앞에 놔주세요"
              ></textarea>
            </div>
          </div>
        </div>
        <div className="d-flex justify-content-center ps-3 pe-3 pt-5 pb-5 ">
          <div className="card mb-5">
            <div className="card-body">
              <h5 className="card-title">
                <i class="bi bi-credit-card" />
                결제방식
              </h5>
              <h6 className="card-subtitle mb-2 text-muted">
                아직 구현되지 않은 서비스입니다
              </h6>
            </div>
            <button
              className="btn btn-lg btn-primary m-4"
              onClick={() => {
                alert("저희 서비스를 이용해주셔서 감사합니다");
                navigate("/");
              }}
            >
              입력완료
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default DeliveryForm;
