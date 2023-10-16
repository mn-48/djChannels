import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import axios from "axios";
import React, { useState } from "react";
import { useForm } from "react-hook-form";

const JobArmyEmployment = () => {
  /****** Dynamic input field code starts here */
  const [expInputFields, setExpInputFields] = useState([]);
  const [expAtBDArmy, setExpAtBDArmy] = useState([]);

  const handleAddField = (add) => {
    if (add === "addExp") {
      setExpInputFields([...expInputFields, {}]);
    } else if (add === "addExpAtBDArmy") {
      setExpAtBDArmy([...expAtBDArmy, {}]);
    }
  };

  const handleRemoveField = (remove, index) => {
    const values = [...expInputFields];
    values.splice(index, 1);

    if (remove === "removeExp") {
      setExpInputFields(values);
    } else if (remove === "removeExpatBDArmy") {
      const removingVlaue = [...expAtBDArmy];
      removingVlaue.splice(index, 1);
      setExpAtBDArmy(removingVlaue);
    }
  };
  /******** Dynamic Inpt field code ends here */

  const [isCollapsedArmyDiv, setIsCollapsedArmyDiv] = useState(false);

  const ranksArray = [
    "2Lt",
    "Lt",
    "Capt",
    "Maj",
    "Lt Col",
    "Col",
    "Brig Gen",
    "Maj Gen",
    "Lt Gen",
    "Gen",
    "Snk",
    "L/cpl",
    "Cpl",
    "Sgt",
    "WO",
    "SWO",
    "MWO",
    "H/Lt",
    "H/Capt",
  ];

  const baArray = ["BA", "BSS", "JSS", "BSP", "BJO", "No"];

  const typesArray = ["Officer", "JCO", "NCO"];

  const armsArray = [
    "AC",
    "Arty",
    "EB",
    "BIR",
    "Sigs",
    "Engr",
    "EME",
    "Ord",
    "ASC",
    "AMC",
    "AEC",
    "CMP",
    "ADC",
    "AFNS",
    "RVFC",
    "ACC",
  ];

  const {
    register,
    handleSubmit,
    formState: { isValid },
  } = useForm();
  const onSubmit = (data) => {
    const ba_no = data.ba + ("-" + data.ba_num);
    delete data.ba;
    delete data.ba_num;
    const allData = { ...data, ba_no };
    console.log(allData);

    const config = {
        headers: {
          Authorization: `Bearer ${localStorage.token}`
        },
      };
  
  
      axios
        .post(
            "http://127.0.0.1:8000/api/jobs/army/", 
            allData, 
            config)
        .then((response) => {
          console.log("data after submit  response",response);
  
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
          onClick={() => setIsCollapsedArmyDiv(!isCollapsedArmyDiv)}
        >
          {isCollapsedArmyDiv ? (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-up"]} />
          ) : (
            <FontAwesomeIcon className="me-2" icon={["fas", "chevron-down"]} />
          )}{" "}
          Employment History (For Retired Army Person)
        </button>

        {isCollapsedArmyDiv && (
          <div className="mx-3">
            <div className="text-center p-5">
              <p>
                If you are a retired army person then you can give that
                information by clicking on the following button.
              </p>
            </div>
            <div>
              {expAtBDArmy.map((inputField, index) => (
                <div key={index}>
                  <div className="row gy-2 my-1 pt-2 pb-3 bg-white rounded">
                    <div className="mb-2">
                      <h3 className="form-field-group-title">
                        <FontAwesomeIcon
                          className="me-2"
                          icon={["fas", "info-circle"]}
                        />{" "}
                        Employment
                      </h3>
                    </div>
                    <div className="col-md-7 mb-2">
                      <small>
                        BA No<span className="text-danger">*</span>
                      </small>
                      <div className="row">
                        <div className="col-md-3 mb-2">
                          <select
                            className="dropdown-item border border-dark rounded"
                            {...register("ba", { required: true })}
                          >
                            {baArray.map((arr, index) => (
                              <option key={index} value={arr}>
                                {arr}
                              </option>
                            ))}
                          </select>
                        </div>
                        <div className="col-md-4 mb-2">
                          <input
                            type="text"
                            {...register("ba_num", { required: true })}
                          />
                        </div>
                      </div>
                    </div>
                    <div className="col-md-5 mb-2">
                      <small>
                        Ranks<span className="text-danger">*</span>
                      </small>
                      <select
                        className="dropdown-item border border-dark rounded"
                        {...register("ranks", { required: true })}
                      >
                        {ranksArray.map((arr, index) => (
                          <option key={index} value={arr}>
                            {arr}
                          </option>
                        ))}
                      </select>
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>
                        Types<span className="text-danger">*</span>
                      </small>
                      <select
                        className="dropdown-item border border-dark rounded"
                        {...register("types", { required: true })}
                      >
                        {typesArray.map((arr, index) => (
                          <option key={index} value={arr}>
                            {arr}
                          </option>
                        ))}
                      </select>
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>
                        Arms<span className="text-danger">*</span>
                      </small>
                      <select
                        className="dropdown-item border border-dark rounded"
                        {...register("arms", { required: true })}
                      >
                        {armsArray.map((arr, index) => (
                          <option key={index} value={arr}>
                            {arr}
                          </option>
                        ))}
                      </select>
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>Trade</small>
                      <input
                        className="form-control"
                        type="text"
                        {...register("trade")}
                      />
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>Course</small>
                      <input
                        className="form-control"
                        type="text"
                        {...register("course")}
                      />
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>
                        Date of Commission<span className="text-danger">*</span>
                      </small>
                      <input
                        className="form-control"
                        type="date"
                        {...register("date_of_commission")}
                      />
                    </div>
                    <div className="col-md-6 mb-2">
                      <small>
                        Date of Retirement<span className="text-danger">*</span>
                      </small>
                      <input
                        className="form-control"
                        type="date"
                        {...register("date_of_retirement")}
                      />
                    </div>
                  </div>
                  <div className="col text-start">
                    <button
                      type="button"
                      className="btn my-2 educationBtn"
                      onClick={() => handleRemoveField("removeExpatBDArmy")}
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
                  onClick={() => handleAddField("addExpAtBDArmy")}
                >
                  <FontAwesomeIcon className="me-2" icon={["fas", "plus"]} />
                  Add Experience at Bangladesh Army
                </button>
              </div>
            </div>
          </div>
        )}
      </div>

      {isCollapsedArmyDiv && (
        <input
          disabled={!isValid}
          className="btn btn-primary mt-3 mx-3"
          type="submit"
        />
      )}
    </form>
  );
};

export default JobArmyEmployment;
