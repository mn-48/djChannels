import React, { useState, useEffect } from "react";
// import { useSelector } from "react-redux";
import { useForm } from "react-hook-form";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import "../Job.css";

const JobCareerApplication = () => {
  /******** Collaps Sections starts here *******/
  const [isCollapsed3rdDiv, setIsCollapsed3rdDiv] = useState(false);
  /******* Collaps section ends here *******/

  /******* Dynamic Class code starts here *******/
  const [onEdit, setOnEdit] = useState(false);
  /******** Dynamic class code ends here*/

  //   const user = useSelector((state) => state.auth.user);
  const [jobInfo, setJobInfo] = useState([]);

  function refreshPage(props) {
    if (props === "closeBtnClicked") {
      setOnEdit(false);
    }
    // window.location.reload(false);
  }

  useEffect(() => {
    axios
      .get("http://127.0.0.1:8000/api/jobs/jobprocreate/")
      .then((response) => {
        setJobInfo(response.data);
      });
  }, []);

  const jobLevel = ["Entry Level", "Mid Level", "Senior Level"];
  const jobNatureArray = [
    "Part Time",
    "Full Time",
    "Contract",
    "Internship",
    "Freelance",
  ];

  /***** Job category field ends here *******/

  /***** React hook form starts here ******/

  const { register, handleSubmit } = useForm();

  const onSubmit = (data) => {
    const config = {
      headers: {
        Accept: "application/json",
      },
    };

    console.log("data value before submit", data);
    axios
      .post("http://127.0.0.1:8000/api/jobs/jobprocreate/", data, config)
      .then((response) => {
        console.log("data after submit  response", response);
      })
      .catch((error) => {
        console.log("submit error:", error);
        console.log("error message:", error.message);
      });

    // refreshPage() //calling the page reloader func
  };

  return (
    <>
      <div className="rounded mx-3">
        <button
          type="button"
          className="border-light mb-3 collapse-button collapseBtn-effect py-2 text-start rounded form-control"
          onClick={() => setIsCollapsed3rdDiv(!isCollapsed3rdDiv)}
        >
          {isCollapsed3rdDiv ? (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-up"]} />
          ) : (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-down"]} />
          )}{" "}
          Career and Application Information
        </button>

        {isCollapsed3rdDiv && (
          <form
            className="form-group mb-3"
            onSubmit={handleSubmit(onSubmit)}
            encType="multipart/form-data"
          >
            <div className="mx-3">
              <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                <div className={`${onEdit ? "d-none" : "col-2 ms-auto"}`}>
                  <button
                    type="button"
                    onClick={() => setOnEdit(true)}
                    className="btn btn-primary px-2"
                  >
                    <FontAwesomeIcon className="me-1" icon={["fas", "edit"]} />{" "}
                    Edit
                  </button>
                </div>
                <div className="mb-2">
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "briefcase"]}
                    />{" "}
                    Work Details
                  </h3>
                </div>
                <div className="col-md-12 mb-2">
                  <small>Career Objective</small>
                  <span className="text-danger">*</span>
                  <textarea
                    rows="4"
                    readOnly={!onEdit}
                    defaultValue={jobInfo && jobInfo.career_objective}
                    className={`${
                      onEdit ? "form-control" : "editForm textareaDeco"
                    }`}
                    {...register("career_objective", { required: true })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>Present Salary</small>
                  <input
                    type="number"
                    readOnly={!onEdit}
                    defaultValue={jobInfo && jobInfo.present_salary}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("present_salary")}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    Expected salary<span className="text-danger">*</span>
                  </small>
                  <input
                    type="number"
                    readOnly={!onEdit}
                    defaultValue={jobInfo && jobInfo.expected_salary}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    required
                    {...register("expected_salary")}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    Looking for(Job Level)
                    <span className="text-danger">*</span>
                  </small>
                  <input
                    type="text"
                    defaultValue={jobInfo && jobInfo.looking_job_level}
                    className={`${onEdit ? "d-none" : "editForm"}`}
                  />
                  <select
                    className={`${
                      onEdit
                        ? "dropdown-item border border-dark rounded"
                        : "d-none"
                    }`}
                    readOnly={!onEdit}
                    {...register("looking_job_level", { required: true })}
                  >
                    {jobLevel.map((level, index) => {
                      return (
                        <option key={index} defaultValue={level}>
                          {level}
                        </option>
                      );
                    })}
                  </select>
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    Available for(Job Nature)
                    <span className="text-danger">*</span>
                  </small>
                  <input
                    type="text"
                    defaultValue={jobInfo && jobInfo.available_for_job_type}
                    className={`${onEdit ? "d-none" : "editForm"}`}
                  />
                  <select
                    className={`${
                      onEdit
                        ? "dropdown-item border border-dark rounded"
                        : "d-none"
                    }`}
                    readOnly={!onEdit}
                    {...register("available_for_job_type", {
                      required: true,
                    })}
                  >
                    {jobNatureArray.map((nature, index) => (
                      <option key={index} defaultValue={nature}>
                        {nature}
                      </option>
                    ))}
                  </select>
                </div>
              </div>
              <div className="row gy-2 mt-2 mb-1 pt-2 pb-3 bg-white rounded">
                <h3 className="form-field-group-title py-2">
                  <FontAwesomeIcon
                    className="me-2"
                    icon={["fas", "user-tag"]}
                  />{" "}
                  Personal Statement
                </h3>
                <div className="col-md-12 mb-2">
                  <small>Career Summary</small>
                  <textarea
                    rows="3"
                    readOnly={!onEdit}
                    defaultValue={jobInfo && jobInfo.career_summary}
                    className={`${
                      onEdit ? "form-control" : "editForm textareaDeco"
                    }`}
                    {...register("career_summary")}
                  />
                </div>
                <div className="col-md-12 mb-2">
                  <small>Special Qualification</small>
                  <textarea
                    rows="3"
                    readOnly={!onEdit}
                    defaultValue={jobInfo && jobInfo.special_qualifications}
                    className={`${
                      onEdit ? "form-control" : "editForm textareaDeco"
                    }`}
                    {...register("special_qualifications")}
                  />
                </div>
                <div className="col-md-12 mb-2">
                  <small>
                    Keywords<span className="text-danger">*</span>
                  </small>
                  <input
                    type="text"
                    readOnly={!onEdit}
                    defaultValue={jobInfo && jobInfo.keywords}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("keywords", { required: true })}
                  />
                </div>
              </div>
              <button
                type="reset"
                onClick={() => refreshPage("closeBtnClicked")}
                className={`btn btn-primary px-2 me-2 ${!onEdit && "d-none"}`}
              >
                <FontAwesomeIcon className="me-1" icon={["fas", "times"]} />{" "}
                Close
              </button>
              <input
                className={`btn btn-primary px-2 me-2 ${!onEdit && "d-none"}`}
                onClick={() => setOnEdit(!onEdit)}
                type="submit"
              />
            </div>
          </form>
        )}
      </div>
    </>

    /****** React Hook form ends here *******/
  );
};

export default JobCareerApplication;
