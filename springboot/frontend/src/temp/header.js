import React from "react";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";
import Button from "react-bootstrap/Button";
import Container from "react-bootstrap/Container";
import "../css/header.css";
import logo from "../img/logo.png";
import { Link, useLocation } from "react-router-dom";
import LogoutButton from "../component/LogoutButton";
import LoginForm from "./LoginForm";

function Header({ authenticated, logout, login }) {
  const location = useLocation();
  const [modalShow, setModalShow] = React.useState(false);
  return (
    <>
      <LoginForm
        show={modalShow}
        onHide={() => setModalShow(false)}
        authenticated={authenticated}
        login={login}
      />
      <Navbar variant="dark" className="header">
        <Container>
          <Navbar.Brand as={Link} to="/">
            <img src={logo} height="80" className="d-inline-block align-top" />
          </Navbar.Brand>
          <Navbar variant="dark">
            <Nav className="me-auto">
              {authenticated ? (
                <LogoutButton logout={logout} />
              ) : (
                <Button
                  className="btn text-white hnav"
                  onClick={() => setModalShow(true)}
                >
                  Login
                </Button>
              )}
            </Nav>
          </Navbar>
        </Container>
      </Navbar>
    </>
  );
}
export default Header;
