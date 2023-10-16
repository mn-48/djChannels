import React from "react";
import { useOutletContext } from "react-router-dom";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import Privacy from "./Privacy";
import "./Profile.css";

const ContactInfo = () => {
  const { consumer } = useOutletContext();

  return (
    <div>
      {/* title  */}
      <div className="d-flex justify-content-between align-iteams-center py-3 user-profile-content-title">
        <div className="d-flex ms-3 align-items-center">
          <FontAwesomeIcon
            icon={["fas", "phone-alt"]}
            className="user-profile-content-title-icon"
          />
          <h2 className="ms-3">Contact Details</h2>
        </div>

        <div className="me-3">
          <button className="btn user-profile-content-title-button">
            <FontAwesomeIcon icon={["fas", "pen"]} />
            <span className="ms-2">Edit Contact</span>
          </button>
        </div>
      </div>

      {/* content */}
      <div className="row mx-1 mt-3">
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Phone Number</b> : {consumer.phone}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>NID Number</b> : {consumer.nid_number}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
      </div>
    </div>
  );
};
export default ContactInfo;
