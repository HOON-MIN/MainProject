import React from "react";
import "../css/reservation.css";
import "react-datepicker/dist/react-datepicker.css";
import { useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import axios from "axios";
import Modal from "react-bootstrap/Modal";
import Button from "react-bootstrap/Button";

const Reservation = () => {
  const navigate = useNavigate();
  const location = useLocation();

  const [modalShow, setModalShow] = React.useState(false);
  const handleClose = () => {
    setModalShow(false);
    navigate("/");
  };
  const handleShow = () => setModalShow(true);

  //현재 시간의 30분 뒤 값을 정제해서 input 입력
  const today11 = new Date();
  const rTime = new Date(Date.parse(today11) + 1000 * 60 * 30);
  let month = rTime.getMonth() + 1; // 월
  let date = rTime.getDate(); // 날짜
  let year = rTime.getFullYear(); // 요일
  let hour = rTime.getHours();
  let minute = ("0" + rTime.getMinutes()).slice(-2);
  let monthRes = ("0" + month).slice(-2);
  let dateToday = year + "-" + monthRes + "-" + date;
  let timeNow = hour + ":" + minute;

  //인풋 내용 저장
  const [input, setInput] = useState({
    num: localStorage.getItem("num"),
    dnum: location.state.data,
    symptom: "",
    symptomComm: "",
    contactCheck: 0,
    rdate: dateToday,
    rtime: timeNow,
  });

  //인풋 내용 담기
  const handleClick = (e) => {
    setInput({
      ...input,
      [e.target.name]: e.target.value,
    });
  };

  const reserveClick = (e) => {
    e.preventDefault();
    if (input.symptom === "") {
      return alert("증상을 선택해주세요.");
    } else if (input.symptomComm === "") {
      return alert("자세한 증상에 대해 입력해주세요.");
    } else {
      axios.post("/reserve/addReserveReact", input).then(() => {
        console.log("완료");
        handleShow();
      });
    }
  };

  //모달창
  function SuccessReserve() {
    return (
      <Modal
        show={modalShow}
        onHide={handleClose}
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Header closeButton>
          <Modal.Title>예약완료</Modal.Title>
        </Modal.Header>
        <Modal.Body>곧 의사에게 연락이 오니 기다려주세요.</Modal.Body>
        <Modal.Footer>
          <Button onClick={handleClose}>Close</Button>
        </Modal.Footer>
      </Modal>
    );
  }

  return (
    <div className="revPage">
      <SuccessReserve show={modalShow} onHide={() => setModalShow(false)} />
      <div className="d-flex justify-content-center p-3 h-100">
        <div className="card border-0 p-2">
          <div className="card-body ">
            <p className="h4 ps-2 mb-4">
              <strong>예약자 정보</strong>
            </p>
            <label htmlFor="num" className="form-label">
              예약자 성명 : {localStorage.getItem("id")}
            </label>
            <br />
            <label htmlFor="num" className="form-label mb-0">
              휴대폰 번호 : {localStorage.getItem("tel")}
            </label>
          </div>
          <hr />
          <div className="card-body ">
            <p className="h4 ps-2 mb-4">
              <strong>증상 선택</strong>
            </p>
            <div className="flex-start">
              <input
                value="코로나"
                type="radio"
                onChange={handleClick}
                className="btn-check"
                name="symptom"
                id="corona"
                autoComplete="off"
              />
              <label
                className="btn btn-primary text-white me-2 mb-2"
                htmlFor="corona"
              >
                코로나
              </label>

              <input
                value="소아"
                type="radio"
                onChange={handleClick}
                className="btn-check"
                name="symptom"
                id="infant"
                autoComplete="off"
              />
              <label
                className="btn btn-primary text-white me-2 mb-2"
                htmlFor="infant"
              >
                소아
              </label>

              <input
                value="피부"
                type="radio"
                onChange={handleClick}
                className="btn-check"
                name="symptom"
                id="skin"
                autoComplete="off"
              />
              <label
                className="btn btn-primary text-white me-2 mb-2"
                htmlFor="skin"
              >
                피부
              </label>
              <input
                value="감기/호흡기"
                type="radio"
                onChange={handleClick}
                className="btn-check"
                name="symptom"
                id="cold"
                autoComplete="off"
              />
              <label
                className="btn btn-primary text-white me-2 mb-2"
                htmlFor="cold"
              >
                감기/호흡기
              </label>

              <input
                value="정신"
                type="radio"
                onChange={handleClick}
                className="btn-check"
                name="symptom"
                id="mental"
                autoComplete="off"
              />
              <label
                className="btn btn-primary text-white me-2 mb-2"
                htmlFor="mental"
              >
                정신
              </label>

              <input
                value="치아"
                type="radio"
                onChange={handleClick}
                className="btn-check"
                name="symptom"
                id="teeth"
                autoComplete="off"
              />
              <label
                className="btn btn-primary text-white me-2 mb-2"
                htmlFor="teeth"
              >
                치아
              </label>

              <input
                value="외과"
                type="radio"
                onChange={handleClick}
                className="btn-check"
                name="symptom"
                id="out"
                autoComplete="off"
              />
              <label
                className="btn btn-primary text-white me-2 mb-2"
                htmlFor="out"
              >
                외과
              </label>

              <input
                value="고혈압"
                type="radio"
                onChange={handleClick}
                className="btn-check"
                name="symptom"
                id="high"
                autoComplete="off"
              />
              <label
                className="btn btn-primary text-white me-2 mb-2"
                htmlFor="high"
              >
                고혈압
              </label>

              <input
                value="기타"
                type="radio"
                onChange={handleClick}
                className="btn-check"
                name="symptom"
                id="etc"
                autoComplete="off"
              />
              <label
                className="btn btn-primary text-white me-2 mb-2"
                htmlFor="etc"
              >
                기타
              </label>
            </div>
            <br />
            <div className="mb-3">
              <label
                htmlFor="exampleFormControlTextarea1"
                className="form-label small"
              >
                <strong>증상을 상세히 입력해주세요</strong>
              </label>
              <textarea
                onChange={handleClick}
                className="form-control"
                name="symptomComm"
                id="exampleFormControlTextarea1"
                rows="3"
              ></textarea>
            </div>
          </div>

          <hr />
          <div className="card-body ">
            <div className="custom-control custom-checkbox text-center ">
              <input
                type="checkbox"
                className="custom-control-input"
                id="aggrement"
                required
              />
              <label className="custom-control-label" htmlFor="aggrement">
                예약 접수 후 30분 이내 연락이 옵니다.
              </label>
            </div>
          </div>

          <button
            className="btn btn-lg btn-primary mt-3 mb-3"
            onClick={reserveClick}
          >
            예약접수
          </button>
        </div>
      </div>
    </div>
  );
};

export default Reservation;
