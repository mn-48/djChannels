import React, { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import JobEducation from "./JobEducation";
import JobExperience from "./JobExperience";
import JobProject from "./JobProject";
import JobDisability from "./JobProfileHome/JobDisability";
import JobPersonalInfo from "./JobProfileHome/JobPersonalInfo";
import JobAddress from "./JobProfileHome/JobAddress";
import JobCareerApplication from "./JobProfileHome/JobCareerApplication";
import JobPreferredArea from "./JobProfileHome/JobPreferredArea";
import JobCVImage from "./JobProfileHome/JobCVImage";
import "./Job.css";

const JobProfile = () => {
  /******* Collaps section ends here *******/

  /**** Render Another component conditionally code starts here *******/
  const [showComponent, setShowComponent] = useState("personal");
  /******* Render another component conditionally code ends here******/
  /***** React hook form starts here ******/

  return (
    <>
      <nav className="nav nav-pills rounded bg bg-light nav-fill mx-3 my-3">
        <button
          onClick={() => setShowComponent("personal")}
          className={`nav-link navName ${
            showComponent === "personal" && "active"
          }`}
        >
          <FontAwesomeIcon className="navIcon" icon={["fas", "user"]} />
          Personal
        </button>
        <button
          onClick={() => setShowComponent("education")}
          // className="nav-link navName"
          className={`nav-link navName ${
            showComponent === "education" && "active"
          }`}
        >
          <FontAwesomeIcon
            className="navIcon"
            icon={["fas", "graduation-cap"]}
          />
          Education/training
        </button>
        <button
          onClick={() => setShowComponent("employment")}
          className={`nav-link navName ${
            showComponent === "employment" && "active"
          }`}
        >
          <FontAwesomeIcon className="navIcon" icon={["fas", "briefcase"]} />
          Employment
        </button>
        <button
          onClick={() => setShowComponent("others")}
          className={`nav-link navName ${
            showComponent === "others" && "active"
          }`}
        >
          <FontAwesomeIcon className="navIcon" icon={["fas", "bars"]} />
          Other Information
        </button>
      </nav>
      {showComponent === "personal" && (
        <>
          <JobPersonalInfo />
          <JobCVImage />
          <JobAddress />
          <JobCareerApplication />
          <JobPreferredArea />
          <JobDisability />
        </>
      )}

      {showComponent === "education" && <JobEducation />}
      {showComponent === "employment" && <JobExperience />}
      {showComponent === "others" && <JobProject />}
    </>

    /****** React Hook form ends here *******/
  );
};

export default JobProfile;
