import React, { useState } from "react";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";
import Container from "react-bootstrap/Container";
import "../css/header.css";
import logo from "../img/logo.png";
import { Link, useNavigate } from "react-router-dom";
import LoginModal from "../modals/LoginModal";

function Header() {
  const navigate = useNavigate();
  const [loginModalOn, setLoginModalOn] = useState(false);
  console.log("헤더", localStorage);
  const username = localStorage.name;
  console.log("이름", username);

  const logout = () => {
    localStorage.clear();
    alert("로그아웃 하셨습니다");
    navigate("/");
  };
  return (
    <>
      <LoginModal show={loginModalOn} onHide={() => setLoginModalOn(false)} />
      <Navbar variant="dark" className="header">
        <Container>
          <Navbar.Brand as={Link} to="/">
            <img src={logo} height="80" className="d-inline-block align-top" />
          </Navbar.Brand>
          <Navbar variant="dark">
            <Nav className="me-auto">
              {username === undefined ? (
                <Nav.Link
                  className="text-white hnav"
                  onClick={() => setLoginModalOn(true)}
                >
                  Login
                </Nav.Link>
              ) : (
                <Navbar.Collapse className="justify-content-end">
                  <Navbar.Text>{username}님 반갑습니다</Navbar.Text>
                  <Nav.Link className="text-white hnav" onClick={logout}>
                    Logout
                  </Nav.Link>
                </Navbar.Collapse>
              )}
            </Nav>
          </Navbar>
        </Container>
      </Navbar>
    </>
  );
}
export default Header;
