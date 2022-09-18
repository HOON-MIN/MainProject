import React from "react";
import "../css/reservation.css";

const Reservation = () => {
  return (
    <div className="container reservation">
      <form>
        <div className="mb-3">
          <label for="exampleFormControlInput1" className="form-label g-3">
            성함
          </label>
          <input
            type="text"
            class="form-control"
            id="exampleFormControlInput1"
          />
        </div>

        <div className="mb-3">
          <label for="exampleFormControlInput1" className="form-label">
            주민등록번호
          </label>
          <div className="input-group">
            <input
              type="text"
              class="form-control"
              placeholder="주민번호 앞 6자리"
            />
            <span class="input-group-text">-</span>
            <input
              type="password"
              class="form-control"
              placeholder="주민번호 뒤 7자리"
            />
          </div>
        </div>
        <div class="input-group mb-3"></div>

        <div className="mb-3 symptom">
          <label for="" className="form-label">
            증상 선택
          </label>
          <div className="form-check">
            <input
              type="checkbox"
              class="btn-check"
              id="corona"
              autocomplete="off"
            />
            <label class="btn btn-sm btn-outline-primary" for="corona">
              코로나
            </label>

            <input
              type="checkbox"
              class="btn-check"
              id="high"
              autocomplete="off"
            />
            <label class="btn btn-sm btn-outline-primary" for="high">
              고혈압/고지혈증/당뇨
            </label>

            <input
              type="checkbox"
              class="btn-check"
              id="child"
              autocomplete="off"
            />
            <label class="btn btn-sm btn-outline-primary" for="child">
              소아
            </label>

            <input
              type="checkbox"
              class="btn-check"
              id="cold"
              autocomplete="off"
            />
            <label class="btn btn-sm btn-outline-primary" for="cold">
              감기/호흡기
            </label>

            <input
              type="checkbox"
              class="btn-check"
              id="skin"
              autocomplete="off"
            />
            <label class="btn btn-sm btn-outline-primary" for="skin">
              피부
            </label>

            <input
              type="checkbox"
              class="btn-check"
              id="diet"
              autocomplete="off"
            />
            <label class="btn btn-sm btn-outline-primary" for="diet">
              다이어트
            </label>

            <input
              type="checkbox"
              class="btn-check"
              id="woman"
              autocomplete="off"
            />
            <label class="btn btn-sm btn-outline-primary" for="woman">
              여성
            </label>

            <input
              type="checkbox"
              class="btn-check"
              id="man"
              autocomplete="off"
            />
            <label class="btn btn-sm btn-outline-primary" for="man">
              남성
            </label>

            <input
              type="checkbox"
              class="btn-check"
              id="hair"
              autocomplete="off"
            />
            <label class="btn btn-sm btn-outline-primary" for="hair">
              탈모
            </label>
          </div>
        </div>

        <div class="mb-3">
          <label for="exampleFormControlTextarea1" class="form-label">
            증상 입력
          </label>
          <textarea
            class="form-control"
            id="exampleFormControlTextarea1"
            rows="3"
          ></textarea>
        </div>
        <div className="text-center">
          <button type="submit" class="btn btn-lg btn-primary mt-3 ps-3 pe-3 ">
            접수완료
          </button>
        </div>
      </form>
    </div>
  );
};

export default Reservation;
