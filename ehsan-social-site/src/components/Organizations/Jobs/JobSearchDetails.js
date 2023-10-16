import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const JobSearchDetails = ({ jobSearch }) => {
  console.log("applicantDetails : ", jobSearch);

  return (
    <>
      <div className="d-flex mx-4">
        <div className="jpdd-applicant-details-modal-logo">
          <img
          // src={applicantDetails.cv_photo}
          alt="applicantDetails.jobprofile.user.first_name"
          />
        </div>
        <div className="flex-grow-1 d-flex align-items-center ms-4">
          <h2 className="text-capitalize text-center">{jobSearch.job_title}</h2>
        </div>
      </div>

      <div>
        <div className="row rounded mx-3">
          {/* General information  */}
          <div className="row my-3 bg-white rounded mx-auto">
            <div className="col-12 mt-0 mb-2">
              <h3 className="group-title m-0">
                <FontAwesomeIcon
                  className="me-2"
                  icon={["fas", "info-circle"]}
                />
                General information
              </h3>
            </div>
            {/* name */}
            <div className="col-md-6">
              <h5 className="info-heading">applicant name</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {/* {applicantDetails.jobprofile.user.first_name}{" "}
                {applicantDetails.jobprofile.user.last_name} */}
              </p>
            </div>
            {/* country */}
            <div className="col-md-6 ">
              <h5 className="info-heading">country Name</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {" "}
                {/* {applicantDetails.jobprofile.country} */}
              </p>
            </div>
            {/* phone  */}
            <div className="col-md-6">
              <h5 className="info-heading">phone</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {" "}
                {/* {applicantDetails.jobprofile.user.consumer.phone} */}
              </p>
            </div>
            {/* passport_no  */}
            <div className="col-md-6">
              <h5 className="info-heading">passport no</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {" "}
                {/* {applicantDetails.jobprofile.passport_no} */}
              </p>
            </div>
            {/* passport_issue_date  */}
            <div className="col-md-6">
              <h5 className="info-heading">passport issue date</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {" "}
                {/* {applicantDetails.jobprofile.passport_issue_date} */}
              </p>
            </div>
            {/* emergency_contact_no  */}
            <div className="col-md-6">
              <h5 className="info-heading">emergency contact no</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {" "}
                {/* {applicantDetails.jobprofile.emergency_contact_no} */}
              </p>
            </div>
            {/* email */}
            <div className="col-md-6">
              <h5 className="info-heading">email</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {" "}
                {/* {applicantDetails.jobprofile.user.email} */}
              </p>
            </div>
            {/* alternative_email */}
            <div className="col-md-6">
              <h5 className="info-heading">alternative email</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {" "}
                {/* {applicantDetails.jobprofile.alternative_email} */}
              </p>
            </div>
            {/* looking_job_level */}
            <div className="col-md-6">
              <h5 className="info-heading">looking job level</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {/* {" "}
                {applicantDetails.jobprofile.looking_job_level} */}
              </p>
            </div>{" "}
            {/* available_for_job_type */}
            <div className="col-md-6">
              <h5 className="info-heading">available for job type</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {/* {" "}
                {applicantDetails.jobprofile.available_for_job_type} */}
              </p>
            </div>{" "}
            {/* career_summary */}
            <div className="col-md-6">
              <h5 className="info-heading">career summary</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {/* {" "}
                {applicantDetails.jobprofile.career_summary
                  ? applicantDetails.jobprofile.career_summary
                  : "Empty"} */}
              </p>
            </div>{" "}
            {/* special_qualifications */}
            <div className="col-md-6">
              <h5 className="info-heading">aspecial_qualifications</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {/* {" "}
                {applicantDetails.jobprofile.special_qualifications
                  ? applicantDetails.jobprofile.special_qualifications
                  : "Empty"} */}
              </p>
            </div>{" "}
            {/* gender  */}
            {/* <div className="col-md-6">
              <h5 className="info-heading">gender</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {applicantDetails.jobprofile.user.consumer.gender} (Age{" "}
                {applicantDetails.jobprofile.age})
              </p>
            </div> */}
            {/* working_experience  */}
            <div className="col-md-6">
              <h5 className="info-heading">working experience</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {/* {applicantDetails.working_experience}{" "}
                {applicantDetails.working_experience > 1 ? "Years" : "Year"} */}
              </p>
            </div>
            {/* expected_salary  */}
            <div className="col-md-6">
              <h5 className="info-heading">expected salary</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {/* {applicantDetails.expected_salary} BDT */}
              </p>
            </div>
            {/* portfolio_link  */}
            <div className="col-md-6">
              <h5 className="info-heading">portfolio link</h5>
              <p className="info-detail jpdd-applicant-details-modal-content">
                {/* <a
                  href={applicantDetails.jobprofile.portfolio_link}
                  target="_blank"
                >
                  Click here
                </a> */}
              </p>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default JobSearchDetails;
