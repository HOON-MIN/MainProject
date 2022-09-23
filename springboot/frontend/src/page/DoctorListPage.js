import React, { useState, useEffect } from "react";
import "../css/hospitalList.css";

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
    </div>
  );
};
export default DoctorListPage;
