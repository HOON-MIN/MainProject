import React, { useState } from "react";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";
import Container from "react-bootstrap/Container";
import LogoutButton from "./component/LogoutButton";
import { Link, useNavigate, Navigate } from "react-router-dom";
import { Routes, Route } from "react-router-dom";
import { SignIn } from "./auth";
import "./App.css";
import Modal from "react-bootstrap/Modal";
import logo from "./img/logo.png";
import "./css/loginModal.css";
import Mainpage from "./page/Mainpage";
import DoctorListPage from "./page/DoctorListPage";
import DoctorDetailPage from "./page/DoctorDetailPage";
import ReservationPage from "./page/ReservationPage";
import AuthRoute from "./component/AuthRoute";
import DeliveryForm from "./component/DeliveryForm";

function App() {
  const navigate = useNavigate();

  // 모달
  const [modalShow, setModalShow] = React.useState(false);
  const handleClose = () => setModalShow(false);
  const handleShow = () => setModalShow(true);
  //////

  // 로그인
  const [user, setUser] = useState();
  const [msg, setMsg] = useState();
  const authenticated = user !== undefined;
  const login = ({ id, pwd }) => setUser(SignIn({ id, pwd }));
  const logout = () => {
    setUser(null);
    localStorage.clear();
    alert("로그아웃 하셨습니다");
  };
  ///////

  function LoginForm() {
    const [id, setId] = useState("");
    const [pwd, setPwd] = useState("");
    const handleClick = () => {
      try {
        login({ id, pwd });
        alert("로그인 되었습니다.");
        setModalShow(false);
        navigate("/dlist");
      } catch (e) {
        alert("로그인 정보가 다릅니다");
        setId("");
        setPwd("");
      }
    };
    return (
      <Modal
        size="lg"
        aria-labelledby="contained-modal-title-vcenter"
        centered
        show={modalShow}
        onHide={handleClose}
      >
        <Modal.Header closeButton>
          <Modal.Title id="contained-modal-title-vcenter">로그인</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <div className="container loginContainer">
            <div className="text-center">
              <img
                src={logo}
                height="80"
                className="d-inline-block align-top"
                alt="로고"
              />
            </div>
            <div className="mb-3">
              <label className="form-label">아이디</label>
              <input
                className="form-control"
                value={id}
                onChange={({ target: { value } }) => setId(value)}
                type="text"
              />
            </div>
            <div className="mb-3">
              <label className="form-label">비밀번호</label>
              <input
                className="form-control"
                value={pwd}
                onChange={({ target: { value } }) => setPwd(value)}
                type="password"
              />
            </div>
            <div className="mb-3 button">
              <button
                className="btn btn-outline-dark btn-sm"
                onClick={handleClick}
              >
                로그인
              </button>
            </div>

            <div className="links mt-4">
              <a href="http://localhost:83/company/joinChoice">
                아직 회원가입 안되셨나요?
              </a>
            </div>
          </div>
        </Modal.Body>
      </Modal>
    );
  }

  return (
    <div>
      {/* 모달창 함수 */}
      <LoginForm show={modalShow} onHide={() => setModalShow(false)} />
      {/* 헤더  */}
      <Navbar variant="dark" className="header">
        <Container>
          <Navbar.Brand as={Link} to="/">
            HeyDr.
          </Navbar.Brand>
          <Navbar variant="dark">
            <Nav className="me-auto">
              {/* 인증값 여부로 로그인 로그아웃 */}
              {localStorage.getItem("name") == undefined && authenticated ? (
                <LogoutButton logout={logout} />
              ) : (
                <button className="btn text-white border" onClick={handleShow}>
                  Login
                </button>
              )}
            </Nav>
          </Navbar>
        </Container>
      </Navbar>
      <Routes>
        <Route path="/" element={<Mainpage />} />
        {
          // Router v6 AuthRoute 로그인 여부로 페이지 제한
          <Route
            path="/dlist"
            element={
              <AuthRoute
                authenticated={authenticated}
                component={<DoctorListPage />}
              />
            }
          />
        }
        <Route path="/detail/:dnum" element={<DoctorDetailPage />} />
        <Route path="reservation/:dnum" element={<ReservationPage />} />
        <Route path="/" element={<ReservationPage />} />
        <Route path="/drug" element={<DeliveryForm />}></Route>
      </Routes>
    </div>
  );
}
export default App;
