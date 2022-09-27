import React from "react";
import { Route, useLocation, Navigate } from "react-router-dom";

function AuthRoute({ authenticated, component: Component, render, ...rest }) {
  const location = useLocation();
  return (
    <Route
      {...rest}
      render={(props) =>
        authenticated ? (
          render ? (
            render(props)
          ) : (
            <Component {...props} />
          )
        ) : (
          <Navigate
            to={{ pathname: "/login", state: { from: props.location } }}
          />
        )
      }
    />
  );
}

export default AuthRoute;
