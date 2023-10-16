import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { useForm } from "react-hook-form";

const JobDisability = () => {
  /****** get Job disability info code starts here */
  /******* Dynamic Class code starts here *******/
  const [onEdit, setOnEdit] = useState(false);
  /******** Dynamic class code ends here*/
  const [disabilityInfo, setDisabilityInfo] = useState([]);
  const [loading, setLoading] = useState(false);
  const [isCollapsed6thDiv, setIsCollapsed6thDiv] = useState(false);
  const [yes, setYes] = useState(false);
  const [showSwitch, setShowSwitch] = useState(0);
  const [ndid, setNdid] = useState("");

  console.log(loading);

  function refreshPage(props) {
    if (props === "closeBtnClicked") {
      setOnEdit(false);
    }
    // window.location.reload(false);
    if (props === "formSubmitted") {
      setOnEdit(!onEdit);
    }
  }

  useEffect(() => {
    setLoading(true);
    axios.get("http://127.0.0.1:8000/api/jobs/disability/").then((response) => {
      console.log(response);
      setDisabilityInfo(response.data);
      setNdid(response.data.national_disability_id);

      if (response.data) {
        setLoading(false);
      }
    });
  }, []);

  /****** get Job disability info code ends here */

  /******* Show on Resume Switch starts here *******/

  const handleSwitch = () => {
    setShowSwitch(!showSwitch);
  };
  /*********Show on Resume Switch ends here *******/

  /****** Disability event handlar.. disability yes or no *****/

  const handleYesClick = () => {
    setYes(true);
  };

  const handleNoClick = () => {
    setYes(false);
  };
  /******** Disability event handlar ends here *********/

  // console.log('ndid is', ndid);

  const { register, handleSubmit } = useForm();

  const onSubmit = (data) => {
    const noDisabilityData = {
      national_disability_id: "",
      disability_to_communicate: "",
      disability_to_concentrade: "",
      disability_to_hear: "",
      disability_to_remember: "",
      disability_to_see: "",
      disability_to_sit_stand_walk_climbStairs: "",
      disability_to_taking_care: "",
    };

    if (!yes) {
      data = noDisabilityData;
    }
    console.log(data);
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    axios
      .post("http://127.0.0.1:8000/api/jobs/disability/", data, config)
      .then((response) => {
        console.log("data after submit  response", response);
        setDisabilityInfo(response.data);
      })
      .catch((error) => {
        console.log("submit error:", error);

        console.log("error message:", error.message);
      });
  };
  return (
    <>
      <div className="rounded mx-3">
        <button
          className="border-light mb-3 collapse-button collapseBtn-effect py-2 text-start rounded form-control"
          onClick={() => setIsCollapsed6thDiv(!isCollapsed6thDiv)}
          type="button"
        >
          {isCollapsed6thDiv ? (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-up"]} />
          ) : (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-down"]} />
          )}{" "}
          Disability Information (if any)
        </button>
        {isCollapsed6thDiv && (
          <form
            id="disability-form"
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
                  <h5 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fab", "accessible-icon"]}
                    />{" "}
                    Disability Information
                  </h5>
                </div>
                <div className={`${!onEdit ? "d-none" : "mb-2"}`}>
                  <small>
                    Do you have National Disability ID Number?
                    <span className="text-danger">*</span>
                  </small>{" "}
                  <br />
                  <input
                    onClick={() => handleYesClick()}
                    defaultValue={disabilityInfo.national_disability_id}
                    defaultChecked={disabilityInfo.national_disability_id}
                    required
                    className="form-check-input"
                    type="radio"
                    name="flexRadioDefault"
                    id="flexRadioDefault1"
                  />
                  <label
                    className="form-check-label ms-1"
                    htmlFor="flexRadioDefault1"
                  >
                    Yes
                  </label>
                  <input
                    onClick={() => handleNoClick()}
                    required
                    defaultValue={disabilityInfo.national_disability_id}
                    defaultChecked={disabilityInfo.national_disability_id}
                    className="form-check-input ms-3"
                    type="radio"
                    name="flexRadioDefault"
                    id="flexRadioDefault2"
                  />
                  <label
                    className="form-check-label ms-1"
                    htmlFor="flexRadioDefault2"
                  >
                    No
                  </label>
                </div>
                <div
                  className={`${
                    !disabilityInfo.national_disability_id && !onEdit
                      ? "ms-4"
                      : "d-none"
                  }`}
                >
                  <small>National Disability ID</small> <br />
                  <small>You didn't mention your ID yet.</small>
                </div>
                {!yes && onEdit && (
                  <div className="text-danger text-center">
                    <small>
                      If you submit "No", all your saved information will be
                      deleted
                    </small>
                  </div>
                )}

                <div>
                  {disabilityInfo.national_disability_id || yes ? (
                    <div className="row mb-2">
                      <div className="col-md-6">
                        <small>
                          National Disability ID
                          <span className="text-danger">*</span>
                        </small>{" "}
                        <br />
                        <input
                          type="text"
                          id="ndid"
                          readOnly={!onEdit}
                          defaultValue={ndid}
                          onKeyUp={(event) => setNdid(event.target.value)}
                          className={`${onEdit ? "form-control" : "editForm"}`}
                          maxLength="20"
                          {...register("national_disability_id", {
                            required: true,
                          })}
                        />
                      </div>
                      <div className="col-md-6 mb-2">
                        <div>
                          <small>Show on Resume</small>
                        </div>
                        <label className="switch">
                          <input
                            defaultChecked={disabilityInfo.show_on_resume}
                            defaultValue={showSwitch}
                            disabled={!onEdit || !ndid}
                            onClick={() => handleSwitch()}
                            type="checkbox"
                            {...register("show_on_resume")}
                          />
                          <span className="slider round"></span>
                        </label>
                      </div>

                      <div className="col-md-6 mb-2">
                        <small>Difficulty to See</small>
                        {onEdit ? (
                          <select
                            disabled={!ndid}
                            defaultValue={disabilityInfo.disability_to_see}
                            className="dropdown-item border border-dark rounded"
                            {...register("disability_to_see", {
                              required: true,
                            })}
                          >
                            <option defaultValue="Yes">Yes</option>
                            <option defaultValue="No">No</option>
                          </select>
                        ) : (
                          <input
                            type="text"
                            defaultValue={disabilityInfo.disability_to_see}
                            readOnly={!onEdit}
                            className="editForm"
                          />
                        )}
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Difficulty to Hear</small>
                        {onEdit ? (
                          <select
                            disabled={!ndid}
                            defaultValue={disabilityInfo.disability_to_hear}
                            className="dropdown-item border border-dark rounded"
                            {...register("disability_to_hear", {
                              required: true,
                            })}
                          >
                            <option defaultValue="Yes">Yes</option>
                            <option defaultValue="No">No</option>
                          </select>
                        ) : (
                          <input
                            type="text"
                            defaultValue={disabilityInfo.disability_to_hear}
                            readOnly={!onEdit}
                            className="editForm"
                          />
                        )}
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Difficulty to Communicate</small>
                        {onEdit ? (
                          <select
                            disabled={!ndid}
                            defaultValue={
                              disabilityInfo.disability_to_communicate
                            }
                            className="dropdown-item border border-dark rounded"
                            {...register("disability_to_communicate", {
                              required: true,
                            })}
                          >
                            <option defaultValue="Yes">Yes</option>
                            <option defaultValue="No">No</option>
                          </select>
                        ) : (
                          <input
                            type="text"
                            defaultValue={
                              disabilityInfo.disability_to_communicate
                            }
                            readOnly={!onEdit}
                            className="editForm"
                          />
                        )}
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Difficulty to Concentrate</small>
                        {onEdit ? (
                          <select
                            disabled={!ndid}
                            defaultValue={
                              disabilityInfo.disability_to_concentrade
                            }
                            className="dropdown-item border border-dark rounded"
                            {...register("disability_to_concentrade", {
                              required: true,
                            })}
                          >
                            <option defaultValue="Yes">Yes</option>
                            <option defaultValue="No">No</option>
                          </select>
                        ) : (
                          <input
                            type="text"
                            defaultValue={
                              disabilityInfo.disability_to_concentrade
                            }
                            readOnly={!onEdit}
                            className="editForm"
                          />
                        )}
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>Difficulty to Remember</small>
                        {onEdit ? (
                          <select
                            disabled={!ndid}
                            defaultValue={disabilityInfo.disability_to_remember}
                            className="dropdown-item border border-dark rounded"
                            {...register("disability_to_remember", {
                              required: true,
                            })}
                          >
                            <option defaultValue="Yes">Yes</option>
                            <option defaultValue="No">No</option>
                          </select>
                        ) : (
                          <input
                            type="text"
                            defaultValue={disabilityInfo.disability_to_remember}
                            readOnly={!onEdit}
                            className="editForm"
                          />
                        )}
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Difficulty to Sit, Stand, Walk or Climb Stairs
                        </small>
                        {onEdit ? (
                          <select
                            disabled={!ndid}
                            defaultValue={
                              disabilityInfo.disability_to_sit_stand_walk_climbStairs
                            }
                            className="dropdown-item border border-dark rounded"
                            {...register(
                              "disability_to_sit_stand_walk_climbStairs",
                              { required: true }
                            )}
                          >
                            <option defaultValue="Yes">Yes</option>
                            <option defaultValue="No">No</option>
                          </select>
                        ) : (
                          <input
                            type="text"
                            defaultValue={
                              disabilityInfo.disability_to_sit_stand_walk_climbStairs
                            }
                            readOnly={!onEdit}
                            className="editForm"
                          />
                        )}
                      </div>
                      <div className="col-md-6 mb-2">
                        <small>
                          Difficulty of Taking Care{" "}
                          <span className="fontSize">
                            (example: shower, wearing clothes)
                          </span>
                        </small>
                        {onEdit ? (
                          <select
                            disabled={!ndid}
                            defaultValue={
                              disabilityInfo.disability_to_taking_care
                            }
                            className="dropdown-item border border-dark rounded"
                            {...register("disability_to_taking_care", {
                              required: true,
                            })}
                          >
                            <option defaultValue="Yes">Yes</option>
                            <option defaultValue="No">No</option>
                          </select>
                        ) : (
                          <input
                            type="text"
                            defaultValue={
                              disabilityInfo.disability_to_taking_care
                            }
                            readOnly={!onEdit}
                            className="editForm"
                          />
                        )}
                      </div>
                    </div>
                  ) : (
                    <div className="col-md-12 mb-2">
                      <p className="border border-dark rounded p-2 mt-4">
                        If you are a person with disability and have no
                        Disability ID Number, please contact i2i support +88
                        017777**** by Call/ SMS/ WhatsApp
                      </p>
                    </div>
                  )}
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
                onClick={() => refreshPage("formSubmitted")}
                type="submit"
              />
            </div>
          </form>
        )}
      </div>
    </>
  );
};

export default JobDisability;
