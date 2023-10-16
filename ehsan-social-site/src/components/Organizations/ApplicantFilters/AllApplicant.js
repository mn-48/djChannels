import React, { useState } from "react";

import Modal from "react-bootstrap/Modal";
import moment from "moment";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import ApplicantDetails from "./ApplicantDetails";

import "../Organizations.css";

const AllApplicant = ({
  applicationList,
  viewedHandler,
  shortlistHandler,
  addCommentHandler,
  rejectHandler,
}) => {
  // modal state
  const [show, setShow] = useState(false);
  const [applicantDetails, setApplicantDetails] = useState({})

  // modal handler
  const handleClose = () => setShow(false);

  const handleShow = (item) => {
    setShow(true);
    setApplicantDetails(item);
  };

  return (
    <>
      {applicationList.map((item, index) => (
        <div className="filter-item-counter-container" key={index}>
          <div className="filter-item-counter">{index + 1}</div>
          <div className="jpdd-filter-item-content px-3">
            {/* col 1  */}
            <div className="px-1">
              <div className="jpdd-content-box-profile-logo">
                <img srv={item.cv_photo} alt="photo_cv" />
              </div>

              <div>
                <div className="text-center my-2 fw-bold">
                  <p className="jpdd-color">55%</p>
                </div>

                <div className="d-flex justify-content-center">
                  {/* file  */}
                  <div>
                    <a href="##" className="jpdd-icon-bg" target="_blank">
                      <FontAwesomeIcon icon={["far", "file-alt"]} />
                    </a>
                  </div>

                  {/* download  */}
                  <div>
                    <a
                      href={item.jobprofile.cv_upload}
                      // target="_blank"
                      className="jpdd-icon-bg"
                      onClick={() => viewedHandler(item.id)}
                      download
                    >
                      <FontAwesomeIcon icon={["fas", "file-download"]} />
                    </a>
                  </div>

                  {/* view  */}
                  <div
                    className="jpdd-applicant-view-btn"
                    onClick={() => handleShow(item)}
                  >
                    <FontAwesomeIcon icon={["fas", "eye"]} />
                  </div>
                </div>
              </div>

              <div className="d-flex justify-content-center">
                <form>
                  <input type="checkbox" />
                </form>
              </div>
            </div>

            {/* col 2 */}
            <div className="px-1">
              <div className="mb-2">
                <h6>
                  <FontAwesomeIcon
                    className="me-2 fs-5"
                    icon={["far", "user"]}
                  />
                  <span className="jpdd-color fw-bold">
                    {item.jobprofile.user.first_name}{" "}
                    {item.jobprofile.user.last_name}
                  </span>
                </h6>
              </div>

              <div className="mb-2">
                <h6>
                  <FontAwesomeIcon
                    className="me-2 fs-5"
                    icon={["fas", "map-marker-alt"]}
                  />
                  <span>{item.jobprofile.country}</span>
                </h6>
              </div>

              <div className="mb-2">
                <h6>
                  <FontAwesomeIcon
                    className="me-2 fs-5"
                    icon={["fas", "mobile-alt"]}
                  />
                  <span>{item.jobprofile.user.consumer.phone}</span>
                </h6>
              </div>
              <div className="mb-2">
                <h6>
                  <FontAwesomeIcon
                    className="me-2 fs-5"
                    icon={["far", "envelope"]}
                  />
                  <span>{item.jobprofile.user.email}</span>
                </h6>
              </div>
              <div className="mb-2">
                <h6>
                  <FontAwesomeIcon
                    className="me-2 fs-5"
                    icon={["fas", "venus-mars"]}
                  />
                  <span>
                    {item.jobprofile.user.consumer.gender} (Age{" "}
                    {item.jobprofile.age})
                  </span>
                </h6>
              </div>
            </div>

            {/* col 3  */}
            <div className="px-1">
              <div className="d-flex mb-2">
                <div>
                  <FontAwesomeIcon
                    className="me-2 fs-5"
                    icon={["fas", "graduation-cap"]}
                  />
                </div>
                <div>
                  <h6>Last Educational Instititution Name</h6>
                  <p className="font-small">pabna university</p>
                </div>
              </div>

              <div className="d-flex mb-2">
                <div>
                  <FontAwesomeIcon
                    className="me-2 fs-5"
                    icon={["far", "envelope"]}
                  />
                </div>
                <div>
                  <h6>Last Experience Company Name</h6>
                  <p className="font-small">Advanced Residential college</p>
                </div>
              </div>

              <div className="d-flex mb-2">
                <div>
                  <FontAwesomeIcon
                    className="me-2 fs-5"
                    icon={["far", "envelope"]}
                  />
                </div>
                <div>
                  <h6>Before Last Experience Company</h6>
                  <p className="font-small">munna@gmail.com</p>
                </div>
              </div>
            </div>

            {/* col 4 */}
            <div className="px-1">
              <div className=" mb-2">
                <h6>
                  <FontAwesomeIcon
                    className="me-2 fs-5"
                    icon={["fas", "calendar-alt"]}
                  />
                  <span>Experience : {item.working_experience} years</span>
                </h6>
              </div>

              <div className=" mb-2">
                <h6>
                  <FontAwesomeIcon
                    className="me-2 fs-5"
                    icon={["fas", "lira-sign"]}
                  />
                  <span>{item.expected_salary}</span>
                </h6>
              </div>

              <div
                className="mb-2 d-flex align-items-center"
                onClick={() => addCommentHandler(item.id)}
              >
                <span className="jpdd-comment-icon-box font-small">
                  <FontAwesomeIcon
                    className="me-2 jpdd-color fs-5"
                    icon={["far", "comment-dots"]}
                  />
                  Add Comment
                </span>
              </div>
            </div>

            {/* col 5  */}
            <div className="text-center">
              <>
                {/* Shortlist  */}
                {item.shortlisted ? (
                  <div>
                    <button className="approve-after-btn font-small">
                      <FontAwesomeIcon
                        className="me-2"
                        icon={["fas", "check-circle"]}
                      />
                      Shortlisted
                    </button>
                  </div>
                ) : (
                  <div onClick={() => shortlistHandler(item.id, "add")}>
                    <button className="approve-btn font-small">
                      <FontAwesomeIcon
                        className="me-2"
                        icon={["fas", "check-circle"]}
                      />
                      Shortlist
                    </button>
                  </div>
                )}

                {/* rejected  */}
                {item.rejected ? (
                  <div className="mt-3">
                    <button className="reject-after-btn font-small">
                      <FontAwesomeIcon className="me-2" icon={["fas", "ban"]} />
                      Rejected
                    </button>
                  </div>
                ) : (
                  <div className="mt-3" onClick={() => rejectHandler(item.id)}>
                    <button className="reject-btn font-small">
                      <FontAwesomeIcon className="me-2" icon={["fas", "ban"]} />
                      Reject
                    </button>
                  </div>
                )}
              </>

              <div className="mt-4">
                <p className="fw-bold">Applied on</p>
                <p>{moment(`${item.application_date}`).fromNow()}</p>
              </div>
            </div>
          </div>
        </div>
      ))}

      {/* modal content  */}
      <Modal show={show} size="lg" onHide={handleClose} centered>
        <Modal.Header closeButton></Modal.Header>
        <Modal.Body>
          <ApplicantDetails applicantDetails={applicantDetails && applicantDetails}/>
        </Modal.Body>
      </Modal>
    </>
  );
};

export default AllApplicant;
