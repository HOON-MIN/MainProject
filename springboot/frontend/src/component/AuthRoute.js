import React from "react";
import { Navigate } from "react-router-dom";

function AuthRoute({ authenticated, component: Component }) {
  return authenticated ? (
    Component
  ) : (
    <Navigate to="/" {...alert("로그인 후 이용하세요")} />
  );
}

export default AuthRoute;
