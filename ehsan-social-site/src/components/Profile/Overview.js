import React from "react";
import { useOutletContext } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Privacy from "./Privacy";

import "./Profile.css";

const Overview = () => {
  const { consumer } = useOutletContext();

  return (
    <div>
      {/* title  */}
      <div className="d-flex justify-content-between align-iteams-center py-3 user-profile-content-title">
        <div className="d-flex ms-3 align-items-center">
          <FontAwesomeIcon
            icon={["fas", "info-circle"]}
            className="me-2 user-profile-content-title-icon"
          />
          <h2>User Details Information</h2>
        </div>

        <div className="me-3">
          <button className="btn user-profile-content-title-button">
            <FontAwesomeIcon icon={["fas", "pen"]} />
            <span className="ms-2">Edit Profile</span>
          </button>
        </div>
      </div>

      {/* content */}
      <div className="row mx-1 mt-3">
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>First Name</b> : {consumer.first_name}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Last Name</b> : {consumer.last_name}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Blood Group</b> : {consumer.blood_group}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Date Of Birth</b> : {consumer.date_of_birth}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Gender</b> : {consumer.gender}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Occupation</b>: {consumer.occupation}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Marital Status </b>: {consumer.marital_status}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
      </div>
    </div>
  );
};
export default Overview;
