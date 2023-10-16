import React, { useState } from "react";
import Modal from "react-bootstrap/Modal";
import moment from "moment";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import ApplicantDetails from "./ApplicantDetails";

const ShortlistedFilter = ({
  applicationList,
  addCommentHandler,
  shortlistRemoveHandler,
  interviewedHandler,
  removeInterviewedHandler,
}) => {
  // modal state
  const [show, setShow] = useState(false);
  const [applicantDetails, setApplicantDetails] = useState({});

  // modal handler
  const handleClose = () => setShow(false);

  const handleShow = (item) => {
    setShow(true);
    setApplicantDetails(item);
  };

  return (
    <>
      {applicationList.map(
        (item, index) =>
          item.shortlisted && (
            <div className="filter-item-counter-container" key={index}>
              {/* count  */}
              <div className="filter-item-counter">{index + 1}</div>
              {/* badge  */}
              <div className="filter-item-type-badge">
                <span className="badge bg-secondary">Shortlisted</span>
              </div>
              {/* main content  */}
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
                      <span className="jpdd-color fw-bold font-small">
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
                      <span className="font-small">
                        {item.jobprofile.country}
                      </span>
                    </h6>
                  </div>

                  <div className="mb-2">
                    <h6>
                      <FontAwesomeIcon
                        className="me-2 fs-5"
                        icon={["fas", "mobile-alt"]}
                      />
                      <span className="font-small">
                        {item.jobprofile.user.consumer.phone}
                      </span>
                    </h6>
                  </div>
                  <div className="mb-2">
                    <h6>
                      <FontAwesomeIcon
                        className="me-2 fs-5"
                        icon={["far", "envelope"]}
                      />
                      <span className="font-small">
                        {item.jobprofile.user.email}
                      </span>
                    </h6>
                  </div>
                  <div className="mb-2">
                    <h6>
                      <FontAwesomeIcon
                        className="me-2 fs-5"
                        icon={["fas", "venus-mars"]}
                      />
                      <span className="font-small">
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
                      <span>experience : {item.working_experience} years</span>
                    </h6>
                  </div>

                  <div className=" mb-2">
                    <h6>
                      <FontAwesomeIcon
                        className="me-2 fs-5"
                        icon={["fas", "lira-sign"]}
                      />
                      <span className="font-small">{item.expected_salary}</span>
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
                <div className="px-1">
                  {/* short listed  */}
                  <div className=" mb-2">
                    {item.interviewed ? (
                      <>
                        <div
                          className="mt-0"
                          onClick={() => removeInterviewedHandler(item.id)}
                          data-bs-toggle="tooltip"
                          data-bs-placement="left"
                          title="Remove From Interviewed"
                        >
                          <button className="reject-after-btn font-small">
                            <FontAwesomeIcon
                              className="me-2"
                              icon={["fas", "undo-alt"]}
                            />
                            Remove
                          </button>
                        </div>
                      </>
                    ) : (
                      <>
                        <div
                          className="mt-0"
                          onClick={() => shortlistRemoveHandler(item.id)}
                          data-bs-toggle="tooltip"
                          data-bs-placement="left"
                          title="Remove From Shortlisted"
                        >
                          <button className="reject-after-btn font-small">
                            <FontAwesomeIcon
                              className="me-2"
                              icon={["fas", "undo-alt"]}
                            />
                            Remove
                          </button>
                        </div>
                        <div
                          className="mt-3"
                          onClick={() => interviewedHandler(item.id)}
                        >
                          <button className="approve-btn font-small">
                            <FontAwesomeIcon
                              className="me-2"
                              icon={["fas", "check-circle"]}
                            />
                            Interview
                          </button>
                        </div>
                      </>
                    )}
                  </div>

                  <div className="mt-4">
                    <p className="fw-bold">Applied on</p>
                    <p>{moment(`${item.application_date}`).fromNow()}</p>
                  </div>
                </div>
              </div>
            </div>
          )
      )}
      {/* modal content  */}
      <Modal show={show} size="lg" onHide={handleClose} centered>
        <Modal.Header closeButton></Modal.Header>
        <Modal.Body>
          <ApplicantDetails
            applicantDetails={applicantDetails && applicantDetails}
          />
        </Modal.Body>
      </Modal>
    </>
  );
};

export default ShortlistedFilter;
