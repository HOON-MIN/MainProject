import React, { useState, useEffect, useRef, useCallback } from "react";
import "../css/hospitalList.css";
import { useDispatch } from "react-redux";
import { Link } from "react-router-dom";
import axios from "axios";
import DoctorList from "../component/DoctorList";
import Nav from "react-bootstrap/Nav";

const DoctorListPage = () => {
  const [loading, setLoading] = useState(false);
  const [categories, setCategories] = useState([]);
  const [selectCategory, setSelectCategory] = useState([]);
  const [select, setSelect] = useState();

  const [doctors, setDoctors] = useState([]);
  const [target, setTarget] = useState(null);
  const [isLoaded, setIsLoaded] = useState(false);

  const [page, setPage] = useState(1); //페이지
  const limit = 10; // posts가 보일 최대한의 갯수
  const offset = (page - 1) * limit; // 시작점과 끝점을 구하는 offset

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
  console.log(doctors);

  // //10개씩
  // const doctorsListData = (doctorList) => {
  //   if (doctorList) {
  //     let result = doctorList.slice(offset, offset + limit);
  //     setPage(page+1);
  //     return result;
  //   }
  // };

  // const getMoreItem = async () => {
  //   setIsLoaded(true);
  //   await new Promise((resolve) => setTimeout(resolve, 1500));
  //   const items = doctorsListData(doctors);
  //   setItemLists((itemLists) => itemLists.concat(items));
  //   setIsLoaded(false);
  // };

  // const onIntersect = async ([entry], observer) => {
  //   if (entry.isIntersecting && !isLoaded) {
  //     observer.unobserve(entry.target);
  //     await getMoreItem();
  //     observer.observe(entry.target);
  //   }
  // };

  // useEffect(() => {
  //   let observer;
  //   if (target) {
  //     observer = new IntersectionObserver(onIntersect, {
  //       threshold: 0.4,
  //     });
  //     observer.observe(target);
  //   }
  //   return () => observer && observer.disconnect();
  // }, [target  ]);

  //진료 과목별(카테고리) 리스트 출력
  useEffect(() => {
    const getCategory = () => {
      axios.get("/doctor/dcategory?dmajor=" + select).then((res) => {
        setSelectCategory(res.data);
      });
    };
    setLoading(false);
    getCategory();
  }, [select]);

  //카테고리
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
    <div className="body container-fluid page">
      <div className="body-inner text-center">
        <Categories />
      </div>
      {select === undefined
        ? doctors.map((doctor) => {
            <Link
              to={"/detail/" + doctor.dnum}
              style={{ textDecoration: "none" }}
            >
              <DoctorList doctor={doctor} key={doctor.num} />;
            </Link>;
          })
        : selectCategory.map((doctor) => (
            <Link
              to={"/detail/" + doctor.dnum}
              style={{ textDecoration: "none" }}
            >
              <DoctorList key={doctor.dnum} doctor={doctor} />
            </Link>
          ))}
      <div ref={setTarget} className="Target-Element">
        {/* {isLoaded && <Loader />} */}
      </div>
    </div>
  );
};
export default DoctorListPage;
