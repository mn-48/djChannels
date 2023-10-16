import React, { useState, useEffect } from "react";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import ReactSelect from "react-select";
import axios from "axios";

import "../Organizations.css";

const AcademicFilter = ({
  changeHandler,
  searchFilterHandler,
  institutionshandler,
}) => {
  const [option, setOption] = useState([]);
  const [resultOption, setResultOption] = useState("");
  const [education, setEducation] = useState({});
  const [degreeFilter, setDegreeFilter] = useState(null);
  const [eduMajor, setEduMajor] = useState(null);

  // get institutions data
  useEffect(() => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    async function fetchData() {
      try {
        // get employer/orgaization information
        let option = axios.get(
          `http://127.0.0.1:8000/api/employer/instituitionlist/`,
          config
        );

        let education = axios.get(
          "http://127.0.0.1:8000/api/employer/three_cat/",
          config
        );

        axios
          .all([option, education])
          .then(
            axios.spread((...res) => {
              setOption(res[0].data);
              setEducation(res[1].data);
            })
          )
          .catch((err) => {
            console.log(
              "error featching data in component AcademicFilter :",
              err
            );
          });
      } catch (err) {
        console.log("error featching data in component AcademicFilter :", err);
      }
    }

    fetchData()
  }, []);

  // education level's degree handler
  const eduDegreeHandler = (degrees) => {
    setDegreeFilter(
      degrees.map((title, index) => (
        <option
          key={index}
          value={title.name}
          onClick={() => eduMajorHandler(title.major_in ? title.major_in : [])}
        >
          {title.name}
        </option>
      ))
    );
  };

  // education degree's major handler
  const eduMajorHandler = (major) => {
    setEduMajor(
      major.map((major_name, m_indx) => (
        <option key={m_indx} value={major_name.name}>
          {major_name.name}
        </option>
      ))
    );
  };

  return (
    <>
      <div className="filter-overlay-container">
        <form>
          <div className="row mb-2">
            {/* Degree level */}
            <div className="col-4">
              <label htmlFor="Applicant_Name" className="form-label">
                Degree level
              </label>

              <select
                className="form-control"
                name="degree_level"
                onChange={changeHandler}
              >
                <option value="">--- Select ---</option>
                {education.education_levels &&
                  education.education_levels.map((item, index) => (
                    <option
                      key={index}
                      onClick={() =>
                        eduDegreeHandler(item.degrees ? item.degrees : [])
                      }
                      value={item.name}
                    >
                      {item.name}
                    </option>
                  ))}
              </select>
            </div>

            {/* Degree name  */}
            <div className="col-4">
              <label htmlFor="Course/Degree" className="form-label">
                Degree name
              </label>

              <select
                className="form-control"
                name="degree_name"
                onChange={changeHandler}
              >
                <option value="">--- Select ---</option>
                {degreeFilter}
              </select>
            </div>

            {/*  Major subject */}
            <div className="col-4">
              <label htmlFor="Location" className="form-label">
                Major subject
              </label>

              <select
                className="form-control"
                name="major_in"
                onChange={changeHandler}
              >
                <option value="">--- Select ---</option>
                {eduMajor}
              </select>
            </div>
          </div>

          <div className="row mb-2">
            {/*  Result */}
            <div>
              <label htmlFor="Result" className="form-label">
                Result
              </label>
            </div>

            {/* result type  */}
            <div className="col-4">
              <label htmlFor="Result" className="form-label">
                Type
              </label>

              <select
                className="form-control"
                name="resultGrade"
                onChange={changeHandler}
              >
                <option value="" onClick={() => setResultOption("")}>
                  -- select --
                </option>
                <option
                  value="Division"
                  onClick={() => setResultOption("Division")}
                >
                  Division
                </option>
                <option value="Grade" onClick={() => setResultOption("Grade")}>
                  Grade
                </option>
              </select>
            </div>

            {/* Division  */}
            {resultOption === "Division" && (
              <div className="col-8">
                <label className="form-label">Division</label>
                <select
                  className="form-control"
                  name="resultDivision"
                  onChange={changeHandler}
                >
                  <option value="">-- select --</option>
                  <option value="First Class">First Class</option>
                  <option value="Second Class">Second Class</option>
                  <option value="Third Class">Third Class</option>
                </select>
              </div>
            )}

            {/* Grade  */}
            {resultOption === "Grade" && (
              <div className="col-8">
                <div>
                  <label htmlFor="Grade" className="form-label">
                    Grade
                  </label>
                </div>

                {/* min  */}
                <div className="d-flex">
                  <div className="col-5 me-3">
                    <input
                      type="number"
                      className="form-control"
                      name="gpa_min"
                      id="gpa_min"
                      placeholder="Min"
                      onChange={changeHandler}
                    />
                  </div>

                  {/* max  */}
                  <div className="col-5">
                    <input
                      type="number"
                      className="form-control"
                      name="gpa_max"
                      id="gpa_max"
                      placeholder="Max"
                      onChange={changeHandler}
                    />
                  </div>
                </div>
              </div>
            )}
          </div>

          <div className="row mb-2">
            {/*  Institutions */}
            <div className="col-12">
              <label className="form-label">Institutions</label>

              <ReactSelect
                className="text-primary"
                isMulti
                name="institutions"
                options={option.map((item) => ({
                  value: item.id,
                  label: item.name,
                }))}
                onChange={institutionshandler}
              />
            </div>
          </div>

          <div className="text-end">
            <button className="search-btn" onClick={searchFilterHandler}>
              <FontAwesomeIcon className="me-2" icon={["fas", "eye"]} />
              Search
            </button>
          </div>
        </form>
      </div>
    </>
  );
};

export default AcademicFilter;
