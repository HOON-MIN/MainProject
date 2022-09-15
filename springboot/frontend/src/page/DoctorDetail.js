import React from "react";
import DoctorDetailImg from "../img/doctor_detail.png";
import "../css/doctorDetail.css";

const DoctorDetail = () => {
  return (
    <div className="body container detailbody">
      <div className="d-flex flex-column align-items-center p">
        <div className="text-center">
          <img src={DoctorDetailImg} className="detailImg" alt="..." />
        </div>

        <div className="card detailCard border-0 p-2">
          <div className="card-body ">
            <div className="detailStatus">
              <strong>현재 진료가능</strong>
            </div>
            <h5 className="card-title">
              <strong>김길동 의사</strong>
            </h5>
            <span className="detail-card-text">김길동 만능병원　 | </span>
            <span className="detail-card-text">
              　리뷰 : 1,045 <i class="bi bi-chevron-double-right"></i>
            </span>
            <div className="mt-2 d-flex flex-start">
              <button className="btn btn-primary me-1 disabled" type="button">
                내과
              </button>
              <button className="btn btn-primary me-1 disabled" type="button">
                이비인후과
              </button>
              <button className="btn btn-primary me-1 disabled" type="button">
                가정의학과
              </button>
              <button className="btn btn-primary me-1 disabled" type="button">
                소아청소년과
              </button>
            </div>
          </div>
          <div class="card-body border-top border-bottom ">
            <p>
              <strong>진료시간　</strong>09:00 ~ 20:00
            </p>
            <p>
              <strong>점심시간　</strong>13:00 ~ 14:00
            </p>
          </div>

          <div className="card-body border-bottom">
            <p>
              <strong>진료과목　</strong>내과, 가정의학과, 소아청소년과,
              이비인후과
            </p>
            <p>
              <strong>약력　　　</strong>가정의학과 전문의 이비인후과
            </p>
          </div>
          <div className="card-body border-bottom">
            <h6>
              <strong>의사소개</strong>
            </h6>
            <div className="card-text">
              안녕하세요 의사 김길동입니다.
              <br /> 친절하고 꼼꼼하게 진료하겠습니다. <br />
              *다이어트 포함 비급여 항목 확인해주세요
            </div>
          </div>
          <div className="card-body border-bottom">
            <h6>
              <strong>병원위치</strong>
            </h6>
            <div className="card-text">서울 서초구 강남대로 53길 12 601호</div>
            <div className="detailMap"></div>
          </div>
        </div>
        <div className="card detailCard border-0 p-2 mt-5">
          <div className="card-body ">
            <h5>리뷰 점수 1000 개</h5>
          </div>
        </div>
      </div>
    </div>
  );
};

export default DoctorDetail;
