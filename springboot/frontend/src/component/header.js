import React from "react";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";
import Button from "react-bootstrap/Button";
import Container from "react-bootstrap/Container";
import "./css/header.css";
import logo from "../logo.svg";

function Header() {
  return (
    <Navbar variant="dark" className="header">
      <Container>
        <Navbar.Brand href="#home">
          <img
            src={logo}
            width="30"
            height="30"
            className="d-inline-block align-top"
          />
          React Bootstrap
        </Navbar.Brand>
        <Navbar variant="dark">
          <Nav className="me-auto">
            <Nav.Link href="#home" className="text-white hnav">
              Login
            </Nav.Link>
            <Nav.Link href="#features" className="text-white hnav">
              Join
            </Nav.Link>

            <a
              href="http://192.168.0.98:83/"
              className="btn text-white"
              target="_blank"
              rel="noreferrer"
            >
              병원/약국 관리자
            </a>
          </Nav>
        </Navbar>
      </Container>
    </Navbar>
  );
}
export default Header;
