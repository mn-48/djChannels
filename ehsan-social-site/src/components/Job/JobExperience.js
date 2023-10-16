import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import JobArmyEmployment from "./JobArmyEmployment";

const JobExperience = () => {
  /****** Dynamic input field code starts here */
  const [expInputFields, setExpInputFields] = useState([]);
  const [expAtBDArmy, setExpAtBDArmy] = useState([]);
  const [emptyMsgToggle, setEmptyMsgToggle] = useState(true);

  const handleAddField = (add) => {
    setEmptyMsgToggle(false);
    if (add === "addExp") {
      setExpInputFields([...expInputFields, {}]);
    } else if (add === "addExpAtBDArmy") {
      setExpAtBDArmy([...expAtBDArmy, {}]);
    }
  };

  const handleRemoveField = (remove, index) => {
    const values = [...expInputFields];
    values.splice(index, 1);

    setEmptyMsgToggle(true);
    if (remove === "removeExp") {
      setExpInputFields(values);
    } else if (remove === "removeExpatBDArmy") {
      const removingVlaue = [...expAtBDArmy];
      removingVlaue.splice(index, 1);
      setExpAtBDArmy(removingVlaue);
    }
  };
  /******** Dynamic Inpt field code ends here */

  const [isCollapsed, setIsCollapsed] = useState(false);
  const [currentlyWorking, setCurrentlyWorking] = useState(false);

  const {
    register,
    handleSubmit,
    formState: { isValid },
  } = useForm();
  const onSubmit = (data) => {
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    axios
      .post("http://127.0.0.1:8000/api/jobs/experience/", data, config)
      .then((response) => {
        console.log("data after submit  response", response);
      })
      .catch((error) => {
        console.log("submit error:", error);

        console.log("error message:", error.message);
      });
  };
  return (
    <>
      <form className="form-group mt-3 mb-3" onSubmit={handleSubmit(onSubmit)}>
        <div className="rounded mx-3">
          <button
            type="button"
            className="border-light mb-3 collapse-button collapseBtn-effect py-2 text-start rounded form-control"
            onClick={() => setIsCollapsed(!isCollapsed)}
          >
            {isCollapsed ? (
              <FontAwesomeIcon className="me-2" icon={["fas", "chevron-up"]} />
            ) : (
              <FontAwesomeIcon
                className="me-2"
                icon={["fas", "chevron-down"]}
              />
            )}{" "}
            Employment History
          </button>

          {isCollapsed && (
            <div className="mx-3">
              {emptyMsgToggle && (
                <div className="text-center p-5">
                  <p>
                    Currently no data exists! Please click on the following
                    button to add your employment information.
                  </p>
                </div>
              )}
              <div>
                {expInputFields.map((inputField, index) => (
                  <div key={index}>
                    <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                      <div className="mb-2">
                        <h3 className="form-field-group-title">
                          <FontAwesomeIcon
                            className="me-2"
                            icon={["fas", "info-circle"]}
                          />{" "}
                          Add Experience
                        </h3>
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Company Name<span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("company_name")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Company Business<span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("company_business")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Designation<span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("designation")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Department</small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("department")}
                        />
                      </div>
                      <div className="col-md-12 mb-2">
                        <small>
                          Area of Experiences
                          <span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          {...register("Area_of_experience")}
                        />
                      </div>
                      <div className="col-md-12 mb-2">
                        <small>Responsibilities</small>
                        <textarea
                          className="form-control"
                          rows="4"
                          {...register("responsibilities")}
                        />
                      </div>
                      <div className="col-md-12 mb-2">
                        <small>Company Location</small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("company_location")}
                        />
                      </div>
                      <div className="col-md-12 mb-2">
                        <small>Employment Period</small>
                        <div className="row">
                          <div className="col-md-6">
                            <input
                              className="form-control"
                              type="date"
                              {...register("start_date")}
                            />
                            <div className="text-center">
                              <small>From Date</small>
                            </div>
                          </div>
                          {!currentlyWorking ? (
                            <div className="col-md-6">
                              <input
                                className="form-control"
                                type="date"
                                {...register("end_date")}
                              />
                              <div className="text-center">
                                <small>To Date</small>
                              </div>
                            </div>
                          ) : (
                            <div className="col-md-6">
                              <input
                                defaultValue="continuing"
                                className="form-control"
                                placeholder="Continuing"
                                {...register("end_date")}
                              />
                              <div className="text-center">
                                <small>To Date</small>
                              </div>
                            </div>
                          )}
                        </div>
                      </div>
                      <div className="col-md-6 text-primary">
                        <input
                          onClick={() => setCurrentlyWorking(!currentlyWorking)}
                          type="checkbox"
                          id="CorrentlyWorking"
                        />
                        <label className="ms-1" htmlFor="CorrentlyWorking">
                          Currently Working
                        </label>
                      </div>
                    </div>
                    <div className="col text-start">
                      <button
                        type="button"
                        className="btn my-2 educationBtn"
                        onClick={() => handleRemoveField("removeExp")}
                      >
                        Close
                      </button>
                    </div>
                  </div>
                ))}
                <div className="text-center">
                  <button
                    className="btn educationBtn my-2"
                    type="button"
                    onClick={() => handleAddField("addExp")}
                  >
                    <FontAwesomeIcon className="me-2" icon={["fas", "plus"]} />
                    Add Experience (If Required)
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>

        {isCollapsed && (
          <input
            disabled={!isValid}
            className="btn btn-primary mt-3 mx-3"
            type="submit"
          />
        )}
      </form>
      <JobArmyEmployment />
    </>
  );
};

export default JobExperience;
