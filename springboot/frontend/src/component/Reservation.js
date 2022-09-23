import React from "react";
import "../css/reservation.css";
import DatePicker, { registerLocale, setDefaultLocale } from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import { ko } from "date-fns/esm/locale";

const Reservation = () => {
  const dateToday = () => {
    let today = new Date();
    let month = today.getMonth() + 1; // 월
    let date = today.getDate(); // 날짜
    let year = today.getFullYear(); // 요일
    const res = year + "-" + month + "-" + date;
    console.log(res, typeof res);
  };
  dateToday();

  const dateTomorrow = () => {
    let today = new Date();
    let month = today.getMonth() + 1; // 월
    let date = today.getDate() + 1; // 날짜
    let year = today.getFullYear(); // 요일
    const res = year + "-" + month + "-" + date;
    console.log(res, typeof res);
  };
  dateTomorrow();

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
              autoComplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option1"
            >
              고혈압
            </label>

            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option2"
              autoComplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option2"
            >
              코로나
            </label>

            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option3"
              autoComplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option3"
            >
              소아
            </label>

            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option4"
              autoComplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option4"
            >
              감기/호흡기
            </label>
            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option4"
              autoComplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option4"
            >
              피부
            </label>
            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option4"
              autoComplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option4"
            >
              다이어트
            </label>
            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option5"
              autoComplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option5"
            >
              다이어트
            </label>
            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option5"
              autoComplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option5"
            >
              정신
            </label>
            <input
              type="radio"
              className="btn-check"
              name="options"
              id="option5"
              autoComplete="off"
            />
            <label
              className="btn btn-primary text-white me-2 mb-2"
              for="option5"
            >
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
              className="form-control"
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

        <button className="btn btn-lg btn-primary mt-3 mb-3">예약접수</button>
      </div>
    </div>
  );
};

export default Reservation;
