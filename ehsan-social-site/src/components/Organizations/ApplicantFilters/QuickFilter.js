import React from "react";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import "../Organizations.css";

const QuickFilter = ({ changeHandler, searchFilterHandler }) => {
  return (
    <>
      <div className="filter-overlay-container">
        <form>
          <div className="row mb-2">
            {/* Applicant Name  */}
            <div className="col-6">
              <label htmlFor="name" className="form-label">
                Applicant Name
              </label>
              <input
                type="text"
                className="form-control"
                id="name"
                name="name"
                onChange={changeHandler}
                placeholder=" Applicant Name"
              />
            </div>

            {/* Age range  */}
            <div className="col-6 row">
              <div className="">
                <label className="form-label">Age range</label>
              </div>
              <div className="col">
                <input
                  type="number"
                  className="form-control"
                  name="age_min"
                  id="age_min"
                  onChange={changeHandler}
                  placeholder="Min"
                />
              </div>

              <div className="col">
                <input
                  type="number"
                  className="form-control"
                  name="age_max"
                  id="age_max"
                  onChange={changeHandler}
                  placeholder="Max"
                />
              </div>
            </div>
          </div>

          <div className="row mb-2">
            {/* Location  */}
            <div className="col-6">
              <label htmlFor="location" className="form-label">
                Location
              </label>
              <input
                type="text"
                className="form-control"
                id="location"
                name="location"
                onChange={changeHandler}
                placeholder="Write Job Location"
              />
            </div>

            {/* gender  */}
            <div className="col-6">
              <div>
                <label className="form-label">Gender</label>
              </div>

              <div className="form-check form-check-inline">
                <input
                  className="form-check-input"
                  type="checkbox"
                  id="male"
                  name="gender"
                  onChange={changeHandler}
                  value="Male"
                />
                <label className="form-check-label" htmlFor="male">
                  Male
                </label>
              </div>

              <div className="form-check form-check-inline">
                <input
                  className="form-check-input"
                  type="checkbox"
                  id="female"
                  name="gender"
                  onChange={changeHandler}
                  value="Female"
                />
                <label className="form-check-label" htmlFor="female">
                  Female
                </label>
              </div>

              <div className="form-check form-check-inline">
                <input
                  className="form-check-input"
                  type="checkbox"
                  id="others"
                  name="gender"
                  onChange={changeHandler}
                  value="Others"
                />
                <label className="form-check-label" htmlFor="others">
                  Others
                </label>
              </div>
            </div>
          </div>

          <div className="row mb-2">
            {/* address  */}
            <div className="col-6">
              {/* Present address   */}
              <div className="form-check form-check-inline">
                <input
                  className="form-check-input"
                  type="checkbox"
                  id="Present_address"
                  onChange={changeHandler}
                  name="location_present"
                />
                <label className="form-check-label" htmlFor="Present_address ">
                  Present address
                </label>
              </div>

              {/* Permanent address   */}
              <div className="form-check form-check-inline">
                <input
                  className="form-check-input"
                  type="checkbox"
                  id="Permanent_address"
                  onChange={changeHandler}
                  name="location_permanent"
                />
                <label
                  className="form-check-label"
                  htmlFor="Permanent_address "
                >
                  Permanent address
                </label>
              </div>
            </div>

            {/* Job Level   */}
            <div className="col-6">
              <div>
                <label className="form-label">Job Level</label>
              </div>

              {/* Entry level   */}
              <div className="form-check form-check-inline">
                <input
                  className="form-check-input"
                  type="checkbox"
                  id="Entry_level "
                  name="job_level"
                  onChange={changeHandler}
                  value="Entry Level"
                />
                <label className="form-check-label" htmlFor="Entry_level ">
                  Entry level
                </label>
              </div>

              {/* Mid level   */}
              <div className="form-check form-check-inline">
                <input
                  className="form-check-input"
                  type="checkbox"
                  id="Mid_level"
                  name="job_level"
                  onChange={changeHandler}
                  value="Mid Level"
                />
                <label className="form-check-label" htmlFor="Mid_level">
                  Mid level
                </label>
              </div>

              {/* Top level   */}
              <div className="form-check form-check-inline">
                <input
                  className="form-check-input"
                  type="checkbox"
                  id="Top_level"
                  name="job_level"
                  onChange={changeHandler}
                  value="Top Level"
                />
                <label className="form-check-label" htmlFor="Top_level">
                  Top level
                </label>
              </div>
            </div>
          </div>

          <div className="row mb-2">
            {/* salary range  */}
            <div className="col-6">
              <div className="row">
                <div>
                  <label htmlFor="salary_range " className="form-label">
                    Salary range
                  </label>
                </div>

                <div className="col">
                  <input
                    type="number"
                    className="form-control"
                    id="salary_min"
                    name="salary_min"
                    onChange={changeHandler}
                    placeholder="Min"
                  />
                </div>

                <div className="col">
                  <input
                    type="number"
                    className="form-control"
                    id="salary_max"
                    name="salary_max"
                    onChange={changeHandler}
                    placeholder="Max"
                  />
                </div>
              </div>
            </div>

            {/* Others  */}
            <div className="col-6">
              <div>
                <label className="form-label">Others</label>
              </div>

              {/* Person with Disability  */}
              <div className="form-check">
                <input
                  className="form-check-input"
                  type="checkbox"
                  id="Person_with_Disability "
                  onChange={changeHandler}
                  name="person_with_disability"
                />
                <label
                  className="form-check-label"
                  htmlFor="Person_with_Disability "
                >
                  Person with Disability
                </label>
              </div>
            </div>
          </div>

          <div className="text-end">
            <button
              className="search-btn"
              onClick={searchFilterHandler}
            >
              <FontAwesomeIcon className="me-2" icon={["fas", "eye"]} />
              Search
            </button>
          </div>
        </form>
      </div>
    </>
  );
};

export default QuickFilter;
