import React from "react";
import "../css/reservation.css";
import DatePicker, { registerLocale, setDefaultLocale } from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import { ko } from "date-fns/esm/locale";
import { useState } from "react";
import { useLocation } from "react-router-dom";

const Reservation = () => {
  const location = useLocation();
  console.log("헤이", location);
  const today = new Date();
  const month = today.getMonth() + 1; // 월
  const date = today.getDate(); // 날짜
  const year = today.getFullYear(); // 요일
  const hour = today.getHours();
  const minute = today.getMinutes() + 30;
  const dateToday = year + "-" + month + "-" + date;
  const time = today.setMinutes(today.getMinutes + 30);
  const newDateObj = moment(oldDateObj).add(30, "m").toDate();
  console.log("time", newDateObj);

  const [input, setInput] = useState({
    num: localStorage.getItem("num"),
    dnum: location.state.data,
    symptom: "",
    symptomComm: "",
    contactCheck: 0,
    rdate: dateToday,
    rtime: "",
  });

  const handleClick = (e) => {
    setInput({
      ...input,
      [e.target.name]: e.target.value,
    });
  };

  console.log(input);
  return (
    <div className="d-flex justify-content-center revPage p-3">
      <div className="card border-0 p-2">
        <div className="card-body ">
          <p className="h4 ps-2 mb-4">
            <strong>예약자 정보</strong>
          </p>
          <label for="num" className="form-label">
            예약자 성명 : {localStorage.getItem("id")}
          </label>
          <br />
          <label for="num" className="form-label mb-0">
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
              value="고혈압"
              type="radio"
              onChange={handleClick}
              className="btn-check"
              name="symptom"
              id="high"
              autoComplete="off"
            />
            <label className="btn btn-primary text-white me-2 mb-2" for="high">
              고혈압
            </label>

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
              for="corona"
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
              for="infant"
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
            <label className="btn btn-primary text-white me-2 mb-2" for="skin">
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
            <label className="btn btn-primary text-white me-2 mb-2" for="cold">
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
              for="mental"
            >
              정신
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
            <label className="btn btn-primary text-white me-2 mb-2" for="etc">
              기타
            </label>
          </div>
          <br />
          <div className="mb-3">
            <label
              for="exampleFormControlTextarea1"
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
            <label className="custom-control-label" for="aggrement">
              예약 접수 후 30분 이내 연락이 옵니다.
            </label>
          </div>
        </div>

        <button
          className="btn btn-lg btn-primary mt-3 mb-3"
          onClick={handleClick}
        >
          예약접수
        </button>
      </div>
    </div>
  );
};

export default Reservation;
