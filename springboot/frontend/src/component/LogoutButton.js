import React from "react";
import { useNavigate, withRouter } from "react-router-dom";
import Nav from "react-bootstrap/Nav";

function LogoutButton({ logout }) {
  const navigate = useNavigate();
  const handleClick = () => {
    logout();
    navigate("/");
  };

  return (
    <Nav.Link onClick={handleClick} className="text-white hnav">
      Logout
    </Nav.Link>
  );
}

export default LogoutButton;
