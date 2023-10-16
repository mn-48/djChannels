import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useEffect, useState } from "react";
import { useForm } from "react-hook-form";

const JobTraining = () => {
  /****** Dynamic input field code starts here */
  const [addedTrainFld, setAddedTrainFld] = useState({})
  const [trainingInputField, setTrainingInputField] = useState([addedTrainFld]);
  const [emptyMsgToggle, setEmptyMsgToggle] = useState(true);
  const [isCollapsed2ndDiv, setIsCollapsed2ndDiv] = useState(false);

  const handleAddFeild = (add) => {
    setEmptyMsgToggle(false);
    if (add === "addTraining") {
      setTrainingInputField([...trainingInputField, {}]);
    }
  };
  const handleRemoveFeild = (remove, index) => {
    console.log(remove);
    setEmptyMsgToggle(true);
    if (remove === "removeTraining") {
      const removingVlaue = [...trainingInputField];
      removingVlaue.splice(index, 1);
      setTrainingInputField(removingVlaue);
    }
  };
  /******** Dynamic Inpt field code ends here */
  useEffect(() => {
    axios.get("http://127.0.0.1:8000/api/jobs/training/")
      .then(response => {
        console.log(response);
        setAddedTrainFld(response.data)

      })
  }, [])


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
      .post("http://127.0.0.1:8000/api/jobs/training/", data, config)
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
          onClick={() => setIsCollapsed2ndDiv(!isCollapsed2ndDiv)}
        >
          {isCollapsed2ndDiv ? (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-up"]} />
          ) : (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-down"]} />
          )}{" "}
          Training Summery
        </button>

        {isCollapsed2ndDiv && (
          <div className="mx-3">
            {emptyMsgToggle && (
              <div className="text-center p-5">
                <p>
                  Currently no data exists! Please click on the following button
                  to add your training information.
                </p>
              </div>
            )}
            <div>
              {trainingInputField.map((inputField, index) => (
                <div key={index}>
                  <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                    <div className="mb-2">
                      <h3 className="form-field-group-title">
                        <FontAwesomeIcon
                          className="me-2"
                          icon={["fas", "info-circle"]}
                        />{" "}
                        Training
                      </h3>
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>
                        Training Title<span className="text-danger">*</span>
                      </small>
                      <input
                        className="form-control"
                        type="text"
                        maxLength="100"
                        defaultValue={addedTrainFld.title}
                        {...register("title")}
                      />
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>
                        Country<span className="text-danger">*</span>
                      </small>
                      <input
                        className="form-control"
                        type="text"
                        maxLength="100"
                        defaultValue={addedTrainFld.country}
                        {...register("country")}
                      />
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>Topics Covered</small>
                      <input
                        className="form-control"
                        type="text"
                        maxLength="100"
                        {...register("topic_covered")}
                      />
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>
                        Training Year<span className="text-danger">*</span>
                      </small>
                      <input
                        className="form-control"
                        type="number"
                        {...register("training_year")}
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
                      <small>Duration</small>
                      <span className="text-danger">*</span>
                      <input
                        className="form-control"
                        type="number"
                        {...register("duration")}
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
                  </div>
                  <div className="col text-start">
                    <button
                      type="button"
                      className="btn my-2 educationBtn"
                      onClick={() => handleRemoveFeild("removeTraining")}
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
                  onClick={() => handleAddFeild("addTraining")}
                >
                  <FontAwesomeIcon className="me-2" icon={["fas", "plus"]} />
                  Add Training (If Required)
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    </form>
  );
};

export default JobTraining;
