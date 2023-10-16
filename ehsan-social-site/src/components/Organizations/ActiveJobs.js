import React, { useState } from "react";
import { Link, useOutletContext } from "react-router-dom";

import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css";

// compopnents
import JobDetails from "./JobDetails";

// svg icon
import { ReactComponent as ActiveJobsImage } from "../../images/new/svg/list.svg";
// import { ReactComponent as ActiveOrganization } from "../../images/new/svg/list.svg";
import { ReactComponent as Viewer } from "../../images/new/svg/viewer.svg";
import { ReactComponent as Briefcase } from "../../images/new/svg/briefcase2.svg";
// import { ReactComponent as Edit } from "../../images/new/svg/edit.svg";
import { ReactComponent as Settings } from "../../images/new/svg/cogwheel.svg";
// import { ReactComponent as Hide } from "../../images/new/svg/s-lock.svg";
// import { ReactComponent as Lock } from "../../images/new/svg/b-lock.svg";

import { ReactComponent as Pause } from "../../images/new/svg/pause-button.svg";
import { ReactComponent as Role } from "../../images/new/svg/stng.svg";
import { ReactComponent as Remove } from "../../images/new/svg/trash.svg";

import "./Organizations.css";

const ActiveJobs = () => {
  // outlet context
  const { activeJob, jobPosts } = useOutletContext();

  // modal state
  const [show, setShow] = useState(false);

  // modal handler
  const handleClose = () => setShow(false);
  const [detailsModalJobPost, setDetailsModalJobPost] = useState({});

  const handleShow = (item) => {
    setShow(true);
    setDetailsModalJobPost(item);
  };

  const activeJobPosts =
    jobPosts &&
    jobPosts.filter((items) => {
      return items.is_active === true;
    });

  return (
    <div className="org-dashboard-accordion-items-content">
      <div div className="active-org-item">
        <div className="org-title-icon">
          <ActiveJobsImage className="org-svg-color" />
        </div>

        <div className="flex-grow-1">
          <h2 className="org-content-title">Active/Expired Jobs</h2>
          <p className="org-content-message">
            Total Active/Expired Jobs
            <span className="ms-1 org-active-color">({activeJob})</span>
          </p>
        </div>
      </div>

      {/* Active Job Post  */}
      {activeJobPosts &&
        activeJobPosts.map((item, index) => {
          return (
            <div
              className="justify-content-between active-org-item"
              key={index}
            >
              {/* logo  */}
              <div className="org-dynamic-logo">
                <ActiveJobsImage />
              </div>

              {/* main info  */}
              <div className="flex-grow-1">
                <div>
                  <div className="d-flex align-items-center">
                    <h2 className="org-job-content-title">{item.job_title}</h2>
                  </div>

                  <p className="org-job-content-message">
                    Published On 25th may By Munna | Deadline : {item.deadline}
                  </p>
                </div>

                <div className="d-flex align-items-center mt-1">
                  <span className="org-job-content-message">
                    <FontAwesomeIcon icon={["fas", "user"]} className="me-1" />
                    Applicant (1240)
                    {/* {item.contact_person_name} */}
                  </span>
                  <span className="org-job-content-message ">
                    <FontAwesomeIcon
                      icon={["fas", "mobile-alt"]}
                      className="me-1"
                    />
                    Viewed (20)
                    {/* {item.contact_person_phone} */}
                  </span>
                  <span className="org-job-content-message ">
                    <FontAwesomeIcon
                      icon={["fas", "mobile-alt"]}
                      className="me-1"
                    />
                    Rejected (10)
                    {/* {item.contact_person_phone} */}
                  </span>

                  <span className="org-job-content-message ">
                    <FontAwesomeIcon
                      icon={["fas", "mobile-alt"]}
                      className="me-1"
                    />
                    Shortlisted (20)
                    {/* {item.contact_person_phone} */}
                  </span>

                  <span className="org-job-content-message ">
                    <FontAwesomeIcon
                      icon={["fas", "mobile-alt"]}
                      className="me-1"
                    />
                    Selected (2)
                    {/* {item.contact_person_phone} */}
                  </span>
                </div>
              </div>

              {/* view  */}
              <div>
                <div
                  className="org-svg-icon svg-icon-container"
                  onClick={() => handleShow(item)}
                >
                  <Viewer />
                </div>
              </div>

              {/* job  */}
              <div className="org-svg-icon svg-icon-container">
                <Link to="/jobpost-details-dashboard">
                  <Briefcase />
                </Link>
              </div>

              {/* settings  */}
              <Tippy
                trigger={"click"}
                theme={"light"}
                animation={"perspective"}
                placement={"bottom"}
                interactive={true}
                content={
                  <div>
                    <Link to="/route2">
                      <div className="svg-icon-container-tippy-item">
                        <div className="org-svg-icon">
                          <Pause />
                        </div>
                        <div className="flex-grow-1">
                          <h5 className="org-tippy-content-title">
                            freeze post
                          </h5>
                        </div>
                      </div>
                    </Link>

                    <Link to="/route3">
                      <div className="svg-icon-container-tippy-item">
                        <div className="org-svg-icon">
                          <Role />
                        </div>
                        <div className="flex-grow-1">
                          <h5 className="org-tippy-content-title">
                            Promote post
                          </h5>
                        </div>
                      </div>
                    </Link>

                    <div
                      className="svg-icon-container-tippy-item"
                      onClick={() => console.log("remove post")}
                    >
                      <div className="org-svg-icon">
                        <Remove />
                      </div>
                      <div className="flex-grow-1">
                        <h5 className="org-tippy-content-title">remove post</h5>
                      </div>
                    </div>
                  </div>
                }
              >
                <div className="org-svg-icon svg-icon-container">
                  <Settings />
                </div>
              </Tippy>
            </div>
          );
        })}

      {/* modal content  */}
      <Modal show={show} size="lg" onHide={handleClose} centered>
        <Modal.Header closeButton></Modal.Header>
        <Modal.Body>
          <JobDetails singleJobPost={detailsModalJobPost} />
        </Modal.Body>
      </Modal>
    </div>
  );
};

export default ActiveJobs;
