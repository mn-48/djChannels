import React from "react";

// svg
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { ReactComponent as JobsDetailHeaderImage } from "../../images/new/svg/briefcase.svg";

import "./Organizations.css";

const JobDetails = ({ singleJobPost }) => {
  return (
    <>
      {/* Header */}
      <div className="d-flex align-items-center mx-3 my-1 py-1  px-3">
        <div className="organization-icon">
          <JobsDetailHeaderImage />
        </div>
        <div className="flex-grow-1">
          <h2>Job Details</h2>
        </div>
      </div>

      {/* content  */}
      <div>
        <div className="row rounded mx-3">
          {/* Job primary information  */}
          <div className="row my-3 bg-white rounded">
            <div className="col-12 mt-0 mb-2">
              <h3 className="group-title m-0">
                <FontAwesomeIcon
                  className="me-2"
                  icon={["fas", "info-circle"]}
                />
                Job primary information
              </h3>
            </div>

            {/* Organization name */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">Organization name</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.job_title}
              </p>
            </div>

            {/* number of vacancies*/}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">number of vacancies</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.vacancies}
              </p>
            </div>

            {/* functional category  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">functional category</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.functional_category.name}
              </p>
            </div>

            {/* special skills category  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">special skills category</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.special_skills_category.name}
              </p>
            </div>

            {/* industry category  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">industry category</h5>

              <p className="info-detail">
                {singleJobPost && singleJobPost.industry_category.name}
              </p>
            </div>

            {/* deadline  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">deadline</h5>

              <p className="info-detail">
                {singleJobPost && singleJobPost.deadline}
              </p>
            </div>

            {/*  employment status  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">employment status</h5>
              <p className="info-detail">
                {Array.isArray(singleJobPost && singleJobPost.employment_status)
                  ? singleJobPost && singleJobPost.employment_status.length > 0
                    ? singleJobPost.employment_status.map((item, index) => (
                        <span key={index}>{item + ","}</span>
                      ))
                    : "null"
                  : singleJobPost && singleJobPost.employment_status}
              </p>
            </div>

            {/* resume receiving option */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">resume receiving option</h5>

              <p className="info-detail text-lowercase">
                {singleJobPost && singleJobPost.resume_receiveing_option}
              </p>
            </div>

            {/* special instruction for jobs seekers  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">
                special instruction for jobs seekers
              </h5>

              <p className="info-detail">
                {singleJobPost && singleJobPost.special_instruction
                  ? singleJobPost.special_instruction
                  : "null"}
              </p>
            </div>

            {/* photograph enclosed */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">photograph enclosed</h5>

              <p className="info-detail">
                {singleJobPost && singleJobPost.person_with_disability_can_apply
                  ? "Yes"
                  : "No"}
              </p>
            </div>
          </div>

          {/* More Job Information  */}
          <div className="row my-3 bg-white rounded">
            <div className="col-12 mt-0 mb-2">
              <h3 className="group-title">
                <FontAwesomeIcon
                  className="me-2"
                  icon={["fas", "info-circle"]}
                />
                More Job Information
              </h3>
            </div>

            {/* job level   */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">job level</h5>
              <p className="info-detail">
                {Array.isArray(singleJobPost && singleJobPost.job_level)
                  ? singleJobPost && singleJobPost.job_level.length > 0
                    ? singleJobPost.job_level.map((item, index) => (
                        <span key={index}>{item + ","}</span>
                      ))
                    : "null"
                  : singleJobPost && singleJobPost.job_level}
              </p>
            </div>

            {/* job context  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">job context</h5>

              <p className="info-detail">
                {singleJobPost && singleJobPost.job_context}
              </p>
            </div>

            {/* job responsibilities */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">job responsibilities</h5>

              <p className="info-detail">
                {singleJobPost && singleJobPost.job_responsibilities}
              </p>
            </div>

            {/* workplace  */}

            <div className="col-md-4 mt-2">
              <h5 className="info-heading">workplace</h5>

              <p className="info-detail">
                {Array.isArray(singleJobPost && singleJobPost.workplace)
                  ? singleJobPost && singleJobPost.workplace.length > 0
                    ? singleJobPost.workplace.map((item, index) => (
                        <span key={index}>{item + ","}</span>
                      ))
                    : "null"
                  : singleJobPost && singleJobPost.workplace}
              </p>
            </div>

            {/* Job location */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">Job location</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.job_location.name}
              </p>
            </div>

            {/* salary (monthly)  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">salary (monthly)</h5>
              <p className="info-detail">
                <span>{singleJobPost && singleJobPost.min_salary}</span> -
                <span>{singleJobPost && singleJobPost.max_salary}</span> tk
              </p>
            </div>

            {/* per policy  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">per policy</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.per_policy}
              </p>
            </div>

            {/* show salary  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">show salary</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.show_salary ? "Yes" : "No"}
              </p>
            </div>
            {/*  Compare Salary  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">Compare Salary</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_compare ? "Yes" : "No"}
              </p>
            </div>
            {/*  Show alert */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading"> Show alert</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.show_alert ? "Yes" : "No"}
              </p>
            </div>
            {/* additional salary info  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">additional salary info</h5>

              <p className="info-detail">
                {singleJobPost && singleJobPost.additional_salary_info}
              </p>
            </div>

            {/* compensation and benefits */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">compensation and benefits</h5>
              <p className="info-detail">
                {Array.isArray(
                  singleJobPost && singleJobPost.compensation_and_benefits
                )
                  ? singleJobPost &&
                    singleJobPost.compensation_and_benefits.length > 0
                    ? singleJobPost.compensation_and_benefits.map(
                        (item, index) => <span key={index}>{item + ","}</span>
                      )
                    : "null"
                  : singleJobPost && singleJobPost.compensation_and_benefits}
              </p>
            </div>

            {/*  lunch facilities  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading"> lunch facilities</h5>
              <p className="info-detail">
                {Array.isArray(singleJobPost && singleJobPost.lunch_facilities)
                  ? singleJobPost && singleJobPost.lunch_facilities.length > 0
                    ? singleJobPost.lunch_facilities.map((item, index) => (
                        <span key={index}>{item + ","}</span>
                      ))
                    : "null"
                  : singleJobPost && singleJobPost.lunch_facilities}
              </p>
            </div>
            {/* salary review  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">salary review</h5>
              <p className="info-detail">
                {Array.isArray(singleJobPost && singleJobPost.salary_review)
                  ? singleJobPost && singleJobPost.salary_review.length > 0
                    ? singleJobPost.salary_review.map((item, index) => (
                        <span key={index}>{item + ","}</span>
                      ))
                    : "null"
                  : singleJobPost && singleJobPost.salary_review}
              </p>
            </div>

            {/*  num of fastival bonous  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading"> num of fastival bonous</h5>

              <p className="info-detail">
                {singleJobPost && singleJobPost.num_of_fastival_bonous}
              </p>
            </div>

            {/*   other benefits  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading"> other benefits</h5>

              <p className="info-detail">
                {singleJobPost && singleJobPost.other}
              </p>
            </div>
          </div>

          {/* Candidate Requirements */}
          <div className="row my-3 bg-white rounded">
            <div className="col-12 mt-0 mb-2">
              <h3 className="group-title">
                <FontAwesomeIcon
                  className="me-2"
                  icon={["fas", "info-circle"]}
                />
                Candidate Requirements
              </h3>
            </div>
            {/* Educational Qualification  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">Educational Qualification</h5>

              <p className="info-detail">
                {singleJobPost && singleJobPost.degree_level}
                {", "}
                {singleJobPost && singleJobPost.degree_name}
                {", "}
                {singleJobPost && singleJobPost.major_in}
              </p>
            </div>
            {/*  prefered educational institutions  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">
                {" "}
                prefered educational institutions
              </h5>
              <p className="info-detail">
                {singleJobPost &&
                  singleJobPost.prefered_educational_institutions}
              </p>
            </div>
            {/* other educational qualifications  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">other educational qualifications</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.other_educational_qualifications
                  ? singleJobPost.other_educational_qualifications
                  : "null"}
              </p>
            </div>
            {/* training or trade cources */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">training or trade cources</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.training_or_trade_cources
                  ? singleJobPost.training_or_trade_cources
                  : "null"}
              </p>
            </div>
            {/* professional certifications  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">professional certifications</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.professional_certifications
                  ? singleJobPost.professional_certifications
                  : "null"}
              </p>
            </div>
            {/* experience  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">experience</h5>

              <p className="info-detail">
                required :
                {singleJobPost && singleJobPost.experience_required
                  ? "Yes"
                  : "No"}
              </p>
              <p className="info-detail">
                {singleJobPost && singleJobPost.min_experience
                  ? singleJobPost.min_experience
                  : "null"}
                {" - "}
                {singleJobPost && singleJobPost.min_experience
                  ? singleJobPost.max_experience
                  : "null"}{" "}
                years
              </p>
            </div>

            {/* fresher can apply  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">fresher can apply</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.fresher_can_apply
                  ? "Yes"
                  : "No"}
              </p>
            </div>
            {/* area of experience  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">area of experience</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.area_of_experience}
              </p>
            </div>
            {/* area of business  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">area of business</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.area_of_business}
              </p>
            </div>
            {/* skills  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">skills</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.skills}
              </p>
            </div>
            {/* additional requirements  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">additional requirements</h5>
              <p className="info-detail">
                {singleJobPost.additional_requirements
                  ? singleJobPost.additional_requirements
                  : "null"}
              </p>
            </div>
            {/* age  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">age</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.min_age}
                {" - "}
                {singleJobPost && singleJobPost.max_age} years
              </p>
            </div>
            {/* gender  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">gender</h5>
              <p className="info-detail">
                {Array.isArray(singleJobPost && singleJobPost.gender)
                  ? singleJobPost && singleJobPost.gender.length > 0
                    ? singleJobPost.gender.map((item, index) => (
                        <span key={index}>{item + ","}</span>
                      ))
                    : "null"
                  : singleJobPost && singleJobPost.gender}
              </p>
            </div>
            {/* person with disability can apply  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">person with disability can apply</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.person_with_disability_can_apply
                  ? "Yes"
                  : "No"}
              </p>
            </div>
          </div>

          {/* Company Information Visibility */}
          <div className="row my-3 bg-white rounded">
            <div className="col-12 mt-0 mb-2">
              <h3 className="group-title">
                <FontAwesomeIcon
                  className="me-2"
                  icon={["fas", "info-circle"]}
                />
                Company Information Visibility
              </h3>
            </div>

            {/*  industry type  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">industry type</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.which_industry_type_to_show}
              </p>
            </div>

            {/* company name  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">company name</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.company_name_show
                  ? "Yes"
                  : "No"}
              </p>
            </div>

            {/* company address  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">company address</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.company_address_show
                  ? "Yes"
                  : "No"}
              </p>
            </div>

            {/* company business  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">company business</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.company_business_show
                  ? "Yes"
                  : "No"}
              </p>
            </div>
          </div>

          {/* matching Criteria  */}
          <div className="row my-3 bg-white rounded">
            <div className="col-12 mt-0 mb-2">
              <h3 className="group-title">
                <FontAwesomeIcon
                  className="me-2"
                  icon={["fas", "info-circle"]}
                />
                matching Criteria
              </h3>
            </div>
            {/* is_age  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">age</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_age ? "Yes" : "No"}
              </p>
            </div>

            {/* is_age_mendatory  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">age mendatory</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_age_mendatory ? "Yes" : "No"}
              </p>
            </div>

            {/* is_gender */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">gender</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_gender ? "Yes" : "No"}
              </p>
            </div>

            {/* is_gender_mendatory */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">gender mendatory</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_gender_mendatory
                  ? "Yes"
                  : "No"}
              </p>
            </div>

            {/* is_total_year_experience  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">total year experience</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_total_year_experience
                  ? "Yes"
                  : "No"}
              </p>
            </div>

            {/* is_experience_mendatory  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">experience mendatory</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_experience_mendatory
                  ? "Yes"
                  : "No"}
              </p>
            </div>

            {/* is_area_of_experience */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">is area of experience</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_area_of_experience
                  ? "Yes"
                  : "No"}
              </p>
            </div>

            {/* is_skills  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">skills</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_skills ? "Yes" : "No"}
              </p>
            </div>

            {/* is_area_of_business */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">is_area_of_business</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_area_of_business
                  ? "Yes"
                  : "No"}
              </p>
            </div>

            {/* is_location */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">is_location</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_location ? "Yes" : "No"}
              </p>
            </div>

            {/* is_location_mendatory  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">is_location_mendatory</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_location_mendatory
                  ? "Yes"
                  : "No"}
              </p>
            </div>

            {/* is_salary_range */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">is_salary_range</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_salary_range ? "Yes" : "No"}
              </p>
            </div>

            {/* is_job_level */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">is_job_level</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.is_job_level ? "Yes" : "No"}
              </p>
            </div>

            {/* cover_letter_required */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">cover letter required</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.cover_letter_required
                  ? "Yes"
                  : "No"}
              </p>
            </div>

            {/* rusume_required */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">rusume required</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.rusume_required ? "Yes" : "No"}
              </p>
            </div>
            {/* cv_required  */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">Curriculum Vitae</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.cv_required ? "Yes" : "No"}
              </p>
            </div>

            {/* NID_no_required */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">NID no.</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.NID_no_required ? "Yes" : "No"}
              </p>
            </div>

            {/* passport_required */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">passport required</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.passport_required
                  ? "Yes"
                  : "No"}
              </p>
            </div>

            {/* driving_lisence_no_required */}
            <div className="col-md-4 mt-2">
              <h5 className="info-heading">driving lisence no required</h5>
              <p className="info-detail">
                {singleJobPost && singleJobPost.driving_lisence_no_required
                  ? "Yes"
                  : "No"}
              </p>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default JobDetails;
