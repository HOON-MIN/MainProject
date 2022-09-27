import React, { useState } from "react";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";
import Container from "react-bootstrap/Container";
import "../css/header.css";
import logo from "../img/logo.png";
import { Link } from "react-router-dom";
import LoginModal from "../modals/LoginModal";
import SignupModals from "../modals/SignupModals";

function Header() {
  const [loginModalOn, setLoginModalOn] = useState(false);
  const [signupModalOn, setSignupModalOn] = useState(false);
  return (
    <>
      <LoginModal show={loginModalOn} onHide={() => setLoginModalOn(false)} />
      <SignupModals
        show={signupModalOn}
        onHide={() => setSignupModalOn(false)}
      />
      <Navbar variant="dark" className="header">
        <Container>
          <Navbar.Brand as={Link} to="/">
            <img src={logo} height="80" className="d-inline-block align-top" />
          </Navbar.Brand>
          <Navbar variant="dark">
            <Nav className="me-auto">
              <Nav.Link
                className="text-white hnav"
                onClick={() => setLoginModalOn(true)}
              >
                Login
              </Nav.Link>
              <Nav.Link
                href="#features"
                className="text-white hnav"
                onClick={() => setSignupModalOn(true)}
              >
                Signup
              </Nav.Link>
            </Nav>
          </Navbar>
        </Container>
      </Navbar>
    </>
  );
}
export default Header;
