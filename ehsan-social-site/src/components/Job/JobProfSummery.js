import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useState } from "react";
import { useForm } from "react-hook-form";

const JobProfSummery = () => {
  /****** Dynamic input field code starts here */
  const [certificateInputField, setCertificateInputField] = useState([]);
  const [emptyMsgToggle, setEmptyMsgToggle] = useState(true);

  const handleAddField = (add) => {
    setEmptyMsgToggle(false);
    if (add === "addCertificate") {
      setCertificateInputField([...certificateInputField, {}]);
    }
  };
  const handleRemoveField = (remove, index) => {
    console.log(remove);
    setEmptyMsgToggle(true);
    if (remove === "removeCertificate") {
      const removeCertificate = [...certificateInputField];
      removeCertificate.splice(index, 1);
      setCertificateInputField(removeCertificate);
    }
  };
  /******** Dynamic Inpt field code ends here */
  const [isCollapsed3rdDiv, setIsCollapsed3rdDiv] = useState(false);

  const {
    register,
    handleSubmit,
    formState: { isValid },
  } = useForm();
  const onSubmit = (data) => {
    console.log(data);
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`
      },
    };


    axios
      .post(
        "http://127.0.0.1:8000/api/jobs/pro-certificate/",
        data,
        config)
      .then((response) => {
        console.log("data after submit  response", response);

      })
      .catch((error) => {
        console.log("submit error:", error);

        console.log("error message:", error.message);

      });
  };
  return (
    <form className="form-group mb-3 mt-3" onSubmit={handleSubmit(onSubmit)}>
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
          Professional Certification Summery
        </button>

        {isCollapsed3rdDiv && (
          <div className="mx-3">
            {emptyMsgToggle && (
              <div className="text-center p-5">
                <p>
                  Currently no data exists! Please click on the following button
                  to add your professional qualification.
                </p>
              </div>
            )}
            <div>
              {certificateInputField.map((inputField, index) => (
                <div key={index}>
                  <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                    <div className="mb-2">
                      <h3 className="form-field-group-title">
                        <FontAwesomeIcon
                          className="me-2"
                          icon={["fas", "info-circle"]}
                        />{" "}
                        Professional Qualification
                      </h3>
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>
                        Certification<span className="text-danger">*</span>
                      </small>
                      <input
                        className="form-control"
                        type="text"
                        maxLength="100"
                        {...register("certification")}
                      />
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>
                        Institute<span className="text-danger">*</span>
                      </small>
                      <input
                        className="form-control"
                        type="text"
                        maxLength="100"
                        {...register("institute")}
                      />
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>Location</small>
                      <input
                        className="form-control"
                        type="text"
                        maxLength="100"
                        {...register("location")}
                      />
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>
                        Duration<span className="text-danger">*</span>
                      </small>
                      <div className="row">
                        <div className="col-md-6">
                          <input
                            className="form-control"
                            placeholder="Start-Date"
                            type="date"
                            {...register("start_date")}
                          />
                          <div className="text-center">
                            <small>Start Date</small>
                          </div>
                        </div>
                        <div className="col-md-6">
                          <input
                            className="form-control"
                            placeholder="End-Date"
                            type="date"
                            {...register("end_date")}
                          />
                          <div className="text-center">
                            <small>End Date</small>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div className="col text-start">
                    <button
                      type="button"
                      className="btn my-2 educationBtn"
                      onClick={() => handleRemoveField("removeCertificate")}
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
                  onClick={() => handleAddField("addCertificate")}
                >
                  <FontAwesomeIcon className="me-2" icon={["fas", "plus"]} />
                  Add Professional Qualification
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </form>
  );
};

export default JobProfSummery;
