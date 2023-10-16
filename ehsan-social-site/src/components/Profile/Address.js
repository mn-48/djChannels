import React from "react";
import { useOutletContext } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import "tippy.js/dist/tippy.css";

import "./Profile.css";

import Privacy from "./Privacy";

const Address = () => {
  const { consumer } = useOutletContext();

  return (
    <div className="about-main-info">
      {/* title  */}
      <div className="d-flex justify-content-between align-iteams-center py-3 user-profile-content-title">
        <div className="d-flex ms-3 align-items-center">
          <FontAwesomeIcon
            className="me-2 user-profile-content-title-icon"
            icon={["fas", "address-book"]}
          />
          <h2>Address</h2>
        </div>

        <div className="me-3">
          <button className="btn user-profile-content-title-button ">
            <FontAwesomeIcon icon={["fas", "pen"]} />
            <span className="ms-2">Edit Address</span>
          </button>
        </div>
      </div>

      {/* content */}
      <div className="row mx-1 mt-3">
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Parmanent Address</b> : {consumer.address1}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Present Address</b> : {consumer.address2}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            {" "}
            <b>City</b> : {consumer.city.name}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Counrtry</b> : {consumer.country.name}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
      </div>
    </div>
  );
};
export default Address;
