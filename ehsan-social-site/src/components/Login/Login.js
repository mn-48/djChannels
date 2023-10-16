import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React, { useState, useEffect } from "react";
import { useForm } from "react-hook-form";
import { Link, Navigate } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import { loginAsyncAction } from "../../store/slices/loginSlice";
import { loadUser } from "../../store/actions/auth";

import "./Login.css";

const Login = () => {
  const authenticated = useSelector((state) => state.login);
  const dispatch = useDispatch();

  const user = useSelector((state) => state.auth.user);

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm();

  const [loadingButton, setloadingButton] = useState(false);

  // login submit handler
  const onSubmit = (data) => {
    dispatch(loginAsyncAction(data));
  };

  useEffect(() => {
    setloadingButton(false);
  }, []);

  if (
    authenticated.authenticatedData.access ||
    localStorage.wess_access_token
  ) {
    dispatch(loadUser());
    return <Navigate to="/" replace={true} />;
  }

  return (
    <div className="loginArea ">
      <div className="container ">
        <div className="row d-flex justify-content-between">
          {/* Greetings Area */}
          <div className="greetings col-lg-6 col-sm-12 col-xs-12">
            <h1>
              <FontAwesomeIcon icon={["fas", "users"]} />
              <span>
                World Ehsan <small>Social Site</small>
              </span>
            </h1>
            <p>
              Welcome, to
              <strong>
                World Ehsan <small>Social Site</small>
              </strong>
              . We helps you connect and share with the people in your life
            </p>
          </div>
          {/* Form Area */}

          <div
            className="loginForm col-lg-4 col-sm-12 col-xs-12 shadow p-3 mb-5 bg-body rounded"
            id="login_error_message_in_login_page"
          >
            <div className="d-flex align-items-center">
              <h2 className="me-2">Log in</h2>
              {loadingButton ? (
                <FontAwesomeIcon
                  icon={["fas", "spinner"]}
                  className="fa-spin loading-icon-color"
                />
              ) : (
                ""
              )}
            </div>

            <form onSubmit={handleSubmit(onSubmit)}>
              {/* Email/CIN  */}
              <div className="form-group">
                <div className="input-group">
                  <span className="input-group-text" id="basic-addon1">
                    <FontAwesomeIcon icon={["fas", "envelope"]} />
                  </span>
                  <input
                    className="form-control"
                    type="text"
                    placeholder="Email/CIN"
                    {...register("username", { required: true })}
                  />
                </div>
                {errors.emailCin && (
                  <p className="text-danger">Email/CIN is required</p>
                )}
              </div>

              {/* Password  */}
              <div className="form-group">
                <div className="input-group">
                  <span className="input-group-text" id="basic-addon1">
                    <FontAwesomeIcon icon={["fas", "lock"]} />
                  </span>
                  <input
                    className="form-control"
                    type="password"
                    placeholder="Password"
                    {...register("password", { required: true })}
                  />
                </div>
                {errors.password && (
                  <p className="text-danger">Password is required</p>
                )}
              </div>

              {/* Password  */}
              <button type="submit" className="form-control btn btn-lg ">
                <FontAwesomeIcon icon={["fas", "unlock"]} />
                Log in
              </button>
            </form>
            <Link to="/forgot">Forgot Password?</Link>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Login;
