import React from "react";
import { useNavigate, withRouter } from "react-router-dom";

function LogoutButton({ logout }) {
  const navigate = useNavigate();
  const handleClick = () => {
    logout();
    navigate("/");
  };

  return (
    <button className="btn text-white border" onClick={handleClick}>
      Logout
    </button>
  );
}

export default LogoutButton;
