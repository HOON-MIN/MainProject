import React, { useEffect, useRef } from "react";
import "./App.css";
import Header from "./component/header";
import UserList from "./component/UserList";
import Carousel from "react-bootstrap/Carousel";
import mockup from "./img/main2.png";
import mainImg from "./img/main0.png";

function App() {
  const outerDivRef = useRef();
  useEffect(() => {
    document.getElementById("app")?.scrollTo(0, 0); // 첫 렌더시 스크롤이 최상단 고정된다
  }, []);

  useEffect(() => {
    const wheelHandler = (e) => {
      e.preventDefault();
      const { deltaY } = e;
      const { scrollTop } = outerDivRef.current; // 스크롤 위쪽 끝부분 위치
      const pageHeight = window.innerHeight; // 화면 세로길이, 100vh와 같습니다.

      if (deltaY > 0) {
        // 스크롤 내릴 때
        if (scrollTop >= 0 && scrollTop < pageHeight) {
          //현재 1페이지
          console.log("현재 1페이지, down");
          outerDivRef.current.scrollTo({
            top: pageHeight,
            left: 0,
            behavior: "smooth",
          });
        } else if (scrollTop >= pageHeight && scrollTop < pageHeight * 2) {
          //현재 2페이지
          console.log("현재 2페이지, down");
          outerDivRef.current.scrollTo({
            top: pageHeight * 2,
            left: 0,
            behavior: "smooth",
          });
        } else {
          // 현재 3페이지
          console.log("현재 3페이지, down");
          outerDivRef.current.scrollTo({
            top: pageHeight * 2,
            left: 0,
            behavior: "smooth",
          });
        }
      } else {
        // 스크롤 올릴 때
        if (scrollTop >= 0 && scrollTop < pageHeight) {
          //현재 1페이지
          console.log("현재 1페이지, up");
          outerDivRef.current.scrollTo({
            top: 0,
            left: 0,
            behavior: "smooth",
          });
        } else if (scrollTop >= pageHeight && scrollTop < pageHeight * 2) {
          //현재 2페이지
          console.log("현재 2페이지, up");
          outerDivRef.current.scrollTo({
            top: 0,
            left: 0,
            behavior: "smooth",
          });
        } else {
          // 현재 3페이지
          console.log("현재 3페이지, up");
          outerDivRef.current.scrollTo({
            top: pageHeight,
            left: 0,
            behavior: "smooth",
          });
        }
      }
    };
    const outerDivRefCurrent = outerDivRef.current;
    outerDivRefCurrent.addEventListener("wheel", wheelHandler);
    return () => {
      outerDivRefCurrent.removeEventListener("wheel", wheelHandler);
    };
  }, []);

  return (
    <div ref={outerDivRef} className="outer">
      <Header />
      <div className="inner bg-blue">
        <div className="innerImg">
          <img src={mainImg} className="mainImg" />
        </div>
        <div className="text">
          <h2>HeyDr. SpringBoot</h2>
          <br></br>
          <span>
            많은 기능은 스프링부트로 구현 하였습니다.
            <br />밑 쪽 버튼을 통해 이동 할 수 있습니다.
          </span>
          <br></br>
          <button className="btn2">Go to SpringBoot</button>
        </div>
      </div>
      <div className="inner bg-blue">
        <div className="innerImg">
          <img src={mockup} className="menuImg" />
        </div>
        <div className="button2">
          <button type="button" className="btn3">
            App Store
          </button>
          <button type="button" className=" btn3">
            Google Play
          </button>
        </div>
      </div>
      <div className="inner bg-pink">3</div>
    </div>
  );
}
export default App;
