import React, { useState, useEffect, useRef, useCallback } from "react";
import "../css/hospitalList.css";

import { Link } from "react-router-dom";
import axios from "axios";
import DoctorList from "../component/DoctorList";
import Nav from "react-bootstrap/Nav";
import Loader from "../component/Loader";

const DoctorListPage = () => {
  const [doctors, setDoctors] = useState([]);
  const [loading, setLoading] = useState(false);
  const [categories, setCategories] = useState([]);
  const [selectCategory, setSelectCategory] = useState([]);
  const [select, setSelect] = useState();

  const [List, setList] = useState([]); //Post List
  const [page, setPage] = useState(1);
  const preventRef = useRef(true); //중복 실행 방지
  const obsRef = useRef(null); //observer Element
  const endRef = useRef(false); //모든 글 로드 확인

  useEffect(() => {
    if (page !== 1) getPost();
  }, [page]);

  useEffect(() => {
    //옵저버 생성
    const observer = new IntersectionObserver(obsHandler, { threshold: 0.5 });
    if (obsRef.current) observer.observe(obsRef.current);
    return () => {
      observer.disconnect();
    };
  }, []);

  useEffect(() => {
    getPost();
  }, [page]);

  const obsHandler = (entries) => {
    //옵저버 콜백함수
    const target = entries[0];
    if (!endRef.current && target.isIntersecting && preventRef.current) {
      //옵저버 중복 실행 방지
      preventRef.current = false; //옵저버 중복 실행 방지
      setPage((prev) => prev + 1); //페이지 값 증가
    }
  };

  const getPost = useCallback(async () => {
    //글 불러오기
    setLoading(true); //로딩 시작

    const res = await axios({
      method: "GET",
      url: `/doctorListReact?cPage=${page}`,
    });
    if (res.data) {
      console.log(res.data);
      setList((prev) => [...prev, ...res.data]); //리스트 배열에 추가
      preventRef.current = true;
      console.log(page);
    } else {
      console.log(res);
    }
    setLoading(false); //로딩 종료
  }, [page]);

  //의사 리스트 출력
  useEffect(() => {
    const getDoctorList = () => {
      axios.get("/doctor/dlist").then((res) => {
        setDoctors(res.data);
      });
    };
    setLoading(false);
    getDoctorList();
  }, []);

  //카테고리 리스트
  console.log("useeffect", select);
  useEffect(() => {
    const getCategory = () => {
      axios.get("/doctor/dcategory?dmajor=" + select).then((res) => {
        setSelectCategory(res.data);
      });
    };
    setLoading(false);
    getCategory();
  }, [select]);

  //왠지 모르겠지만... 계속 4번 담겨서 다시 리팩토링..
  //중복 다시 제거 후 내비에 출력
  const test = [];
  doctors &&
    doctors.map((majors) => {
      test.push(majors.dmajor);
    });
  //카테고리 중복값 제거
  const uniqueTest = test.filter(
    (category, index) => test.indexOf(category) === index
  );

  uniqueTest.map((name, index) => {
    categories.push({
      cid: index,
      cname: name,
    });
  });

  //정제한 카테고리 내비 출력
  const Categories = () => {
    const refCategory = [];
    categories.map((category) => {
      refCategory.push(category.cname);
    });

    const resCategory = refCategory.filter(
      (number, index) => refCategory.indexOf(number) === index
    );
    return (
      <Nav
        fills
        variant="pills"
        defaultActiveKey="dlist"
        className="justify-content-center"
      >
        <Nav.Item>
          <Nav.Link
            eventKey="dlist"
            key="모든진료과"
            active={select === undefined}
            onClick={() => setSelect(undefined)}
          >
            모든진료과
          </Nav.Link>
        </Nav.Item>
        {resCategory.map((e, index) => (
          <Nav.Item>
            <Nav.Link
              key={e}
              eventKey={index}
              active={select === e}
              onClick={() => setSelect(e)}
            >
              {e}
            </Nav.Link>
          </Nav.Item>
        ))}
      </Nav>
    );
  };

  return (
    <div className="body container-fluid page">
      <div className="body-inner text-center">
        <Categories />
      </div>
      {select === undefined
        ? List.map((doctor) => (
            <Link
              to={"/detail/" + doctor.dnum}
              style={{ textDecoration: "none" }}
            >
              <DoctorList key={doctor.dnum} doctor={doctor} />
            </Link>
          ))
        : selectCategory.map((doctor) => (
            <Link
              to={"/detail/" + doctor.dnum}
              style={{ textDecoration: "none" }}
            >
              <DoctorList key={doctor.dnum} doctor={doctor} />
            </Link>
          ))}

      <div ref={obsRef} className="Target-Element">
        {loading && <Loader />}
      </div>
    </div>
  );
};
export default DoctorListPage;
