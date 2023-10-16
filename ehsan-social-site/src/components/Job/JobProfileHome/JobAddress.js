import React, { useState } from "react";
import { useSelector } from "react-redux";
import { useForm } from "react-hook-form";
import axios from "axios";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import "../Job.css";

const JobAddress = () => {
  /******* Dynamic Class code starts here *******/
  const [onEdit, setOnEdit] = useState(false);
  /******** Dynamic class code ends here*/

  const user = useSelector((state) => state.auth.user);

  /******** Collaps Sections starts here *******/
  const [isCollapsed2ndDiv, setIsCollapsed2ndDiv] = useState(false);
  /**** ends collapse */

  const refreshPage = (props) => {
    if (props === "closeBtnClicked") {
      setOnEdit(false);
    }
    // window.location.reload(false);
  };
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

    axios
      .put("http://127.0.0.1:8000/api/user/profileupdate/", data, config)
      .then((response) => {
        console.log("User data after update response: ", response);
        // setUserInfoUpdate(response)
      })
      .catch((error) => {
        console.log("error message:", error.message);
      });
    // refreshPage() //calling the reloader function
  };

  return (
    <>
      <div className="rounded mx-3">
        <button
          type="button"
          className="border-light mb-3 collapse-button collapseBtn-effect py-2 text-start rounded form-control"
          onClick={() => setIsCollapsed2ndDiv(!isCollapsed2ndDiv)}
        >
          {isCollapsed2ndDiv ? (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-up"]} />
          ) : (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-down"]} />
          )}{" "}
          Address Details
        </button>

        {isCollapsed2ndDiv && (
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
                      icon={["fas", "address-card"]}
                    />{" "}
                    Address
                  </h3>
                </div>
                <div className="col-md-12 mb-2">
                  <small>
                    Present Address<span className="text-danger">*</span>
                  </small>
                  <textarea
                    rows="2"
                    readOnly={!onEdit}
                    defaultValue={user && user.consumer.address2}
                    className={`${
                      onEdit ? "form-control" : "editForm textareaDeco"
                    }`}
                    {...register("address2", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-12 mb-2">
                  <small>
                    Permanent Address<span className="text-danger">*</span>
                  </small>
                  <textarea
                    rows="2"
                    readOnly={!onEdit}
                    defaultValue={user && user.consumer.address1}
                    className={`${
                      onEdit ? "form-control" : "editForm textareaDeco"
                    }`}
                    {...register("address1", {
                      required: true,
                    })}
                  />
                </div>
                <div className="col-md-12 mb-2">
                  <small>
                    Country<span className="text-danger">*</span>
                  </small>
                  <input
                    className={`${onEdit ? "form-control" : "editForm"}`}
                    readOnly={!onEdit}
                    maxLength="100"
                    defaultValue={user && user.consumer.country.name}
                    {...register("country", {
                      required: true,
                    })}
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

export default JobAddress;
