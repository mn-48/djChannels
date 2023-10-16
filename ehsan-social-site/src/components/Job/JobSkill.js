import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useState } from "react";
import { useForm } from "react-hook-form";

const JobSkill = () => {
  /****** Dynamic input field code starts here */

  /* Dynamic empty form msg states starts here */
  const [skillMsg, setSkillMsg] = useState(true);
  /** Dynamic empty form msg states ends here*/

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

    if (remove === "removeSkill") {
      skills.splice(index, 1);
      setAddSkill(skills);
    }
  };

  /******** Dynamic Inpt field code ends here */

  const [isCollapsed, setIsCollapsed] = useState(false);

  const learnedByArray = [
    "Self",
    "Job",
    "Educational",
    "Professional Training",
    "NTVQF",
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
      .post("http://127.0.0.1:8000/api/jobs/skills/", data, config)
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
            Skills
          </button>

          {isCollapsed && (
            <div className="mx-3">
              {skillMsg && (
                <div className="text-center p-5">
                  <p>
                    Currently no data exists! Please click on the following
                    button to add your skill.
                  </p>
                </div>
              )}
              <div>
                {addSkill.map((inputField, index) => (
                  <div key={index}>
                    <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                      <div className="mb-2">
                        <h3 className="form-field-group-title">
                          <FontAwesomeIcon
                            className="me-2"
                            icon={["fas", "info-circle"]}
                          />{" "}
                          Skill
                        </h3>
                      </div>
                      <div className="col-md-12 mb-2">
                        <small>
                          Skill Name<span className="text-danger">*</span>
                        </small>
                        <input
                          className="form-control"
                          type="text"
                          maxLength="100"
                          {...register("skill_name")}
                        />
                      </div>
                      <div className="col-md-12 mb-2">
                        <small>
                          How did you learn the skill?
                          <span className="text-danger">*</span>
                        </small>{" "}
                        <br />
                        {learnedByArray.map((learnedBy, index) => (
                          <span className="m-2">
                            <input
                              id="learnedBy"
                              type="checkbox"
                              key={index}
                              defaultValue={learnedBy}
                              {...register("learned_by")}
                            />
                            <label className="ms-1" htmlFor="learnedBy">
                              {learnedBy}
                            </label>
                          </span>
                        ))}
                      </div>
                    </div>
                    <div className="col text-start">
                      <button
                        type="button"
                        className="btn my-2 educationBtn"
                        onClick={() => handleRemoveField("removeSkill")}
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
                    onClick={() => handleAddField("addSkill")}
                  >
                    <FontAwesomeIcon className="me-2" icon={["fas", "plus"]} />
                    Add Skill
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
    </>
  );
};

export default JobSkill;
