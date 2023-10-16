import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import "../../Organizations/Organizations.css";

const JobPostColorBox = ({ bgColor, content, title, icon }) => {
  return (
    <div
      style={{
        backgroundColor: `${bgColor ? bgColor : "blueviolet"}`,
        margin: "10px 5px 0",
      }}
      className="d-flex justify-content-between rounded px-3 align-items-center text-white"
    >
      <div>
        <h6 className="fw-bold">{title}</h6>
        <h3 className="text-capitalize">{content}</h3>
      </div>
      <div className="color-box-icon">
        <FontAwesomeIcon className="ms-2" icon={["fas", `${icon}`]} />
      </div>
    </div>
  );
};

export default JobPostColorBox;
