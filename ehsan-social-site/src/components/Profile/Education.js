import React from "react";
import { useOutletContext } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import "tippy.js/dist/tippy.css";

import Privacy from "./Privacy";

import "./Profile.css";

const Education = () => {
  const { consumer } = useOutletContext();

  return (
    <div>
      {/* title  */}
      <div className="d-flex justify-content-between align-iteams-center py-3 user-profile-content-title">
        <div className="d-flex ms-3 align-items-center">
          <FontAwesomeIcon
            icon={["fas", "user-graduate"]}
            className="me-2 user-profile-content-title-icon"
          />
          <h2>Educational Qualification</h2>
        </div>

        <div className="me-3">
          <button className="btn user-profile-content-title-button">
            <FontAwesomeIcon icon={["fas", "pen"]} />
            <span className="ms-2">Edit Education</span>
          </button>
        </div>
      </div>

      {/* content */}
      <div className="row mx-1 mt-3">
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Primary School and Session</b> :{" "}
            {consumer.primary_name_and_session}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>High School and Session</b> :{" "}
            {consumer.highschool_name_and_session}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>College Name and Session</b> :{" "}
            {consumer.college_name_and_session}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>University and Session</b>:{" "}
            {consumer.unicersity_name_and_session}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>PSD Name and Session</b> : {consumer.psd_name_and_session}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
      </div>
    </div>
  );
};
export default Education;
