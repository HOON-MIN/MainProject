import React from "react";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";
import Container from "react-bootstrap/Container";
import "../css/header.css";
import logo from "../img/logo.png";
import { Link, useLocation } from "react-router-dom";
import LogoutButton from "./LogoutButton";

function Header({ authenticated, logout }) {
  console.log(authenticated);
  const location = useLocation();
  return (
    <>
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
                <Nav>
                  <Link to="/login" className="nav text-white hnav">
                    Login
                  </Link>
                </Nav>
              )}
            </Nav>
          </Navbar>
        </Container>
      </Navbar>
    </>
  );
}
export default Header;
