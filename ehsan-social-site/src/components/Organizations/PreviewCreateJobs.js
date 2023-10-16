import React from "react";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import "./Organizations.css";

const PreviewCreateJobs = () => {
  return (
    <>
      <div className="row gy-2 my-2 pt-2 pb-3 bg-white rounded">
        <div className="col-12 mt-0">
          <h3 className="group-title">
            <FontAwesomeIcon className="me-2" icon={["fas", "info-circle"]} />
            Preview
          </h3>
        </div>

        {/* Form Data  */}
        <div className="col-md-6 mt-1">
          <h3 className="preview-group-title">Company Name</h3>
          <p className="preview-group-message">Lorem ipsum</p>
        </div>

        <div className="col-md-6 mt-1">
          <h3 className="preview-group-title">Company Address</h3>
          <p className="preview-group-message">Lorem ipsum</p>
        </div>

        <div className="col-md-6 mt-1">
          <h3 className="preview-group-title">Company Name</h3>
          <p className="preview-group-message">Lorem ipsum</p>
        </div>

        <div className="col-md-6 mt-1">
          <h3 className="preview-group-title">Company Address</h3>
          <p className="preview-group-message">Lorem ipsum</p>
        </div>

        <div className="col-md-6 mt-1">
          <h3 className="preview-group-title">Company Name</h3>
          <p className="preview-group-message">Lorem ipsum</p>
        </div>

        <div className="col-md-6 mt-1">
          <h3 className="preview-group-title">Company Address</h3>
          <p className="preview-group-message">Lorem ipsum</p>
        </div>
      </div>
    </>
  );
};

export default PreviewCreateJobs;
