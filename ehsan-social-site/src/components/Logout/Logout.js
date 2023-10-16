import React, { useEffect } from "react";
import { Navigate } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";

function Logout() {
  // logout dispatch
  const isAuthenticated = useSelector((state) => state.auth.isAuthenticated);
  const dispatch = useDispatch();

  // useEffect(() => {
  //   dispatch();
  // }, []);

  if (!isAuthenticated) {
    return <Navigate to="/login" replace={true} />;
  }

  return "not working";
}

export default Logout;
