import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import { useForm } from "react-hook-form";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import "../Job.css";

const JobPersonalInfo = () => {
  const user = useSelector((state) => state.auth.user);

  /******** Collaps Sections starts here *******/
  const [isCollapsed, setIsCollapsed] = useState(false);
  /******* Collaps section ends here *******/

  /******* Dynamic Class code starts here *******/
  const [onEdit, setOnEdit] = useState(false);
  /******** Dynamic class code ends here*/

  const [jobInfo, setJobInfo] = useState([]);
  // const [userInfoUpdate, setUserInfoUpdate] = useState({});

  function refreshPage(props) {
    if (props === "closeBtnClicked") {
      setOnEdit(false);
    }
    // window.location.reload(false);
  }

  // console.log("user data: ", user);

  useEffect(() => {
    axios
      .get("http://127.0.0.1:8000/api/jobs/jobprocreate/")
      .then((response) => {
        setJobInfo(response.data);
      });
  }, []);
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
        console.log("error message:", error.message);
      });

    axios
      .put("http://127.0.0.1:8000/api/user/profileupdate/", data, config)
      .then((response) => {
        console.log("User data after update: ", response);
        // setUserInfoUpdate(response)
      })
      .catch((error) => {
        console.log("error message:", error.message);
      });
    // refreshPage() //calling page reloader function
  };

  return (
    <>
      <div className="rounded mx-3">
        <button
          type="button"
          className="border-light mb-3 collapse-button collapseBtn-effect py-2 text-start rounded form-control"
          onClick={() => setIsCollapsed(!isCollapsed)}
        >
          {isCollapsed ? (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-up"]} />
          ) : (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-down"]} />
          )}{" "}
          Personal Details
        </button>
        {isCollapsed && (
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
                      icon={["fas", "info-circle"]}
                    />{" "}
                    General Information
                  </h3>
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    First Name<span className="text-danger">*</span>
                  </small>
                  <input
                    readOnly={user && user.consumer.first_name.value !== null}
                    defaultValue={user && user.consumer.first_name}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("first_name", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>Last Name</small>
                  <input
                    readOnly={user && user.consumer.last_name.value !== null}
                    defaultValue={user && user.consumer.last_name}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("last_name", {
                      required: true,
                    })}
                  />
                </div>

                <div className="col-md-6 mb-2">
                  <small>Father's Name</small>
                  <input
                    readOnly={user && user.consumer.father_name.value !== null}
                    defaultValue={user && user.consumer.father_name}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("father_name", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>Mother's Name</small>
                  <input
                    readOnly={user && user.consumer.mother_name.value !== null}
                    defaultValue={user && user.consumer.mother_name}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("mother_name", {
                      required: true,
                    })}
                  />
                </div>

                <div className="col-md-6 mb-2">
                  <small>
                    Date of Birth<span className="text-danger">*</span>
                  </small>
                  <input
                    readOnly={
                      user && user.consumer.date_of_birth.value !== null
                    }
                    defaultValue={user && user.consumer.date_of_birth}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("date_of_birth", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    Gender<span className="text-danger">*</span>
                  </small>
                  <input
                    readOnly={user && user.consumer.gender.value !== null}
                    defaultValue={user && user.consumer.gender}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("gender", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>Religion</small>
                  <input
                    readOnly={!onEdit}
                    defaultValue={user && user.consumer.religion}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("religion", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    Marital Status<span className="text-danger">*</span>
                  </small>
                  <input
                    readOnly={!onEdit}
                    defaultValue={user && user.consumer.marital_status}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("marital_status", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>Blood Group</small>
                  <input
                    readOnly={!onEdit}
                    defaultValue={user && user.consumer.blood_group}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("blood_group", {
                      required: true,
                    })}
                  />
                </div>
              </div>

              <div className="row gy-2 my-4 pt-2 pb-3 bg-white rounded">
                <div className="mb-2">
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "id-badge"]}
                    />{" "}
                    Identity Information
                  </h3>
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    Nationality<span className="text-danger">*</span>
                  </small>
                  <input
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    defaultValue={jobInfo.nationality}
                    readOnly={user && user.consumer.father_name.value !== null}
                    maxLength="100"
                    {...register("nationality", { required: true })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    National ID No<span className="text-danger">*</span>
                  </small>
                  <input
                    readOnly={user && user.consumer.nid_number.value !== null}
                    defaultValue={user && user.consumer.nid_number}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("nid_number", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>Passport No</small>
                  <input
                    maxLength="100"
                    readOnly={!onEdit}
                    type="text"
                    defaultValue={jobInfo && jobInfo.passport_no}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("passport_no", { required: true })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>Passport Issue Date</small>
                  <input
                    type="date"
                    maxLength="100"
                    readOnly={!onEdit}
                    defaultValue={jobInfo && jobInfo.passport_issue_date}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("passport_issue_date")}
                  />
                </div>
              </div>
              <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                <div className="mb-2">
                  <h3 className="form-field-group-title">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["fas", "address-book"]}
                    />{" "}
                    Contact Information
                  </h3>
                </div>
                <div className="col-md-6 mb-2">
                  <small>Primary Mobile No</small>
                  <input
                    readOnly={!onEdit}
                    defaultValue={user && user.consumer.phone}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("phone", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>Portfolio (if any)</small>
                  <input
                    type="url"
                    readOnly={!onEdit}
                    defaultValue={jobInfo && jobInfo.portfolio_link}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("portfolio_link")}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    Emergency Contact No
                    <span className="text-danger">*</span>
                  </small>
                  <input
                    type="number"
                    readOnly={!onEdit}
                    maxLength="100"
                    defaultValue={jobInfo && jobInfo.emergency_contact_no}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("emergency_contact_no", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>Primary Email</small>
                  <input
                    readOnly={(user && user.email) || !onEdit}
                    defaultValue={user && user.email}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("email", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-6 mb-2">
                  <small>
                    Alternate Email<span className="text-danger">*</span>
                  </small>
                  <input
                    type="email"
                    readOnly={!onEdit}
                    defaultValue={jobInfo && jobInfo.alternative_email}
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    {...register("alternative_email", { required: true })}
                  />
                </div>
              </div>
              <button
                type="reset"
                onClick={() => refreshPage("closeBtnClicked")}
                className={`btn ehsanBtn px-2 me-2 ${!onEdit && "d-none"}`}
              >
                <FontAwesomeIcon className="me-1" icon={["fas", "times"]} />{" "}
                Close
              </button>
              <button
                className={`btn ehsanBtn px-2 me-2 ${!onEdit && "d-none"}`}
                onClick={() => setOnEdit(!onEdit)}
                type="submit"
              >
                <FontAwesomeIcon className="me-1" icon={["fas", "save"]} /> Save
              </button>
            </div>
          </form>
        )}
      </div>
    </>

    /****** React Hook form ends here *******/
  );
};

export default JobPersonalInfo;
