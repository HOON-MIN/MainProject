import React from "react";
import "../css/mainpage.css";

import { Link } from "react-router-dom";
import handImg from "../img/hand.png";

const Mainpage = () => {
  return (
    <div>
      <div className="inner">
        <div className="innerImg">
          <img src={handImg} className="mainImg" />
        </div>
        <div className="textMain3">
          <h2>비대면 진료 예약</h2>
          <br />
          <span>비대면 진료는 HeyDr.에서</span>
          <br />
          모바일 화면으로 진행이 가능합니다
          <br />
          <Link to="/dlist">
            <button className="btnMain3">예약 하기</button>
          </Link>
          <br></br>
          {localStorage.getItem("addr") == undefined ? null : (
            <Link to="/drug">
              <button className="btnMain3">약 배달 받기</button>
            </Link>
          )}
        </div>
      </div>
    </div>
  );
};

export default Mainpage;

// 원페이지 스크롤 구현 하였으나 메인 디자인 변경으로 주석처리
//
// useEffect(() => {
//   const wheelHandler = (e) => {
//     e.preventDefault();
//     const { deltaY } = e;
//     const { scrollTop } = outerDivRef.current; // 스크롤 위쪽 끝부분 위치
//     const pageHeight = window.innerHeight; // 화면 세로길이, 100vh와 같습니다.

//     if (deltaY > 0) {
//       // 스크롤 내릴 때
//       if (scrollTop >= 0 && scrollTop < pageHeight) {
//         //현재 1페이지
//         console.log("현재 1페이지, down");
//         outerDivRef.current.scrollTo({
//           top: pageHeight,
//           left: 0,
//           behavior: "smooth",
//         });
//       } else if (scrollTop >= pageHeight && scrollTop < pageHeight * 2) {
//         //현재 2페이지
//         console.log("현재 2페이지, down");
//         outerDivRef.current.scrollTo({
//           top: pageHeight * 2,
//           left: 0,
//           behavior: "smooth",
//         });
//       } else {
//         // 현재 3페이지
//         console.log("현재 3페이지, down");
//         outerDivRef.current.scrollTo({
//           top: pageHeight * 2,
//           left: 0,
//           behavior: "smooth",
//         });
//       }
//     } else {
//       // 스크롤 올릴 때
//       if (scrollTop >= 0 && scrollTop < pageHeight) {
//         //현재 1페이지
//         console.log("현재 1페이지, up");
//         outerDivRef.current.scrollTo({
//           top: 0,
//           left: 0,
//           behavior: "smooth",
//         });
//       } else if (scrollTop >= pageHeight && scrollTop < pageHeight * 2) {
//         //현재 2페이지
//         console.log("현재 2페이지, up");
//         outerDivRef.current.scrollTo({
//           top: 0,
//           left: 0,
//           behavior: "smooth",
//         });
//       } else {
//         // 현재 3페이지
//         console.log("현재 3페이지, up");
//         outerDivRef.current.scrollTo({
//           top: pageHeight,
//           left: 0,
//           behavior: "smooth",
//         });
//       }
//     }
//   };
//   const outerDivRefCurrent = outerDivRef.current;
//   outerDivRefCurrent.addEventListener("wheel", wheelHandler);
//   return () => {
//     outerDivRefCurrent.removeEventListener("wheel", wheelHandler);
//   };
// }, []);
