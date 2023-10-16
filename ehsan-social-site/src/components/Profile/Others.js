import React from "react";
import { useOutletContext } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import Privacy from "./Privacy";
import "./Profile.css";

const Others = () => {
  const { consumer } = useOutletContext();

  return (
    <div className="about-main-info">
      <div className="d-flex justify-content-between align-iteams-center py-3 user-profile-content-title">
        <div className="d-flex ms-3 align-items-center">
          <FontAwesomeIcon
            icon={["fas", "sitemap"]}
            className="me-2 user-profile-content-title-icon"
          />
          <h2>Others Information</h2>
        </div>

        <div className="me-3">
          <button className="btn user-profile-content-title-button">
            <FontAwesomeIcon icon={["fas", "pen"]} />
            <span className="ms-2">Edit Others</span>
          </button>
        </div>
      </div>

      {/* content */}
      <div className="row mx-1 mt-3">
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Language </b>: {consumer.language}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Weight </b>: {consumer.weight} KG
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Height</b> : {consumer.height}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Spouse Name</b> : {consumer.spouse_name}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Religion</b> : {consumer.religion}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Rank</b> : {consumer.rank}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
        <div className="col-md-6 pt-1 my-1 d-flex justify-content-between">
          <p>
            <b>Hobby</b> : {consumer.hobby}
          </p>
          <div>
            <Privacy />
          </div>
        </div>
      </div>
    </div>
  );
};
export default Others;
