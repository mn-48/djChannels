import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useState } from "react";
import { useForm } from "react-hook-form";

const JobReference = () => {
  /****** Dynamic input field code starts here */

  /* Dynamic empty form msg states starts here */
  const [skillMsg, setSkillMsg] = useState(true);
  const [projectMsg, setProjectMsg] = useState(true);
  const [EAMsg, setEAMsg] = useState(true);
  const [trainingMsg, setTrainingMsg] = useState(true);
  /** Dynamic empty form msg states ends here*/

  console.log(skillMsg, projectMsg, EAMsg, trainingMsg);

  // const [emptyMsgToggle, setEmptyMsgToggle] = useState(true);
  const [addSkill, setAddSkill] = useState([]);
  const [addProject, setAddProject] = useState([]);
  const [addEA, setAddEA] = useState([]);
  const [addTraining, setAddTraining] = useState([]);

  const handleAddField = (add) => {
    if (add === "addSkill") {
      setAddSkill([...addSkill, {}]);
    } else if (add === "addProject") {
      setAddProject([...addProject, {}]);
    } else if (add === "add-EA") {
      setAddEA([...addEA, {}]);
    } else if (add === "addTraining") {
      setAddTraining([...addTraining, {}]);
    }
  };

  const handleRemoveField = (remove, index) => {
    const skills = [...addSkill];
    if (skills.length <= 0) {
      setSkillMsg(true);
    }

    const projects = [...addProject];
    if (projects.length <= 0) {
      setProjectMsg(true);
    }

    const EA = [...addEA];
    if (EA.length <= 0) {
      setEAMsg(true);
    }

    const training = [...addTraining];
    if (training.length <= 0) {
      setTrainingMsg(true);
    }

    if (remove === "removeSkill") {
      skills.splice(index, 1);
      setAddSkill(skills);
    } else if (remove === "removeProject") {
      projects.splice(index, 1);
      setAddProject(projects);
    } else if (remove === "remove-EA") {
      EA.splice(index, 1);
      setAddEA(EA);
    } else if (remove === "removeTraining") {
      training.splice(index, 1);
      setAddTraining(training);
    }
  };

  /******** Dynamic Inpt field code ends here */

  const [isCollapsed2ndDiv, setIsCollapsed2ndDiv] = useState(false);

  const relationArray = [
    "Relative",
    "Family Friend",
    "Academic",
    "Professional",
    "Others",
  ];

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
      .post("http://127.0.0.1:8000/api/jobs/reference/", data, config)
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
      <form className="form-group  mt-3 mb-3" onSubmit={handleSubmit(onSubmit)}>
        <div className="rounded mx-3">
          <button
            type="button"
            className="border-light mb-3 collapse-button collapseBtn-effect py-2 text-start rounded form-control"
            onClick={() => setIsCollapsed2ndDiv(!isCollapsed2ndDiv)}
          >
            {isCollapsed2ndDiv ? (
              <FontAwesomeIcon className="me-2" icon={["fas", "chevron-up"]} />
            ) : (
              <FontAwesomeIcon
                className="me-2"
                icon={["fas", "chevron-down"]}
              />
            )}{" "}
            References
          </button>
          {isCollapsed2ndDiv && (
            <div className="mx-3">
              <div>
                {addTraining.map((inputField, index) => (
                  <div key={index}>
                    <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                      <div className="mb-2">
                        <h3 className="form-field-group-title">
                          <FontAwesomeIcon
                            className="me-2"
                            icon={["fas", "info-circle"]}
                          />{" "}
                          Reference
                        </h3>
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Name<span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("name")}
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
                        <small>
                          Organization<span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("organization")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Email</small>
                        <input
                          className="form-control"
                          type="text"
                          {...register("email")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Relation</small>
                        <select
                          className="dropdown-item border border-dark rounded"
                          {...register("relation", { required: true })}
                        >
                          {relationArray.map((arr, index) => (
                            <option key={index} value={arr}>
                              {arr}
                            </option>
                          ))}
                        </select>
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Mobile</small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("mobile")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Phone (Off)</small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("phone_off")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Phone (Res)</small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("phone_res")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Address</small>
                        <textarea
                          rows="3"
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("address")}
                        />
                      </div>
                    </div>
                    <div className="col text-start">
                      <button
                        className="btn my-2 educationBtn"
                        type="button"
                        onClick={() => handleRemoveField("removeTraining")}
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
                    onClick={() => handleAddField("addTraining")}
                  >
                    <FontAwesomeIcon className="me-2" icon={["fas", "plus"]} />
                    Add Reference (If Required)
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>

        {isCollapsed2ndDiv && (
          <input
            disabled={!isValid}
            className="btn btn-primary mt-3 mx-3"
            type="submit"
          />
        )}
      </form>
    </>
  );
};

export default JobReference;
