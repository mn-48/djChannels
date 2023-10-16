import React, { useState, useEffect } from "react";
// import { useSelector } from "react-redux";
import { useForm } from "react-hook-form";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import "../Job.css";

const JobPreferredArea = () => {
  // const user = useSelector((state) => state.auth.user);
  const [jobInfo, setJobInfo] = useState([]);

  /**** Job category field starts here ****/
  const [jobCategory, setJobCategory] = useState([]);
  const [specialSkills, setSpecialSkills] = useState([]);
  const [loading, setLoading] = useState(false);

  /******* Dynamic Class code starts here *******/
  const [onEdit, setOnEdit] = useState(false);
  /******** Dynamic class code ends here*/

  function refreshPage(props) {
    if (props === "closeBtnClicked") {
      setOnEdit(false);
    }
    // window.location.reload(false);
  }

  /*** Job infos code starts here */

  useEffect(() => {
    setLoading(true);
    axios
      .get("http://127.0.0.1:8000/api/jobs/jobprocreate/")
      .then((response) => {
        setJobInfo(response.data);
        if (response.data) {
          setLoading(false);
        }
      });
  }, []);
  // console.log("Job Info: ", jobInfo);
  /*** Job infos code ends here */

  useEffect(() => {
    axios
      .get("http://127.0.0.1:8000/api/jobs/specialskills/")
      .then((response) => {
        setSpecialSkills(response.data);
      });
  }, []);

  useEffect(() => {
    axios
      .get("http://127.0.0.1:8000/api/jobs/jobcategories/")
      .then((response) => {
        setJobCategory(response.data);
      });
  }, []);
  /***** Job category field ends here *******/

  /******** Collaps Sections starts here *******/
  const [isCollapsed4thDiv, setIsCollapsed4thDiv] = useState(false);
  /******* Collaps section ends here *******/

  /***** React hook form starts here ******/

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm();

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

    // refreshPage() //calling the refresh method
  };

  return (
    <>
      <div className="rounded mx-3">
        <button
          type="button"
          className="border-light mb-3 collapse-button collapseBtn-effect py-2 text-start rounded form-control"
          onClick={() => setIsCollapsed4thDiv(!isCollapsed4thDiv)}
        >
          {isCollapsed4thDiv ? (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-up"]} />
          ) : (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-down"]} />
          )}{" "}
          Preferred Areas
        </button>
        {isCollapsed4thDiv && (
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
                <div>
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "clipboard-check"]}
                    />{" "}
                    Preferred Job Category
                  </h3>{" "}
                  <br />
                  <p style={{ fontSize: "12px" }} className="fst-italic">
                    Preferred job categories represents your desired sector(s)
                    to work{" "}
                    <span className="fw-bold">
                      (at least 1 category any of section)
                    </span>
                  </p>
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    Functional<span className="text-danger">*</span>
                  </small>{" "}
                  <br />
                  {errors.job_categories && (
                    <small className="text-danger">
                      This field is required
                    </small>
                  )}
                  <br />
                  {loading && ( //if data is not fetched yet, showing loading msg
                    <div
                      className="spinner-border text-info ms-5 mt-2"
                      role="status"
                    >
                      <span className="sr-only">Loading...</span>
                    </div>
                  )}
                  {!loading && ( //if data fetched successfully, then shwoing the list
                    <div
                      className={`${
                        onEdit ? "d-none" : "py-1 px-2 checkbox-container"
                      }`}
                    >
                      {jobInfo.job_categories.map((category, index) => (
                        <small key={index}>
                          <span className="chekcedItemsShow">
                            {category.name}
                          </span>
                        </small>
                      ))}
                    </div>
                  )}
                  <div
                    className={`${
                      onEdit && !loading ? "checkbox-container" : "d-none"
                    }`}
                  >
                    {jobCategory.map((category) => {
                      return (
                        <div key={category.id}>
                          <input
                            type="checkbox"
                            defaultValue={category.id}
                            {...register("job_categories", { required: true })}
                          />
                          <label>{category.name}</label>
                        </div>
                      );
                    })}
                  </div>
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    Special Skills<span className="text-danger">*</span>
                  </small>{" "}
                  <br />
                  {errors.special_skills && (
                    <small className="text-danger">
                      This field is required
                    </small>
                  )}
                  <br />
                  {loading && ( //if data is not fetched yet, showing loading msg
                    <div
                      className="spinner-border text-info ms-5 mt-2"
                      role="status"
                    >
                      <span className="sr-only">Loading...</span>
                    </div>
                  )}
                  {!loading && ( //if data fetched successfully, then shwoing the list
                    <div
                      className={`${
                        onEdit ? "d-none" : "py-1 px-2 checkbox-container"
                      }`}
                    >
                      {jobInfo.special_skills.map((skill, index) => (
                        <small key={index}>
                          <span className="chekcedItemsShow">{skill.name}</span>
                        </small>
                      ))}
                    </div>
                  )}
                  <div
                    className={`${
                      onEdit && !loading ? "checkbox-container" : "d-none"
                    }`}
                  >
                    {specialSkills.map((specialSkill) => {
                      return (
                        <div key={specialSkill.id}>
                          <input
                            type="checkbox"
                            defaultValue={specialSkill.id}
                            {...register("special_skills", { required: true })}
                          />
                          <label>{specialSkill.name}</label>
                        </div>
                      );
                    })}
                  </div>
                </div>
                <div>
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "map-marker-alt"]}
                    />{" "}
                    Preferred Job Location
                  </h3>{" "}
                  <br />
                  <p className="fontSize fst-italic">
                    Preferred Job Location defines the{" "}
                    <span className="fw-bold">geographical place</span> where
                    you prefer to work. Add your priority wise preferred job
                    locations. i.e. 1st: Dhaka, 2nd: Sylhet, 3rd: Khulna.
                  </p>
                </div>
                <div className="col-md-12 mb-2">
                  <small>Add Cities or Districts</small>
                  <input
                    type="text"
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    readOnly={!onEdit}
                    maxLength="100"
                    defaultValue={jobInfo && jobInfo.job_location}
                    {...register("job_location")}
                  />
                </div>
                <div className="col-md-12 mb-2">
                  <small>Add your preferred organization type</small>
                  <input
                    type="text"
                    readOnly={!onEdit}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    defaultValue={jobInfo && jobInfo.organizations}
                    maxLength="100"
                    {...register("organizations")}
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

export default JobPreferredArea;
