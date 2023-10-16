import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useState, useEffect } from "react";
import { useForm } from "react-hook-form";
import JobProfSummery from "./JobProfSummery";
import JobTraining from "./JobTraining";

const JobEducation = () => {
  /****** Dynamic input field code starts here */
  const [eduInputFields, eduSetInputFields] = useState([]);
  const [emptyMsgToggle, setEmptyMsgToggle] = useState(true);

  const handleAddField = (add) => {
    setEmptyMsgToggle(false);
    if (add === "addEdu") {
      eduSetInputFields([...eduInputFields, {}]);
    }
  };
  const handleRemoveField = (remove, index) => {
    const values = [...eduInputFields];
    values.splice(index, 1);
    console.log(remove);
    setEmptyMsgToggle(true);
    if (remove === "removeEdu") {
      eduSetInputFields(values);
    }
  };
  /******** Dynamic Inpt field code ends here */

  const [isCollapsed, setIsCollapsed] = useState(false);

  const eduLevelArray = [
    "PSC/5 pass",
    "JSC/JDC/8 pass",
    "Secondary",
    "Higher Secondary",
    "Diploma",
    "Bachelor/Honors",
    "Masters",
    "PhD (Doctor of Philosophy)",
  ];

  const degreeArray = [
    "SSC",
    "O Level",
    "Dakhil(Madrasah)",
    "SSC (Vocational)",
    "Other",
  ];

  const boardArray = [
    "Barishal",
    "Chattogram",
    "Cumilla",
    "Dhaka",
    "Dinajpur",
    "Jashore",
    "Mymensingh",
    "Rajshahi",
    "Sylhet",
    "Madrasah",
    "Technical",
  ];

  const resultArray = [
    "First Division/Class",
    "Second  Division/Class",
    "Third Division/Class",
    "Grade",
    "Appeared",
    "Enrolled",
    "Awarded",
    "Do not mention",
    "Pass",
  ];

  const [yearArray, setYearArray] = useState([]);
  const passingYearsArray = [];
  let d = new Date();
  let n = d.getFullYear();
  let startYear = n;

  useEffect(() => {
    for (let i = startYear; i >= startYear - 80; i--) {
      passingYearsArray.push(i);
    }
    setYearArray(passingYearsArray);
  }, []);

  const {
    register,
    handleSubmit,
    formState: { isValid },
  } = useForm();
  const onSubmit = (data) => {
    console.log(data);
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    axios
      .post("http://127.0.0.1:8000/api/jobs/education/", data, config)
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
      <form className="form-group mb-3 mt-3" onSubmit={handleSubmit(onSubmit)}>
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
            Academic Summery
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
                {eduInputFields.map((inputField, index) => (
                  <div key={index}>
                    <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                      <div className="mb-2">
                        <h3 className="form-field-group-title">
                          <FontAwesomeIcon
                            className="me-2"
                            icon={["fas", "info-circle"]}
                          />{" "}
                          Academic
                        </h3>
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Level of Education
                          <span className="text-danger">*</span>
                        </small>
                        <select
                          className="dropdown-item border border-dark rounded"
                          {...register("level_of_edu", { required: true })}
                        >
                          {eduLevelArray.map((arr, index) => (
                            <option key={index} value={arr}>
                              {arr}
                            </option>
                          ))}
                        </select>
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Exam/Degree Title
                          <span className="text-danger">*</span>
                        </small>
                        <select
                          className="dropdown-item border border-dark rounded"
                          {...register("degree_or_exam", { required: true })}
                        >
                          {degreeArray.map((arr, index) => (
                            <option key={index} value={arr}>
                              {arr}
                            </option>
                          ))}
                        </select>
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Concentration/ Major/Group
                          <span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("major_in")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Exam/Degree Title
                          <span className="text-danger">*</span>
                        </small>
                        <select
                          className="dropdown-item border border-dark rounded"
                          {...register("board", { required: true })}
                        >
                          {boardArray.map((arr, index) => (
                            <option key={index} value={arr}>
                              {arr}
                            </option>
                          ))}
                        </select>
                      </div>
                      <div className="col-md-12 mb-2">
                        <small>
                          Institute Name<span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("institude_name")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Result<span className="text-danger">*</span>
                        </small>
                        <select
                          className="dropdown-item border border-dark rounded"
                          {...register("result", { required: true })}
                        >
                          {resultArray.map((arr, index) => (
                            <option key={index} value={arr}>
                              {arr}
                            </option>
                          ))}
                        </select>
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>CGPA</small>
                        <input
                          className="form-control"
                          type="number"
                          {...register("cgpa")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Scale</small>
                        <input
                          className="form-control"
                          type="number"
                          {...register("scale")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Year of Passing</small>
                        <select
                          className="dropdown-item border border-dark rounded"
                          {...register("year_of_passing", { required: true })}
                        >
                          {yearArray.map((arr, index) => (
                            <option key={index} value={arr}>
                              {arr}
                            </option>
                          ))}
                        </select>
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Duration (years)</small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("duration")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Achievement</small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("achievement")}
                        />
                      </div>
                    </div>
                    <div className="col text-start">
                      <button
                        type="button"
                        className="btn my-2 educationBtn"
                        onClick={() => handleRemoveField("removeEdu")}
                      >
                        Close
                      </button>
                      <button
                        disabled={!isValid}
                        className="btn btn-primary my-2 mx-3"
                        type="submit"
                      >
                        Save
                      </button>
                    </div>
                  </div>
                ))}
                <div className="text-center">
                  <button
                    type="button"
                    className="btn educationBtn my-2"
                    onClick={() => handleAddField("addEdu")}
                  >
                    <FontAwesomeIcon className="me-2" icon={["fas", "plus"]} />
                    Add Education (If Required)
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>
      </form>
      <JobTraining />
      <JobProfSummery />
    </>
  );
};

export default JobEducation;
