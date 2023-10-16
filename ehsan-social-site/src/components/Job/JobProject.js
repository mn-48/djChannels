import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useState } from "react";
import { useForm } from "react-hook-form";
import JobReference from "./JobReference";
import JobSkill from "./JobSkill";

const JobProject = () => {
  /****** Dynamic input field code starts here */

  /* Dynamic empty form msg states starts here */
  const [skillMsg, setSkillMsg] = useState(true);
  const [projectMsg, setProjectMsg] = useState(true);
  const [EAMsg, setEAMsg] = useState(true);
  const [trainingMsg, setTrainingMsg] = useState(true);
  /** Dynamic empty form msg states ends here*/

  console.log(skillMsg, EAMsg, trainingMsg);

  // const [emptyMsgToggle, setEmptyMsgToggle] = useState(true);
  const [addSkill, setAddSkill] = useState([]);
  const [addProject, setAddProject] = useState([]);
  const [addEA, setAddEA] = useState([]);
  const [addTraining, setAddTraining] = useState([]);

  const handleAddFeild = (add) => {
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

  const handleRemoveFeild = (remove, index) => {
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

  const [isCollapsed, setIsCollapsed] = useState(false);
  // const [isCollapsed2ndDiv, setIsCollapsed2ndDiv] = useState(false);

  // const learnedByArray = [
  //   "Self",
  //   "Job",
  //   "Educational",
  //   "Professional Training",
  //   "NTVQF",
  // ];

  // const relationArray = [
  //   "Relative",
  //   "Family Friend",
  //   "Academic",
  //   "Professional",
  //   "Others",
  // ];

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
      .post("http://127.0.0.1:8000/api/jobs/projectworks/", data, config)
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
      <form className="form-group" onSubmit={handleSubmit(onSubmit)}>
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
            Projects
          </button>

          {isCollapsed && (
            <div className="mx-3">
              {projectMsg && (
                <div className="text-center p-5">
                  <p>
                    Currently no data exists! Please click on the following
                    button to add your Skill Description.
                  </p>
                </div>
              )}
              <div>
                {addProject.map((inputField, index) => (
                  <div key={index}>
                    <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                      <div className="col-md-12 mb-2">
                        <small>
                          Project Name
                          <span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("name", { required: true })}
                        />
                      </div>
                      <div className="col-md-12 mb-2">
                        <small>
                          Project Description
                          <span className="text-danger">*</span>
                        </small>
                        <textarea
                          rows="4"
                          className="form-control"
                          type="text"
                          {...register("description")}
                        />
                      </div>
                      <div className="col-md-12 mb-2">
                        <small>
                          Tools Used
                          <span className="text-danger">*</span>
                        </small>
                        <textarea
                          rows="4"
                          className="form-control"
                          type="text"
                          {...register("tools", { required: true })}
                        />
                      </div>
                      <div className="col-md-12 mb-2">
                        <small>
                          Live Link
                          <span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="url"
                          {...register("tools", { required: true })}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Contribution
                          <span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("contribution")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Is Live
                          <span came="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("is_live")}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>What did you learn from this project?</small>
                        <textarea
                          className="form-control"
                          type="text"
                          {...register("learings")}
                        />
                      </div>
                    </div>
                    <div className="col text-start">
                      <button
                        type="button"
                        className="btn my-2 educationBtn"
                        onClick={() => handleRemoveFeild("removeProject")}
                      >
                        Close
                      </button>
                    </div>
                  </div>
                ))}
                <div className="text-center">
                  <button
                    type="button"
                    className="btn educationBtn my-2"
                    onClick={() => handleAddFeild("addProject")}
                  >
                    <FontAwesomeIcon className="me-2" icon={["fas", "plus"]} />
                    Add Project
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
      <JobSkill />
      <JobReference />
    </>
  );
};

export default JobProject;
