import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { ReactComponent as JobImage } from "../../images/new/svg/briefcase.svg";
import ResumeImage from "../../images/new/cv.png";
import EditResume from "../../images/new/resume.png";
import BusinessMan from "../../images/new/businessman.png";
import ShareImage from "../../images/new/copy.png";

import "./UserIconDropDown.css";

const JobProfile = ({ onBackPrevContentHandler }) => {
  return (
    <>
      {/* Job Profile Title */}
      <div
        className="d-flex py-2 nested-content-title-container"
        onClick={onBackPrevContentHandler}
      >
        <div className="ms-1 ps-3 pe-2 nested-title-left-icon">
          <FontAwesomeIcon icon={["fas", "chevron-left"]} />
        </div>
        <div className="flex-grow-1 ms-3 ps-1">
          <h2 className="nested-content-title">Job Profile</h2>
        </div>
        <div className="px-3 svg-icon">
          <JobImage />
        </div>
      </div>

      {/* view resume  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={ResumeImage} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">View Resume</h5>
          <p className="content-message">View your resume</p>
        </div>
      </div>

      {/* edit resume  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={EditResume} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Edit Resume</h5>
          <p className="content-message">Edit your resume</p>
        </div>
      </div>

      {/* view jobs  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={BusinessMan} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">View Jobs</h5>
          <p className="content-message">View your jobs</p>
        </div>
      </div>

      {/* share resume  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={ShareImage} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Share Resume</h5>
          <p className="content-message">Share your resume to others</p>
        </div>
      </div>
    </>
  );
};

export default JobProfile;
