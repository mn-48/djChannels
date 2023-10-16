import React, { useState } from "react";
import { useOutletContext, useNavigate } from "react-router-dom";

import { useForm, Controller } from "react-hook-form";
import CreatableSelect from "react-select/creatable";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";

// svg icon
import { ReactComponent as CreateJobImage } from "../../images/new/svg/plus.svg";
import { ReactComponent as JobsUpdateImage } from "../../images/new/svg/briefcase.svg";

import "./Organizations.css";

const CreateNewJob = ({ formType, singleJobPost }) => {
  // outlet context
  const { orgData, threeCategory } = useOutletContext();

  // navigate
  const navigate = useNavigate();

  // form step handler state
  const [jobFormStep, setJobFormStep] = useState(0);
  // experience required
  const [expReq, setExpReq] = useState(false);
  const [submitBtnState, setSubmitBtnState] = useState(false);
  // get form data before submit
  const [beforeSubmit, setBeforeSubmit] = useState({});
  const [countryFilter, setCountryFilter] = useState(null);
  const [stateFilter, setStateFilter] = useState(null);
  const [cityFilter, setCityFilter] = useState(null);
  const [degreeFilter, setDegreeFilter] = useState(null);
  const [eduMajor, setEduMajor] = useState(null);

  // send resume option handler
  const [sendResume, setSendResume] = useState({
    email: true,
    hardCopy: false,
  });

  // react hook form
  const {
    control,
    register,
    handleSubmit,
    watch,
    getValues,
    setValue,
    formState: { isValid },
  } = useForm({ mode: "all" });

  console.log(watch("example")); // watch input value by passing the name of it

  // form next step state handler
  const jobFormNextStepHandler = () => {
    setJobFormStep(jobFormStep + 1);
  };

  // form previous step state handler
  const jobFormPrevStepHandler = () => {
    setJobFormStep(jobFormStep - 1);
  };

  // render previous step button dynamically
  const renderJobPrevButton = () => {
    if (jobFormStep > 0 && jobFormStep < 5) {
      return (
        <button
          type="button"
          className="btn form-prev-step-button text-dark"
          onClick={jobFormPrevStepHandler}
        >
          <FontAwesomeIcon
            className="me-2"
            icon={["fas", "arrow-alt-circle-left"]}
          />
          Prev Page
        </button>
      );
    }
  };

  // job post item for updateform
  const singleJobPostItems = singleJobPost && singleJobPost;
  let preEduIns = [];
  let areaOfExperience = [];
  let areaOfBusiness = [];
  let skills = [];

  if (formType === "updateJob") {
    // prefered_educational_institutions for update
    let preEduInsw = [];
    preEduInsw =
      singleJobPostItems &&
      singleJobPostItems.prefered_educational_institutions.split(",");

    preEduInsw.pop();

    preEduIns = preEduInsw.map((item, index) => {
      if (item.length > 0) {
        return { value: item, label: item };
      }
    });

    // area_of_experience for update
    let areaOfExp = [];
    areaOfExp =
      singleJobPostItems && singleJobPostItems.area_of_experience.split(",");

    areaOfExp.pop();

    areaOfExperience = areaOfExp.map((item, index) => {
      if (item.length > 0) {
        return { value: item, label: item };
      }
    });

    // area_of_business for update
    let areaOfBusn = [];
    areaOfBusn =
      singleJobPostItems && singleJobPostItems.area_of_business.split(",");

    areaOfBusn.pop();

    areaOfBusiness = areaOfExp.map((item, index) => {
      if (item.length > 0) {
        return { value: item, label: item };
      }
    });

    // skills for update
    let skillsSet = [];
    skillsSet = singleJobPostItems && singleJobPostItems.skills.split(",");

    skillsSet.pop();

    skills = skillsSet.map((item, index) => {
      if (item.length > 0) {
        return { value: item, label: item };
      }
    });
  }

  // location handlers
  // country handler
  const countryHandler = (country) => {
    setCountryFilter(
      country.map((title, index) => (
        <option
          key={index}
          onClick={() => stateHandler(title.state ? title.state : [])}
        >
          {title.name}
        </option>
      ))
    );
  };

  // state handler
  const stateHandler = (state) => {
    setStateFilter(
      state.map((item, indx) => (
        <option
          key={indx}
          onClick={() => cityHandler(item.city ? item.city : [])}
        >
          {item.name}
        </option>
      ))
    );
  };

  // city handler
  const cityHandler = (city) => {
    setCityFilter(
      city.map((item, indx) => (
        <option key={indx} value={item.id}>
          {item.name}
        </option>
      ))
    );
  };

  // education level's degree handler
  const eduDegreeHandler = (degrees) => {
    setDegreeFilter(
      degrees.map((title, index) => (
        <option
          key={index}
          value={title.name}
          onClick={() => eduMajorHandler(title.major_in ? title.major_in : [])}
        >
          {title.name}
        </option>
      ))
    );
  };

  // education degree's major handler
  const eduMajorHandler = (major) => {
    setEduMajor(
      major.map((major_name, m_indx) => (
        <option key={m_indx} value={major_name.name}>
          {major_name.name}
        </option>
      ))
    );
  };

  // multi select creatable dynamic options
  const prefEduInst =
    threeCategory.prefered_educational_institutions &&
    threeCategory.prefered_educational_institutions.map((inst, index) => {
      return {
        value: inst.name,
        label: inst.name,
      };
    });

  const allAreaOfExp =
    threeCategory.area_of_experience &&
    threeCategory.area_of_experience.map((exp, index) => {
      return {
        value: exp.name,
        label: exp.name,
      };
    });

  const allAreaOfBusi =
    threeCategory.area_of_business &&
    threeCategory.area_of_business.map((busi, index) => {
      return {
        value: busi.name,
        label: busi.name,
      };
    });

  const allSkills =
    threeCategory.skills &&
    threeCategory.skills.map((busi, index) => {
      return {
        value: busi.name,
        label: busi.name,
      };
    });

  // form submit handler
  const createJobPost = async (data) => {
    // let prefered_educational_institutions = "";
    // let area_of_experience = "";
    // let area_of_business = "";
    // let skills = "";

    // for (let j in data) {
    //   if (data[j] === true) {
    //     data[j] = 1;
    //   } else if (data[j] === false) {
    //     data[j] = 0;
    //   } else if (j === "employment_status") {
    //     data[j] = data[j].toString();
    //   } else if (j === "job_level") {
    //     data[j] = data[j].toString();
    //   } else if (j === "workplace") {
    //     data[j] = data[j].toString();
    //   } else if (j === "compensation_and_benefits") {
    //     data[j] = data[j].toString();
    //   } else if (j === "lunch_facilities") {
    //     data[j] = data[j].toString();
    //   } else if (j === "salary_review") {
    //     data[j] = data[j].toString();
    //   } else if (j === "gender") {
    //     data[j] = data[j].toString();
    //   } else if (j === "prefered_educational_institutions") {
    //     if (data[j].length > 0) {
    //       data[j].forEach((item, index) => {
    //         prefered_educational_institutions += item.value + ",";
    //         data[j] = prefered_educational_institutions;
    //       });
    //     } else {
    //       data[j] = "";
    //     }
    //   } else if (j === "area_of_experience") {
    //     if (data[j].length > 0) {
    //       data[j].forEach((item, index) => {
    //         area_of_experience += item.value + ",";
    //         data[j] = area_of_experience;
    //       });
    //     } else {
    //       data[j] = "";
    //     }
    //   } else if (j === "area_of_business") {
    //     if (data[j].length > 0) {
    //       data[j].forEach((item, index) => {
    //         area_of_business += item.value + ",";
    //         data[j] = area_of_business;
    //       });
    //     } else {
    //       data[j] = "";
    //     }
    //   } else if (j === "skills") {
    //     if (data[j].length > 0) {
    //       data[j].forEach((item, index) => {
    //         skills += item.value + ",";
    //         data[j] = skills;
    //       });
    //     } else {
    //       data[j] = "";
    //     }
    //   }
    // }

    // configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    // create job post request
    if (formType === "updateJob") {
      axios
        .patch(
          `http://127.0.0.1:8000/api/employer/jobpost/${singleJobPostItems.id}/`,
          data,
          config
        )
        .then((res) => {
          console.log("jobspost updated successfully");
          navigate("/organizations-dashboard", { replace: true });
        })
        .catch((err) => {
          console.log("job post does not updated : ", err);
          setJobFormStep(0);
        });
    } else {
      axios
        .post("http://127.0.0.1:8000/api/employer/jobpost/", data, config)
        .then((res) => {
          console.log("jobspost created successfully");
          navigate("/organizations-dashboard", { replace: true });
        })
        .catch((err) => {
          console.log("job post does not created : ", err);
          setJobFormStep(0);
        });
    }
  };

  return (
    <div className="org-dashboard-accordion-items-content">
      {/* title  */}
      <div div className="active-org-item">
        {formType === "createJob" ? (
          <>
            <div className="org-title-icon">
              <CreateJobImage className="org-svg-color" />
            </div>

            <div className="flex-grow-1">
              <h2 className="org-content-title">Create Jobs</h2>
              <p className="org-content-message">Create New Jobs</p>
            </div>
          </>
        ) : (
          <div className="d-flex  align-items-center mx-3 py-1 my-1 px-3">
            <div className="organization-icon">
              <JobsUpdateImage />
            </div>
            <div className="flex-grow-1">
              <h2>Update Job Post</h2>
            </div>
          </div>
        )}
      </div>

      {/* create jobs form  */}
      <div className="row rounded mx-0">
        <form onSubmit={handleSubmit(createJobPost)}>
          {/* form step 0  */}
          {jobFormStep === 0 && (
            <>
              <div className="row gy-2 my-2 pt-2 pb-3 bg-white rounded">
                {/* choose organization  */}
                <div className="col-12 mb-3 pb-3">
                  <label
                    htmlFor="employer"
                    className="form-label mb-1 group-title"
                  >
                    Choose Organization
                    <span className="required-icon-color ">*</span>
                  </label>

                  <select
                    className="form-control form-input-placeholder-text-size"
                    id="employer"
                    {...register("employer", { required: true })}
                  >
                    {formType === "updateJob" ? (
                      <option value={singleJobPostItems.employer.id}>
                        {singleJobPostItems.employer.username}
                      </option>
                    ) : (
                      <>
                        <option value="">--- Select Organization ---</option>
                        {orgData.length > 0 &&
                          orgData.map((item, index) => (
                            <option key={index} value={item.id}>
                              {item.username}
                            </option>
                          ))}
                      </>
                    )}
                  </select>
                </div>

                {/* Job primary information  */}
                <div className="col-12 mt-0">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    Job primary information
                  </h3>
                </div>

                {/* job_title */}
                <div className="col-md-6">
                  <label
                    htmlFor="job_title"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    job title<span className="required-icon-color ">*</span>
                  </label>

                  <input
                    type="text"
                    className="form-control form-input-placeholder-text-size"
                    id="job_title"
                    {...register("job_title", { required: true })}
                    placeholder="Ex: React/Django Developer"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.job_title
                        : ""
                    }
                  />
                </div>

                {/* vacancies */}
                <div className="col-md-6">
                  <label
                    htmlFor="vacancies"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    number of vacancies
                    <span className="required-icon-color ">*</span>
                  </label>

                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="vacancies"
                    {...register("vacancies", { required: true })}
                    placeholder="Ex 100"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.vacancies
                        : ""
                    }
                  />
                </div>

                {/* functional category  */}
                <div className="col-md-6">
                  <label
                    htmlFor="functional_category"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    functional category
                    <span className="required-icon-color ">*</span>
                  </label>

                  <select
                    className="form-control form-input-placeholder-text-size"
                    id="functional_category"
                    {...register("functional_category", { required: true })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.functional_category.id
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.functional_category.name
                        : "--- Select ---"}
                    </option>

                    {threeCategory.functional_cat &&
                      threeCategory.functional_cat.map((functional, index) => {
                        return (
                          <option key={index} value={functional.id}>
                            {functional.name}
                          </option>
                        );
                      })}
                  </select>
                </div>

                {/* special_skills_category  */}
                <div className="col-md-6">
                  <label
                    htmlFor="special_skills_category"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    special skills category
                    <span className="required-icon-color ">*</span>
                  </label>

                  <select
                    className="form-control form-input-placeholder-text-size"
                    id="special_skills_category"
                    {...register("special_skills_category", { required: true })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.special_skills_category.id
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.special_skills_category.name
                        : "--- Select ---"}
                    </option>
                    {threeCategory?.special_skills_category &&
                      threeCategory.special_skills_category.map(
                        (category, index) => {
                          return (
                            <option key={index} value={category.id}>
                              {category.name}
                            </option>
                          );
                        }
                      )}
                  </select>
                </div>

                {/* industry category  */}
                <div className="col-md-6">
                  <label
                    htmlFor="industry_category"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    industry category
                    <span className="required-icon-color ">*</span>
                  </label>

                  <select
                    className="form-control form-input-placeholder-text-size"
                    id="industry_category"
                    {...register("industry_category", { required: true })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.industry_category.id
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.industry_category.name
                        : "--- Select ---"}
                    </option>
                    {threeCategory.industry_cat &&
                      threeCategory.industry_cat.map((type, index) => {
                        return (
                          <option key={index} value={type.id}>
                            {type.name}
                          </option>
                        );
                      })}
                  </select>
                </div>

                {/* deadline */}
                <div className="col-md-6">
                  <label
                    htmlFor="deadline"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    deadline
                    <span className="required-icon-color">*</span>
                  </label>

                  <input
                    type="date"
                    className="form-control form-input-placeholder-text-size"
                    id="deadline"
                    {...register("deadline", { required: true })}
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.deadline
                        : ""
                    }
                  />
                </div>

                {/* employment_status  */}
                <div className="col-md-6">
                  <label
                    htmlFor="employment_status"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    employment status
                    <span className="required-icon-color ">*</span>
                  </label>

                  <div className="d-flex flex-wrap justify-content-start">
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="employment_status1"
                        autoComplete="off"
                        {...register("employment_status", { required: true })}
                        value="full_time"
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.employment_status.length > 0
                              ? singleJobPostItems.employment_status.includes(
                                  "full_time"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="employment_status1"
                      >
                        Full Time
                      </label>
                    </div>

                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="employment_status2"
                        autoComplete="off"
                        {...register("employment_status", { required: true })}
                        value="part_time"
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.employment_status.length > 0
                              ? singleJobPostItems.employment_status.includes(
                                  "part_time"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="employment_status2"
                      >
                        Part Time
                      </label>
                    </div>

                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="employment_status3"
                        autoComplete="off"
                        {...register("employment_status", { required: true })}
                        value="contractual"
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.employment_status.length > 0
                              ? singleJobPostItems.employment_status.includes(
                                  "contractual"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="employment_status3"
                      >
                        Contractual
                      </label>
                    </div>

                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="employment_status4"
                        autoComplete="off"
                        {...register("employment_status", { required: true })}
                        value="internship"
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.employment_status.length > 0
                              ? singleJobPostItems.employment_status.includes(
                                  "internship"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="employment_status4"
                      >
                        Internship
                      </label>
                    </div>

                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="employment_status5"
                        autoComplete="off"
                        {...register("employment_status", { required: true })}
                        value="freelancer"
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.employment_status.length > 0
                              ? singleJobPostItems.employment_status.includes(
                                  "freelancer"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="employment_status5"
                      >
                        <i className="icon-check-sign toggle"></i>
                        Freelance
                      </label>
                    </div>
                  </div>
                </div>

                {/* resume_receiveing_option  */}
                <div className="col-md-6">
                  <div>
                    <label className="form-label mb-1 multi-step-form-label-name">
                      resume receiving option
                      <span className="required-icon-color ">*</span>
                    </label>
                  </div>

                  <div>
                    <div className="mb-2">
                      {/* by email  */}
                      <label
                        className={
                          sendResume.email
                            ? "me-1 btn btn-outline-secondary btn-sm create-job-btn-check create-job-btn-check-resume-active"
                            : "me-1 btn btn-outline-secondary btn-sm create-job-btn-check"
                        }
                        htmlFor="by_email"
                        onClick={() => {
                          setSendResume({
                            ...sendResume,
                            email: true,
                            hardCopy: false,
                          });
                          setValue("resume_receiveing_option", "");
                        }}
                      >
                        Email
                      </label>

                      <span className="form-input-placeholder-text-size">
                        {""}
                        --OR--{" "}
                      </span>

                      {/* Hard Copy  */}
                      <label
                        className={
                          sendResume.hardCopy
                            ? "me-1 btn btn-outline-secondary btn-sm create-job-btn-check create-job-btn-check-resume-active"
                            : "me-1 btn btn-outline-secondary btn-sm create-job-btn-check"
                        }
                        htmlFor="hard_copy"
                        onClick={() => {
                          setSendResume({
                            ...sendResume,
                            email: false,
                            hardCopy: true,
                          });
                          setValue("resume_receiveing_option", "");
                        }}
                      >
                        Hard Copy
                      </label>
                    </div>

                    <div className="mb-2">
                      {sendResume.email && (
                        <input
                          type="email"
                          className="form-control form-input-placeholder-text-size text-lowercase"
                          id="by_email"
                          {...register("resume_receiveing_option", {
                            required: true,
                          })}
                          placeholder="Enter Your Company mail"
                          defaultValue={
                            formType === "updateJob"
                              ? singleJobPostItems.resume_receiveing_option
                              : ""
                          }
                        />
                      )}
                      {sendResume.hardCopy && (
                        <textarea
                          className="form-control form-input-placeholder-text-size text-lowercase"
                          id="hard_copy"
                          {...register("resume_receiveing_option", {
                            required: true,
                          })}
                          placeholder="Enter Your Company Address"
                          defaultValue={
                            formType === "updateJob"
                              ? singleJobPostItems.resume_receiveing_option
                              : ""
                          }
                        ></textarea>
                      )}
                    </div>
                  </div>
                </div>

                {/* special_instruction  */}
                <div className="col-md-6">
                  <label
                    htmlFor="special_instruction"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    special instruction for jobs seekers
                    <span className="required-icon-color ">*</span>
                  </label>

                  <textarea
                    className="form-control form-input-placeholder-text-size"
                    id="special_instruction"
                    {...register("special_instruction", {
                      required: true,
                    })}
                    placeholder="Ex: new"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.special_instruction
                        : ""
                    }
                  ></textarea>
                </div>

                {/* photograph_enclosed  */}
                <div className="col-md-6">
                  <div>
                    <label className="form-label mb-1 multi-step-form-label-name">
                      photograph enclosed
                    </label>
                  </div>

                  <div className="form-check form-switch">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="photograph_enclosed"
                    >
                      No/Yes
                    </label>

                    <input
                      className="form-check-input"
                      type="checkbox"
                      id="photograph_enclosed"
                      {...register("photograph_enclosed")}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.photograph_enclosed
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>
                </div>
              </div>
            </>
          )}

          {/* form step 1  */}
          {jobFormStep === 1 && (
            <>
              {/* more job information  */}
              <div className="row gy-2 my-2 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    More Job Information
                  </h3>
                </div>

                {/* job_level  */}
                <div className="col-md-6">
                  <label
                    htmlFor="job_level"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    job level
                    <span className="required-icon-color">*</span>
                  </label>

                  <div
                    className="d-flex flex-wrap justify-content-start"
                    id="job_level"
                  >
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="job_level1"
                        autoComplete="off"
                        value="entry"
                        {...register("job_level", { required: true })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.job_level.length > 0
                              ? singleJobPostItems.job_level.includes("entry")
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="job_level1"
                      >
                        Entry
                      </label>
                    </div>

                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="job_level2"
                        autoComplete="off"
                        value="mid"
                        {...register("job_level", { required: true })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.job_level.length > 0
                              ? singleJobPostItems.job_level.includes("mid")
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="job_level2"
                      >
                        Mid
                      </label>
                    </div>

                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="job_level3"
                        autoComplete="off"
                        value="top"
                        {...register("job_level", { required: true })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.job_level.length > 0
                              ? singleJobPostItems.job_level.includes("top")
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="job_level3"
                      >
                        Top
                      </label>
                    </div>
                  </div>
                </div>

                {/* job_context  */}
                <div className="col-md-6">
                  <label
                    htmlFor="job_context"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    job context
                    <span className="required-icon-color">*</span>
                  </label>

                  <textarea
                    className="form-control form-input-placeholder-text-size"
                    id="job_context"
                    {...register("job_context", { required: true })}
                    placeholder="Ex: explain job context"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.job_context
                        : ""
                    }
                  ></textarea>
                </div>

                {/* job_responsibilities */}
                <div className="col-md-6">
                  <label
                    htmlFor="job_responsibilities"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    job responsibilities
                    <span className="required-icon-color ">*</span>
                  </label>

                  <textarea
                    className="form-control form-input-placeholder-text-size"
                    id="job_responsibilities"
                    {...register("job_responsibilities", { required: true })}
                    placeholder="Explain job responsibility..."
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.job_responsibilities
                        : ""
                    }
                  ></textarea>
                </div>

                {/* workplace  */}
                <div className="col-md-6">
                  <div>
                    <label className="form-label mb-1 multi-step-form-label-name">
                      workplace
                      <span className="required-icon-color">*</span>
                    </label>
                  </div>

                  <div className="form-check form-check-inline">
                    <label
                      className="form-check-label"
                      htmlFor="work-at-office"
                    >
                      Work at office
                    </label>
                    <input
                      type="checkbox"
                      className="form-check-input"
                      id="work-at-office"
                      value="office"
                      {...register("workplace", { required: true })}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.workplace.length > 0
                            ? singleJobPostItems.workplace.includes("office")
                              ? true
                              : false
                            : false
                          : false
                      }
                    />
                  </div>

                  <div className="form-check form-check-inline">
                    <label
                      className="form-check-label"
                      htmlFor="work-from-home"
                    >
                      Work from home
                    </label>
                    <input
                      type="checkbox"
                      className="form-check-input"
                      id="work-from-home"
                      value="home"
                      {...register("workplace", { required: true })}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.workplace.length > 0
                            ? singleJobPostItems.workplace.includes("home")
                              ? true
                              : false
                            : false
                          : false
                      }
                    />
                  </div>
                </div>

                {/* continents/location */}
                <div className="col-sm-6">
                  <label
                    htmlFor="continents"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    continents/location
                    <span className="required-icon-color">*</span>
                  </label>
                  <select
                    className="form-select form-input-placeholder-text-size"
                    id="continents"
                    {...register("job_location1", { required: true })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.job_location.state.country
                              .continent.id
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.job_location.state.country
                            .continent.name
                        : "--- Select ---"}
                    </option>
                    {threeCategory?.continents &&
                      threeCategory.continents.map((item, index) => (
                        <option
                          key={index}
                          onClick={() =>
                            countryHandler(item.country ? item.country : [])
                          }
                        >
                          {item.name}
                        </option>
                      ))}
                  </select>
                </div>

                {/* country */}
                <div className="col-sm-6">
                  <label
                    htmlFor="country"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    country
                    <span className="required-icon-color">*</span>
                  </label>
                  <select
                    className="form-select form-input-placeholder-text-size"
                    id="country"
                    {...register("job_location2", { required: true })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.job_location.state.country.id
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.job_location.state.country.name
                        : "--- Select ---"}
                    </option>

                    {countryFilter}
                  </select>
                </div>

                {/* state */}
                <div className="col-sm-6">
                  <label
                    htmlFor="state"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    state
                    <span className="required-icon-color ">*</span>
                  </label>

                  <select
                    className="form-select form-input-placeholder-text-size"
                    id="state"
                    {...register("job_location3", { required: true })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.job_location.state.id
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.job_location.state.name
                        : "--- Select ---"}
                    </option>

                    {stateFilter}
                  </select>
                </div>

                {/* city */}
                <div className="col-sm-6">
                  <label
                    htmlFor="city"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    city
                    <span className="required-icon-color">*</span>
                  </label>

                  <select
                    className="form-select form-input-placeholder-text-size"
                    id="city"
                    {...register("job_location", { required: true })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.job_location.id
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.job_location.name
                        : "--- Select ---"}
                    </option>

                    {cityFilter}
                  </select>
                </div>

                {/* min_salary  */}
                <div className="col-md-6">
                  <label
                    htmlFor="min_salary"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    min salary (monthly)
                    <span className="required-icon-color">*</span>
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="min_salary"
                    {...register("min_salary", { required: true })}
                    placeholder="Ex: 100000"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.min_salary
                        : ""
                    }
                  />
                </div>

                {/* max_salary */}
                <div className="col-md-6">
                  <label
                    htmlFor="max_salary"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    max salary (monthly)
                    <span className="required-icon-color">*</span>
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="max_salary"
                    {...register("max_salary", { required: true })}
                    placeholder="Ex: new"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.max_salary
                        : ""
                    }
                  />
                </div>

                {/* per_policy */}
                <div className="col-md-6">
                  <label
                    htmlFor="per_policy"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    per policy
                    <span className="required-icon-color ">*</span>
                  </label>

                  <textarea
                    className="form-control form-input-placeholder-text-size"
                    id="per_policy"
                    {...register("per_policy", { required: true })}
                    placeholder="Explain per_policy..."
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.per_policy
                        : ""
                    }
                  ></textarea>
                </div>

                {/* show_salary  */}
                <div className="col-12">
                  <div>
                    <label className="form-check-label multi-step-form-label-name">
                      show salary
                      <span className="required-icon-color ">*</span>
                    </label>
                  </div>

                  <div className="form-check form-check-inline">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="show_salary"
                    >
                      show salary
                    </label>
                    <input
                      type="radio"
                      className="form-check-input"
                      id="show_salary"
                      {...register("show_salary", { required: true })}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.show_salary
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>

                  <div className="form-check form-check-inline">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="show_negotiable"
                    >
                      show negotiable
                    </label>
                    <input
                      type="radio"
                      className="form-check-input"
                      id="show_negotiable"
                      {...register("show_salary", { required: true })}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.show_salary
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>
                </div>

                {/* Compare Salary */}
                <div className="col-12">
                  <div>
                    <label className="form-label mb-1 multi-step-form-label-name">
                      Compare Salary
                    </label>
                  </div>
                  <div className="form-check form-switch">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="is_compare"
                    >
                      compare with applicants provided expected salary
                    </label>

                    <input
                      className="form-check-input"
                      type="checkbox"
                      id="is_compare"
                      {...register("is_compare")}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.is_compare
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>
                </div>

                {/* show_alert  */}
                <div className="col-12">
                  <div>
                    <label className="form-label mb-1 multi-step-form-label-name">
                      Show alert
                    </label>
                  </div>

                  <div className="form-check form-switch">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="show_alert"
                    >
                      alert applicant
                    </label>

                    <input
                      className="form-check-input"
                      type="checkbox"
                      id="show_alert"
                      {...register("show_alert")}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.show_alert
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>
                </div>

                {/* additional_salary_info  */}
                <div className="col-md-6">
                  <label
                    htmlFor="additional_salary_info"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    additional salary info
                    <span className="required-icon-color ">*</span>
                  </label>

                  <textarea
                    className="form-control form-input-placeholder-text-size"
                    id="additional_salary_info"
                    {...register("additional_salary_info", { required: true })}
                    placeholder="Ex: new"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.additional_salary_info
                        : ""
                    }
                  ></textarea>
                </div>

                {/* compensation_and_benefits */}
                <div className="col-md-6">
                  <label
                    htmlFor="compensation_and_benefits"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    compensation and benefits
                    <span className="required-icon-color ">*</span>
                  </label>

                  {/* mobile bill  */}
                  <div
                    className="d-flex flex-wrap justify-content-start"
                    id="compensation_and_benefits"
                  >
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="compensation_and_benefits1"
                        autoComplete="off"
                        value="mobile bill"
                        {...register("compensation_and_benefits", {
                          required: true,
                        })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.compensation_and_benefits
                                .length > 0
                              ? singleJobPostItems.compensation_and_benefits.includes(
                                  "mobile bill"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="compensation_and_benefits1"
                      >
                        Mobile Bill
                      </label>
                    </div>

                    {/* pansion policy  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="compensation_and_benefits2"
                        autoComplete="off"
                        value="pansion"
                        {...register("compensation_and_benefits", {
                          required: true,
                        })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.compensation_and_benefits
                                .length > 0
                              ? singleJobPostItems.compensation_and_benefits.includes(
                                  "pansion"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="compensation_and_benefits2"
                      >
                        Pansion Policy
                      </label>
                    </div>

                    {/* tour allowance  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="compensation_and_benefits3"
                        autoComplete="off"
                        value="tour"
                        {...register("compensation_and_benefits", {
                          required: true,
                        })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.compensation_and_benefits
                                .length > 0
                              ? singleJobPostItems.compensation_and_benefits.includes(
                                  "tour"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="compensation_and_benefits3"
                      >
                        <i className="icon-check-sign toggle"></i>
                        Tour Allowance
                      </label>
                    </div>

                    {/* medical allowance  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="compensation_and_benefits4"
                        autoComplete="off"
                        value="medical"
                        {...register("compensation_and_benefits", {
                          required: true,
                        })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.compensation_and_benefits
                                .length > 0
                              ? singleJobPostItems.compensation_and_benefits.includes(
                                  "medical"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="compensation_and_benefits4"
                      >
                        <i className="icon-check-sign toggle"></i>
                        Medical Allowance
                      </label>
                    </div>

                    {/* performance bonus  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="compensation_and_benefits5"
                        autoComplete="off"
                        value="performance bonus"
                        {...register("compensation_and_benefits", {
                          required: true,
                        })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.compensation_and_benefits
                                .length > 0
                              ? singleJobPostItems.compensation_and_benefits.includes(
                                  "performance bonus"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="compensation_and_benefits5"
                      >
                        <i className="icon-check-sign toggle"></i>
                        Performance Bonus
                      </label>
                    </div>

                    {/* provident found  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="compensation_and_benefits6"
                        autoComplete="off"
                        value="provident found"
                        {...register("compensation_and_benefits", {
                          required: true,
                        })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.compensation_and_benefits
                                .length > 0
                              ? singleJobPostItems.compensation_and_benefits.includes(
                                  "provident found"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="compensation_and_benefits6"
                      >
                        <i className="icon-check-sign toggle"></i>
                        Provident Found
                      </label>
                    </div>

                    {/* weekly 2 holidys  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="compensation_and_benefits7"
                        autoComplete="off"
                        value="weekly 2 holidays"
                        {...register("compensation_and_benefits", {
                          required: true,
                        })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.compensation_and_benefits
                                .length > 0
                              ? singleJobPostItems.compensation_and_benefits.includes(
                                  "weekly 2 holidays"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="compensation_and_benefits7"
                      >
                        <i className="icon-check-sign toggle"></i>
                        Weekly 2 Holidays
                      </label>
                    </div>

                    {/* gratuity  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="compensation_and_benefits8"
                        autoComplete="off"
                        value="gratuity"
                        {...register("compensation_and_benefits", {
                          required: true,
                        })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.compensation_and_benefits
                                .length > 0
                              ? singleJobPostItems.compensation_and_benefits.includes(
                                  "gratuity"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="compensation_and_benefits8"
                      >
                        <i className="icon-check-sign toggle"></i>
                        Gratuity
                      </label>
                    </div>
                  </div>
                </div>

                {/* lunch_facilities */}
                <div className="col-md-6">
                  <label
                    htmlFor="lunch_facilities"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    lunch facilities
                    <span className="required-icon-color">*</span>
                  </label>

                  <div
                    className="d-flex flex-wrap justify-content-start"
                    id="lunch_facilities"
                  >
                    {/* pertially subsidize  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="lunch_facilities1"
                        autoComplete="off"
                        value="partially"
                        {...register("lunch_facilities", { required: true })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.lunch_facilities.length > 0
                              ? singleJobPostItems.lunch_facilities.includes(
                                  "partially"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="lunch_facilities1"
                      >
                        Partially Subsidize
                      </label>
                    </div>

                    {/* full subsidize  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="lunch_facilities2"
                        autoComplete="off"
                        value="full"
                        {...register("lunch_facilities", { required: true })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.lunch_facilities.length > 0
                              ? singleJobPostItems.lunch_facilities.includes(
                                  "full"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="lunch_facilities2"
                      >
                        Full Subsidize
                      </label>
                    </div>
                  </div>
                </div>

                {/* salary_review  */}
                <div className="col-md-6">
                  <label
                    htmlFor="salary_review"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    salary review
                    <span className="required-icon-color ">*</span>
                  </label>

                  <div
                    className="d-flex flex-wrap justify-content-start"
                    id="salary_review"
                  >
                    {/* yarly  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="salary_review1"
                        autoComplete="off"
                        value="Yearly"
                        {...register("salary_review", { required: true })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.salary_review.length > 0
                              ? singleJobPostItems.salary_review.includes(
                                  "Yearly"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="salary_review1"
                      >
                        Yearly
                      </label>
                    </div>

                    {/* Half yearly  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="salary_review2"
                        value="Half"
                        autoComplete="off"
                        {...register("salary_review", { required: true })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.salary_review.length > 0
                              ? singleJobPostItems.salary_review.includes(
                                  "Half"
                                )
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="salary_review2"
                      >
                        Half Yearly
                      </label>
                    </div>
                  </div>
                </div>

                {/* num_of_fastival_bonous */}
                <div className="col-md-6">
                  <label
                    htmlFor="num_of_fastival_bonous"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    num of fastival bonous
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="num_of_fastival_bonous"
                    {...register("num_of_fastival_bonous", { required: true })}
                    placeholder="Ex: 1/2/3/4"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.num_of_fastival_bonous
                        : ""
                    }
                  />
                </div>

                {/* other benefits */}
                <div className="col-md-6">
                  <label
                    htmlFor="other"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    other benefits
                    <span className="required-icon-color ">*</span>
                  </label>

                  <textarea
                    className="form-control form-input-placeholder-text-size"
                    id="other"
                    {...register("other", { required: true })}
                    placeholder="Ex: mention others benefits"
                    defaultValue={
                      formType === "updateJob" ? singleJobPostItems.other : ""
                    }
                  ></textarea>
                </div>
              </div>
            </>
          )}

          {/* form step 2  */}
          {jobFormStep === 2 && (
            <>
              {/* Candidate Requirements */}
              <div className="row gy-2 my-2 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    Candidate Requirements
                  </h3>
                </div>

                <div className="col-12 mt-3">
                  <h3 className="group-title text-dark">
                    Educational Qualification
                  </h3>
                </div>

                {/* degree_level */}
                <div className="col-sm-4">
                  <label
                    htmlFor="degree_level"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    degree level
                    <span className="required-icon-color">*</span>
                  </label>

                  <select
                    className="form-select form-input-placeholder-text-size"
                    id="degree_level"
                    {...register("degree_level", { required: true })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.degree_level
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.degree_level
                        : "--- Select ---"}
                    </option>
                    {threeCategory?.education_levels &&
                      threeCategory.education_levels.map((item, index) => (
                        <option
                          key={index}
                          onClick={() =>
                            eduDegreeHandler(item.degrees ? item.degrees : [])
                          }
                          value={item.name}
                        >
                          {item.name}
                        </option>
                      ))}
                  </select>
                </div>

                {/* degree_name */}
                <div className="col-sm-4">
                  <label
                    htmlFor="degree_name"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    degree name
                    <span className="required-icon-color">*</span>
                  </label>

                  <select
                    className="form-select form-input-placeholder-text-size"
                    id="degree_name"
                    {...register("degree_name", { required: true })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.degree_name
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.degree_name
                        : "--- Select ---"}
                    </option>
                    {degreeFilter}
                  </select>
                </div>

                {/* major_in */}
                <div className="col-sm-4">
                  <label
                    htmlFor="major_in"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    major in
                    <span className="required-icon-color">*</span>
                  </label>

                  <select
                    className="form-select form-input-placeholder-text-size"
                    id="major_in"
                    {...register("major_in", { required: true })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.major_in
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.major_in
                        : "--- Select ---"}
                    </option>
                    {eduMajor}
                  </select>
                </div>

                {/* prefered_educational_institutions */}
                <div className="col-md-6">
                  <label
                    htmlFor="prefered_educational_institutions"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    prefered educational institutions
                    <span className="required-icon-color ">*</span>
                  </label>

                  <Controller
                    name="prefered_educational_institutions"
                    control={control}
                    render={({ field }) => (
                      <CreatableSelect
                        {...field}
                        options={prefEduInst}
                        isMulti
                      />
                    )}
                    rules={{ required: true }}
                    defaultValue={formType === "updateJob" ? preEduIns : []}
                  />
                </div>

                {/* other_educational_qualifications  */}
                <div className="col-md-6">
                  <label
                    htmlFor="other_educational_qualifications"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    other educational qualifications
                  </label>

                  <textarea
                    className="form-control form-input-placeholder-text-size"
                    id="other_educational_qualifications"
                    {...register("other_educational_qualifications")}
                    placeholder="Ex: mention others benefits"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.other_educational_qualifications
                        : ""
                    }
                  ></textarea>
                </div>

                {/* training_or_trade_cources */}
                <div className="col-md-6">
                  <label
                    htmlFor="training_or_trade_cources"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    training or trade cources
                  </label>

                  <textarea
                    className="form-control form-input-placeholder-text-size"
                    id="training_or_trade_cources"
                    {...register("training_or_trade_cources")}
                    placeholder="Ex: training or trade cources"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.training_or_trade_cources
                        : ""
                    }
                  ></textarea>
                </div>

                {/* professional_certifications  */}
                <div className="col-md-6">
                  <label
                    htmlFor="professional_certifications"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    professional certifications
                    <span className="required-icon-color ">*</span>
                  </label>

                  <textarea
                    className="form-control form-input-placeholder-text-size"
                    id="professional_certifications"
                    {...register("professional_certifications", {
                      required: true,
                    })}
                    placeholder="Ex: professional certifications"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.professional_certifications
                        : ""
                    }
                  ></textarea>
                </div>

                {/* experience_required */}
                <div
                  className={expReq ? "col-4" : "col-12"}
                  onChange={(e) => setExpReq(!expReq)}
                >
                  <div htmlFor="experience_required">
                    <label
                      className="form-label mb-1 multi-step-form-label-name"
                      htmlFor="experience_required"
                    >
                      experience required
                    </label>
                  </div>

                  <div className="form-check form-switch">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="experience_required"
                    >
                      No/Yes
                    </label>

                    <input
                      className="form-check-input"
                      type="checkbox"
                      id="experience_required"
                      {...register("experience_required")}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.experience_required
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>
                </div>

                {expReq ? (
                  <>
                    {/* min_experience */}
                    <div className="col-4">
                      <label
                        htmlFor="min_experience"
                        className="form-label mb-1 multi-step-form-label-name"
                      >
                        min_experience{" "}
                        {expReq && (
                          <span className="required-icon-color ">*</span>
                        )}
                      </label>
                      <input
                        type="number"
                        className="form-control form-input-placeholder-text-size"
                        id="min_experience"
                        {...register("min_experience", { required: expReq })}
                        placeholder="Ex: 3/4/5"
                        defaultValue={
                          formType === "updateJob"
                            ? singleJobPostItems.min_experience
                            : ""
                        }
                      />
                    </div>

                    {/* max_experience  */}
                    <div className="col-4">
                      <label
                        htmlFor="max_experience"
                        className="form-label mb-1 multi-step-form-label-name"
                      >
                        max experience
                        {expReq && (
                          <span className="required-icon-color ">*</span>
                        )}
                      </label>
                      <input
                        type="number"
                        className="form-control form-input-placeholder-text-size"
                        id="max_experience"
                        {...register("max_experience", { required: expReq })}
                        placeholder="Ex: 10/11/12"
                        defaultValue={
                          formType === "updateJob"
                            ? singleJobPostItems.max_experience
                            : ""
                        }
                      />
                    </div>
                  </>
                ) : (
                  <> </>
                )}

                {/* fresher_can_apply */}
                <div className="col-12">
                  <div htmlFor="experience_required">
                    <label
                      className="form-label mb-1 multi-step-form-label-name"
                      htmlFor="experience_required"
                    >
                      fresher can apply
                    </label>
                  </div>

                  <div className="form-check form-switch">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="fresher_can_apply"
                    >
                      No/Yes
                    </label>

                    <input
                      className="form-check-input"
                      type="checkbox"
                      id="fresher_can_apply"
                      {...register("fresher_can_apply")}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.fresher_can_apply
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>
                </div>

                {/* area_of_experience  */}
                <div className="col-md-6">
                  <label
                    htmlFor="area_of_experience"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    area of experience
                    <span className="required-icon-color ">*</span>
                  </label>

                  <Controller
                    name="area_of_experience"
                    control={control}
                    render={({ field }) => (
                      <CreatableSelect
                        {...field}
                        options={allAreaOfExp}
                        isMulti
                      />
                    )}
                    rules={{ required: true }}
                    defaultValue={
                      formType === "updateJob" ? areaOfExperience : []
                    }
                  />
                </div>

                {/* area_of_business  */}
                <div className="col-md-6">
                  <label
                    htmlFor="area_of_business"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    area of business
                  </label>

                  <Controller
                    name="area_of_business"
                    control={control}
                    render={({ field }) => (
                      <CreatableSelect
                        {...field}
                        options={allAreaOfBusi}
                        isMulti
                      />
                    )}
                    defaultValue={
                      formType === "updateJob" ? areaOfBusiness : []
                    }
                  />
                </div>

                {/* skills  */}
                <div className="col-md-6">
                  <label
                    htmlFor="skills"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    skills
                    <span className="required-icon-color ">*</span>
                  </label>

                  <Controller
                    name="skills"
                    control={control}
                    render={({ field }) => (
                      <CreatableSelect {...field} options={allSkills} isMulti />
                    )}
                    rules={{ required: true }}
                    defaultValue={formType === "updateJob" ? skills : []}
                  />
                </div>

                {/* additional_requirements */}
                <div className="col-md-6">
                  <label
                    htmlFor="additional_requirements"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    additional requirements
                  </label>

                  <textarea
                    className="form-control form-input-placeholder-text-size"
                    id="additional_requirements"
                    {...register("additional_requirements")}
                    placeholder="Ex: mention others benefits"
                    defaultValue={
                      formType === "updateJob"
                        ? singleJobPostItems.additional_requirements
                        : ""
                    }
                  ></textarea>
                </div>

                {/* min_age  */}
                <div className="col-md-6">
                  <label
                    htmlFor="min_age"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    min age
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="min_age"
                    {...register("min_age", { required: expReq })}
                    placeholder="Ex: new"
                    defaultValue={
                      formType === "updateJob" ? singleJobPostItems.min_age : ""
                    }
                  />
                </div>

                {/* max_age  */}
                <div className="col-md-6">
                  <label
                    htmlFor="max_age"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    max age
                    <span className="required-icon-color ">*</span>
                  </label>
                  <input
                    type="number"
                    className="form-control form-input-placeholder-text-size"
                    id="max_age"
                    {...register("max_age", { required: expReq })}
                    placeholder="Ex: new"
                    defaultValue={
                      formType === "updateJob" ? singleJobPostItems.max_age : ""
                    }
                  />
                </div>

                {/* gender  */}
                <div className="col-md-6">
                  <label
                    htmlFor="gender"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    gender
                    <span className="required-icon-color ">*</span>
                  </label>

                  <div
                    className="d-flex flex-wrap justify-content-start"
                    id="gender"
                  >
                    {/* male  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="gender1"
                        autoComplete="off"
                        value="male"
                        {...register("gender", { required: true })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.gender.length > 0
                              ? singleJobPostItems.gender.includes("male")
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="gender1"
                      >
                        male
                      </label>
                    </div>

                    {/* female  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="gender2"
                        autoComplete="off"
                        value="female"
                        {...register("gender", { required: true })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.gender.length > 0
                              ? singleJobPostItems.gender.includes("female")
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="gender2"
                      >
                        female
                      </label>
                    </div>

                    {/* others  */}
                    <div className="mb-1 me-1">
                      <input
                        type="checkbox"
                        className="btn-check"
                        id="gender3"
                        autoComplete="off"
                        value="others"
                        {...register("gender", { required: true })}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.gender.length > 0
                              ? singleJobPostItems.gender.includes("others")
                                ? true
                                : false
                              : false
                            : false
                        }
                      />
                      <label
                        className="btn btn-outline-secondary btn-sm create-job-btn-check"
                        htmlFor="gender3"
                      >
                        others
                      </label>
                    </div>
                  </div>
                </div>

                {/* person_with_disability_can_apply */}
                <div className="col-md-6">
                  <div htmlFor="experience_required">
                    <label
                      className="form-label mb-1 multi-step-form-label-name"
                      htmlFor="experience_required"
                    >
                      person with disability can apply
                    </label>
                  </div>

                  <div className="form-check form-switch">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="person_with_disability_can_apply"
                    >
                      No/Yes
                    </label>

                    <input
                      className="form-check-input"
                      type="checkbox"
                      id="person_with_disability_can_apply"
                      {...register("person_with_disability_can_apply")}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.is_compare
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>
                </div>
              </div>
            </>
          )}
          {/* form step 3  */}
          {jobFormStep === 3 && (
            <>
              {/* Company Information Visibility */}
              <div className="row gy-2 my-2 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    Company Information Visibility
                  </h3>
                </div>

                {/* which_industry_type_to_show  */}
                <div className="col-md-6">
                  <label
                    htmlFor="which_industry_type_to_show"
                    className="form-label mb-1 multi-step-form-label-name"
                  >
                    industry type
                    <span className="required-icon-color ">*</span>
                  </label>

                  <select
                    className="form-select form-input-placeholder-text-size"
                    id="which_industry_type_to_show"
                    {...register("which_industry_type_to_show", {
                      required: true,
                    })}
                  >
                    <option
                      value={
                        formType === "updateJob"
                          ? singleJobPostItems.which_industry_type_to_show
                          : ""
                      }
                    >
                      {formType === "updateJob"
                        ? singleJobPostItems.which_industry_type_to_show
                        : "--- Select ---"}
                    </option>
                    {threeCategory?.industry_type &&
                      threeCategory.industry_type.map((type, index) => (
                        <option key={index} value={type.name}>
                          {type.name}
                        </option>
                      ))}
                  </select>
                </div>

                {/* company_name_show */}
                <div className="col-md-6">
                  <div htmlFor="experience_required">
                    <label
                      className="form-label mb-1 multi-step-form-label-name"
                      htmlFor="experience_required"
                    >
                      company name
                    </label>
                  </div>
                  <div className="form-check form-switch">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="company_name_show"
                    >
                      No/Yes
                    </label>

                    <input
                      className="form-check-input"
                      type="checkbox"
                      id="company_name_show"
                      {...register("company_name_show")}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.company_name_show
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>
                </div>

                {/* company_address_show */}
                <div className="col-md-6">
                  <div htmlFor="experience_required">
                    <label
                      className="form-label mb-1 multi-step-form-label-name"
                      htmlFor="experience_required"
                    >
                      company address
                    </label>
                  </div>
                  <div className="form-check form-switch">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="company_address_show"
                    >
                      No/Yes
                    </label>

                    <input
                      className="form-check-input"
                      type="checkbox"
                      id="company_address_show"
                      {...register("company_address_show")}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.company_address_show
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>
                </div>

                {/* company_business_show */}
                <div className="col-md-6">
                  <div htmlFor="experience_required">
                    <label
                      className="form-label mb-1 multi-step-form-label-name"
                      htmlFor="experience_required"
                    >
                      company business
                    </label>
                  </div>

                  <div className="form-check form-switch">
                    <label
                      className="form-check-label multi-step-form-label-name"
                      htmlFor="company_business_show
                      "
                    >
                      No/Yes
                    </label>

                    <input
                      className="form-check-input"
                      type="checkbox"
                      id="company_business_show"
                      {...register("company_business_show")}
                      defaultChecked={
                        formType === "updateJob"
                          ? singleJobPostItems.company_business_show
                            ? true
                            : false
                          : false
                      }
                    />
                  </div>
                </div>
              </div>

              {/* Matching Criteria */}
              <div className="row gy-2 my-2 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    Matching Criteria
                  </h3>
                </div>

                {/* Age  */}
                <div className="col-md-4 mt-2">
                  {/* is_age */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        age
                      </label>
                    </div>

                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_age"
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_age"
                        {...register("is_age")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_age
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>

                  {/* is_age_mendatory */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        age mendatory
                      </label>
                    </div>

                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_age_mendatory
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_age_mendatory"
                        {...register("is_age_mendatory")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_age_mendatory
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>
                </div>

                <div className="col-md-4 mt-2">
                  {/* is_gender */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        gender
                      </label>
                    </div>

                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_gender
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_gender"
                        {...register("is_gender")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_gender
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>

                  {/* gender mendatory */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        gender mendatory
                      </label>
                    </div>

                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_gender_mendatory
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_gender_mendatory"
                        {...register("is_gender_mendatory")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_gender_mendatory
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>
                </div>

                {/* experience  */}
                <div className="col-md-4 mt-2">
                  {/* is_total_year_experience*/}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        total year experience
                      </label>
                    </div>

                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_total_year_experience
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_total_year_experience"
                        {...register("is_total_year_experience")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_total_year_experience
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>

                  {/* is_experience_mendatory */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        experience mendatory
                      </label>
                    </div>

                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_experience_mendatory
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_experience_mendatory"
                        {...register("is_experience_mendatory")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_experience_mendatory
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>

                  {/* is_area_of_experience */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        area of experience
                      </label>
                    </div>

                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_area_of_experience
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_area_of_experience"
                        {...register("is_area_of_experience")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_area_of_experience
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>
                </div>

                <div className="col-md-4 mt-4">
                  {/* is_skills*/}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        Skills
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_skills
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_skills"
                        {...register("is_skills")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_skills
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>

                  {/* is_area_of_business */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        area of business
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_area_of_business
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_area_of_business"
                        {...register("is_area_of_business")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_area_of_business
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>
                </div>

                <div className="col-md-4 mt-4">
                  {/* is_location*/}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        Location
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_location
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_location"
                        {...register("is_location")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_location
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>

                  {/* is_location_mendatory */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        location mandatory
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_location_mendatory
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_location_mendatory"
                        {...register("is_location_mendatory")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_location_mendatory
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>
                </div>

                <div className="col-md-4 mt-4">
                  {/* is_salary_range */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        salary range
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_salary_range
                      "
                      >
                        NO/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_salary_range"
                        {...register("is_salary_range")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_salary_range
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>

                  {/* is_job_level */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        Job level
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="is_job_level
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="is_job_level"
                        {...register("is_job_level")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.is_job_level
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>
                </div>

                <div className="col-md-4 mt-4">
                  {/* cover_letter_required */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        cover latter
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="cover_letter_required
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="cover_letter_required"
                        {...register("cover_letter_required")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.cover_letter_required
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>

                  {/* rusume_required */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        resume
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="rusume_required
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="rusume_required"
                        {...register("rusume_required")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.rusume_required
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>
                </div>

                <div className="col-md-4 mt-4">
                  {/* cv_required*/}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        Curriculum Vitae
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="cv_required
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="cv_required"
                        {...register("cv_required")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.cv_required
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>

                  {/* NID no required */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        NID No.
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="NID_no_required
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="NID_no_required"
                        {...register("NID_no_required")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.NID_no_required
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>
                </div>

                <div className="col-md-4 mt-4">
                  {/* passport_required */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        passport
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="passport_required
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="passport_required"
                        {...register("passport_required")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.passport_required
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>

                  {/* driving_lisence_no_required */}
                  <div className="col-12">
                    <div htmlFor="experience_required">
                      <label
                        className="form-label mb-1 multi-step-form-label-name"
                        htmlFor="experience_required"
                      >
                        driving lisence no.
                      </label>
                    </div>
                    <div className="form-check form-switch">
                      <label
                        className="form-check-label multi-step-form-label-name"
                        htmlFor="driving_lisence_no_required
                      "
                      >
                        No/Yes
                      </label>

                      <input
                        className="form-check-input"
                        type="checkbox"
                        id="driving_lisence_no_required"
                        {...register("driving_lisence_no_required")}
                        defaultChecked={
                          formType === "updateJob"
                            ? singleJobPostItems.driving_lisence_no_required
                              ? true
                              : false
                            : false
                        }
                      />
                    </div>
                  </div>
                </div>
              </div>
            </>
          )}
          {/* form step 4  */}
          {jobFormStep === 4 && (
            <>
              {/* Preview */}
              <div className="row gy-2 my-2 pt-2 pb-3 bg-white rounded">
                <div className="col-12 mt-0">
                  <h3 className="group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "info-circle"]}
                    />
                    Preview
                  </h3>
                </div>
                {/* Form Data  */}
                {/* Job Title  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">Job Title</h3>
                  <p className="preview-group-message">
                    {beforeSubmit && beforeSubmit.job_title}
                  </p>
                </div>
                {/* vacancies  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">number of vacancies</h3>
                  <p className="preview-group-message">
                    {beforeSubmit && beforeSubmit.vacancies
                      ? beforeSubmit.vacancies
                      : "null"}
                  </p>
                </div>

                {/* deadline  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">deadline</h3>
                  <p className="preview-group-message">
                    {beforeSubmit && beforeSubmit.deadline
                      ? beforeSubmit.deadline
                      : "Not Specified"}
                  </p>
                </div>

                {/* employment status  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">employment status</h3>
                  <p className="preview-group-message">
                    {Array.isArray(
                      beforeSubmit && beforeSubmit.employment_status
                    )
                      ? beforeSubmit &&
                        beforeSubmit.employment_status.length > 0
                        ? beforeSubmit.employment_status.map((item, index) => (
                            <span key={index}>{item + ","}</span>
                          ))
                        : "null"
                      : beforeSubmit && beforeSubmit.employment_status}
                  </p>
                </div>

                {/* resume receiveing option  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">
                    resume receiveing option
                  </h3>
                  <p className="preview-group-message text-lowercase">
                    {beforeSubmit && beforeSubmit.resume_receiveing_option ? (
                      beforeSubmit.resume_receiveing_option
                    ) : (
                      <span className="text-capitalize">null</span>
                    )}
                  </p>
                </div>

                {/* photograph enclosed  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">photograph enclosed</h3>
                  <p className="preview-group-message">
                    {beforeSubmit && beforeSubmit.photograph_enclosed
                      ? "Yes"
                      : "Null"}
                  </p>
                </div>

                {/* job level  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">job level</h3>
                  <p className="preview-group-message">
                    {Array.isArray(beforeSubmit && beforeSubmit.job_level)
                      ? beforeSubmit && beforeSubmit.job_level.length > 0
                        ? beforeSubmit.job_level.map((item, index) => (
                            <span key={index}>{item + ","}</span>
                          ))
                        : "null"
                      : beforeSubmit && beforeSubmit.job_level}
                  </p>
                </div>

                {/* workplace  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">workplace</h3>
                  <p className="preview-group-message">
                    {Array.isArray(beforeSubmit && beforeSubmit.workplace)
                      ? beforeSubmit && beforeSubmit.workplace.length > 0
                        ? beforeSubmit.workplace.map((item, index) => (
                            <span key={index}>{item + ","}</span>
                          ))
                        : "null"
                      : beforeSubmit && beforeSubmit.workplace}
                  </p>
                </div>

                {/* Salary Range  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">Salary Range</h3>
                  <p className="preview-group-message">
                    Min to max:{" "}
                    {beforeSubmit && beforeSubmit.min_salary
                      ? beforeSubmit.min_salary
                      : "negotiable"}{" "}
                    -{" "}
                    {beforeSubmit && beforeSubmit.max_salary
                      ? beforeSubmit.max_salary
                      : "negotiable"}
                    <span className="ms-2">BDT</span>
                  </p>
                </div>

                {/* compensation and benefits  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">
                    compensation and benefits
                  </h3>
                  <p className="preview-group-message">
                    {Array.isArray(
                      beforeSubmit && beforeSubmit.compensation_and_benefits
                    )
                      ? beforeSubmit &&
                        beforeSubmit.compensation_and_benefits.length > 0
                        ? beforeSubmit.compensation_and_benefits.map(
                            (item, index) => (
                              <span key={index}>{item + ","}</span>
                            )
                          )
                        : "null"
                      : beforeSubmit && beforeSubmit.compensation_and_benefits}
                  </p>
                </div>

                {/* lunch facilities  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">lunch facilities</h3>
                  <p className="preview-group-message">
                    {Array.isArray(
                      beforeSubmit && beforeSubmit.lunch_facilities
                    )
                      ? beforeSubmit && beforeSubmit.lunch_facilities.length > 0
                        ? beforeSubmit.lunch_facilities.map((item, index) => (
                            <span key={index}>{item + ","}</span>
                          ))
                        : "null"
                      : beforeSubmit && beforeSubmit.lunch_facilities}
                  </p>
                </div>

                {/* salary review  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">salary review</h3>
                  <p className="preview-group-message">
                    {Array.isArray(beforeSubmit && beforeSubmit.salary_review)
                      ? beforeSubmit && beforeSubmit.salary_review.length > 0
                        ? beforeSubmit.salary_review.map((item, index) => (
                            <span key={index}>{item + ","}</span>
                          ))
                        : "null"
                      : beforeSubmit && beforeSubmit.salary_review}
                  </p>
                </div>

                {/* num of fastival bonous  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">
                    num of fastival bonous
                  </h3>
                  <p className="preview-group-message">
                    {beforeSubmit && beforeSubmit.num_of_fastival_bonous
                      ? beforeSubmit.num_of_fastival_bonous
                      : "Not Specified"}
                  </p>
                </div>

                {/* degree level  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">degree level</h3>
                  <p className="preview-group-message">
                    {beforeSubmit && beforeSubmit.degree_level
                      ? beforeSubmit.degree_level
                      : "Not Specified"}
                  </p>
                </div>

                {/* degree name  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">degree name</h3>
                  <p className="preview-group-message">
                    {beforeSubmit && beforeSubmit.degree_name
                      ? beforeSubmit.degree_name
                      : "Not Specified"}
                  </p>
                </div>

                {/* major in  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">major in</h3>
                  <p className="preview-group-message">
                    {beforeSubmit && beforeSubmit.major_in
                      ? beforeSubmit.major_in
                      : "Not Specified"}
                  </p>
                </div>

                {/* experience required  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">experience required</h3>
                  <p className="preview-group-message">
                    Min to max:{" "}
                    {beforeSubmit && beforeSubmit.min_experience
                      ? beforeSubmit.min_experience
                      : "Not Specified"}{" "}
                    -{" "}
                    {beforeSubmit && beforeSubmit.max_experience
                      ? beforeSubmit.max_experience
                      : "Not Specified"}
                    <span className="ms-2">Years</span>
                  </p>
                </div>

                {/* fresher can apply  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">fresher can apply</h3>
                  <p className="preview-group-message">
                    {beforeSubmit && beforeSubmit.fresher_can_apply
                      ? "Yes"
                      : "No"}
                  </p>
                </div>

                {/* Age  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">Age</h3>
                  <p className="preview-group-message">
                    Min to max:{" "}
                    {beforeSubmit && beforeSubmit.min_age
                      ? beforeSubmit.min_age
                      : "Not Specified"}{" "}
                    -{" "}
                    {beforeSubmit && beforeSubmit.max_age
                      ? beforeSubmit.max_age
                      : "Not Specified"}
                    <span className="ms-2">Years</span>
                  </p>
                </div>

                {/* gender  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">gender</h3>
                  <p className="preview-group-message">
                    {Array.isArray(beforeSubmit && beforeSubmit.gender)
                      ? beforeSubmit && beforeSubmit.gender.length > 0
                        ? beforeSubmit.gender.map((item, index) => (
                            <span key={index}>{item + ","}</span>
                          ))
                        : "null"
                      : beforeSubmit && beforeSubmit.gender}
                  </p>
                </div>

                {/* person with disability can apply  */}
                <div className="col-md-6 mt-1">
                  <h3 className="preview-group-title">
                    person with disability can apply
                  </h3>
                  <p className="preview-group-message">
                    {beforeSubmit &&
                    beforeSubmit.person_with_disability_can_apply
                      ? "Yes"
                      : "No"}
                  </p>
                </div>
              </div>
            </>
          )}

          {/* submit or step change buttons  */}
          <div className="row gy-2 my-2 pt-2 pb-3 bg-white rounded">
            <div className="col-6 mb-1 text-start">{renderJobPrevButton()}</div>

            <div className="col-6 mb-1 text-end">
              {jobFormStep === 4 ? (
                <button
                  type={`${submitBtnState ? "submit" : "button"}`}
                  className="btn form-next-step-button text-dark"
                  onClick={() => setSubmitBtnState(true)}
                >
                  {formType === "updateJob" ? "Update" : "Create"}
                  <FontAwesomeIcon
                    className="ms-2"
                    icon={["fas", "arrow-alt-circle-right"]}
                  />
                </button>
              ) : (
                <button
                  disabled={!isValid}
                  type="button"
                  className="btn form-next-step-button text-dark"
                  onClick={() => {
                    jobFormNextStepHandler();
                    setBeforeSubmit(getValues());
                  }}
                >
                  {jobFormStep === 3 ? "Preview" : "Next Page"}
                  <FontAwesomeIcon
                    className="ms-2"
                    icon={["fas", "arrow-alt-circle-right"]}
                  />
                </button>
              )}
            </div>
          </div>
        </form>
      </div>
    </div>
  );
};

export default CreateNewJob;
