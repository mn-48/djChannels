import React, { useState } from "react";
import { Link, useOutletContext } from "react-router-dom";

import Modal from "react-bootstrap/Modal";
import Tippy from "@tippyjs/react";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css";

// compopnents
import JobDetails from "./JobDetails";
import CreateNewJob from "./CreateNewJob";

// svg icon
// import { ReactComponent as PendingJobsImages } from "../../images/new/svg/list.svg";
import { ReactComponent as PendingJobsImages } from "../../images/new/svg/sand-clock.svg";
// import { ReactComponent as ActiveOrganization } from "../../images/new/svg/list.svg";
import { ReactComponent as Viewer } from "../../images/new/svg/viewer.svg";
import { ReactComponent as Briefcase } from "../../images/new/svg/briefcase2.svg";
import { ReactComponent as Edit } from "../../images/new/svg/edit.svg";
import { ReactComponent as Settings } from "../../images/new/svg/cogwheel.svg";

import { ReactComponent as Remove } from "../../images/new/svg/trash.svg";

import "./Organizations.css";

const PendingJobs = () => {
  // outlet context
  const { threeCategory, pendingJob, jobPosts, orgData } = useOutletContext();

  console.log("Pending job post ::", orgData);

  // modal state
  const [detailsShow, setDetailsShow] = useState(false);
  const [updateShow, setUpdateShow] = useState(false);
  const [updateModalJobPost, setUpdateModalJobPost] = useState({});
  const [detailsModalJobPost, setDetailsModalJobPost] = useState({});

  // modal handler
  // details modal
  const handleDetailsClose = () => setDetailsShow(false);

  const handleDetailsShow = (item) => {
    setDetailsShow(true);
    setDetailsModalJobPost(item);
  };

  // update modal
  const jobUpdateHandleClose = () => setUpdateShow(false);

  const jobUpdateHandleShow = (item) => {
    setUpdateShow(true);
    setUpdateModalJobPost(item);
  };

  const pendingJobPosts =
    jobPosts &&
    jobPosts.filter((items) => {
      return items.is_active === false;
    });

  console.log("pendingJobPosts ::", pendingJobPosts);

  return (
    <div className="org-dashboard-accordion-items-content">
      {/* title  */}
      <div div className="active-org-item">
        {/* title icon  */}
        <div className="org-title-icon">
          <PendingJobsImages className="org-svg-color" />
        </div>

        {/* title content  */}
        <div className="flex-grow-1">
          <h2 className="org-content-title">Pending Jobs</h2>
          <p className="org-content-message">
            Total Pending Jobs
            {/* <span className="ms-1 org-pending-color">{pendingJob}</span> */}
          </p>
        </div>
      </div>

      {/* pending job posts  */}
      {pendingJobPosts && pendingJobPosts.map((item, index) => {
        return (
          <div className="justify-content-between active-org-item" key={index}>
            {/* logo  */}
            <div className="org-dynamic-logo">
              <PendingJobsImages />
            </div>

            {/* main info  */}
            <div className="flex-grow-1">
              <div>
                <div className="d-flex align-items-center">
                  <h2 className="org-job-content-title">{item.job_title}</h2>
                </div>

                <p className="org-job-content-message">
                  created at : {item.created_at} | vacancies :{" "}
                  {item.vacancies ? item.vacancies : "null"} | Deadline :{" "}
                  {item.deadline ? item.deadline : "null"}
                </p>
              </div>
            </div>

            {/* view  */}
            <div>
              <div
                className="org-svg-icon svg-icon-container"
                onClick={() => handleDetailsShow(item)}
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

            {/* edit  */}
            <div>
              <div
                className="org-svg-icon svg-icon-container"
                onClick={() => jobUpdateHandleShow(item)}
              >
                <Edit />
              </div>
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
      {/* show details modal  */}
      <Modal show={detailsShow} size="lg" onHide={handleDetailsClose} centered>
        <Modal.Header closeButton></Modal.Header>
        <Modal.Body>
          <JobDetails singleJobPost={detailsModalJobPost} />
        </Modal.Body>
      </Modal>

      {/* show update form modal  */}
      <Modal show={updateShow} size="lg" onHide={jobUpdateHandleClose} centered>
        <Modal.Header closeButton></Modal.Header>
        <Modal.Body>
          <CreateNewJob
            threeCategory={threeCategory}
            chooseOrg={orgData}
            formType="updateJob"
            singleJobPost={updateModalJobPost}
          />
        </Modal.Body>
      </Modal>
    </div>
  );
};

export default PendingJobs;
