import React, { useState, useEffect, useCallback, useRef } from "react";
import "../css/hospitalList.css";
import drImg from "../img/doctor.png";

import { Link } from "react-router-dom";
import axios from "axios";
import DoctorList from "../component/DoctorList";
import Nav from "react-bootstrap/Nav";

const DoctorListPage = () => {
  const [doctors, setDoctors] = useState([]);
  const [loading, setLoading] = useState(false);
  const [categories, setCategories] = useState([]);
  const [selectCategory, setSelectCategory] = useState([]);
  const [select, setSelect] = useState();

  //전체 리스트 출력
  useEffect(() => {
    const getDoctorList = () => {
      axios.get("/doctor/dlist").then((res) => {
        setDoctors(res.data);
      });
    };
    setLoading(false);
    getDoctorList();
  }, []);

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

  const Categories = () => {
    //왠지 모르겠지만... 계속 4번 담겨서 다시 리팩토링..
    const refCategory = [];
    categories.map((category) => {
      refCategory.push(category.cname);
    });

    //중복 다시 제거..
    const resCategory = refCategory.filter(
      (number, index) => refCategory.indexOf(number) === index
    );

    return (
      <Nav fill variant="tabs" defaultActiveKey="dlist">
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

  //카테고리 배열 만들기
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

  return (
    <div className="body container">
      <div className="body-inner text-center">
        <h2 className="h2">의사 리스트</h2>
        <Categories />
      </div>
      {select === undefined
        ? doctors.map((doctor) => (
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
      ;
    </div>
  );
};
export default DoctorListPage;
