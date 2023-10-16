import React from "react";
import { useOutletContext } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import Privacy from "./Privacy";
import "./Profile.css";

const FamilyAndRelation = () => {
  const { consumer } = useOutletContext();

  return (
    <div>
      {/* title  */}
      <div className="d-flex justify-content-between align-iteams-center py-3 user-profile-content-title">
        <div className="d-flex ms-3 align-items-center">
          <FontAwesomeIcon
            icon={["fas", "users"]}
            className="me-2 user-profile-content-title-icon"
          />
          <h2>Family And Relational Information</h2>
        </div>

        <div className="me-3">
          <button className="btn user-profile-content-title-button">
            <FontAwesomeIcon icon={["fas", "pen"]} />
            <span className="ms-2">Edit Family And Relation</span>
          </button>
        </div>
      </div>

      {/* content */}
      <div className="row mx-1 mt-3">
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Father Name</b> : {consumer.father_name}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            {" "}
            <b>Mother Name</b> : {consumer.mother_name}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Father Occupation</b> : {consumer.father_occupation}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Mother Occupation</b> : {consumer.mother_occupation}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Family Member</b> : {consumer.about_family_members}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
      </div>
    </div>
  );
};
export default FamilyAndRelation;
