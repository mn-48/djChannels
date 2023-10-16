import React from "react";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import "../../Organizations.css";

const OthersFilter = ({
  changeHandler,
  searchFilterHandler,
  filterValueHandler,
}) => {
  return (
    <>
      <div className="filter-overlay-container">
        <div className="row mb-2">
          {/* Experience  */}
          <div className="col-6">
            <div className="row">
              <div>
                <label className="form-label">Experience</label>
              </div>

              <div className="col">
                <input
                  type="number"
                  className="form-control dbc"
                  id="min_experience"
                  name="min_experience"
                  onChange={changeHandler}
                  onBlur={filterValueHandler}
                  placeholder="Min"
                />
              </div>

              <div className="col">
                <input
                  type="number"
                  className="form-control dbc"
                  id="max_experience"
                  name="max_experience"
                  onChange={changeHandler}
                  onBlur={filterValueHandler}
                  placeholder="Max"
                />
              </div>
            </div>
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
                onBlur={filterValueHandler}
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
                onBlur={filterValueHandler}
                placeholder="Max"
              />
            </div>
          </div>
        </div>

        <div className="row mb-2">
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
                onBlur={filterValueHandler}
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
                onBlur={filterValueHandler}
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
                onBlur={filterValueHandler}
                value="Top Level"
              />
              <label className="form-check-label" htmlFor="Top_level">
                Top level
              </label>
            </div>
          </div>

          {/* Job Nature */}
          <div className="col-6">
            <div>
              <label className="form-label">Job Nature</label>
            </div>

            {/* Part Time  */}
            <div className="form-check form-check-inline">
              <input
                className="form-check-input"
                type="checkbox"
                id="part_time "
                name="job_nature"
                onChange={changeHandler}
                onBlur={filterValueHandler}
                value="Part Time"
              />
              <label className="form-check-label" htmlFor="part_time ">
                Part Time
              </label>
            </div>

            {/* Top level   */}
            <div className="form-check form-check-inline">
              <input
                className="form-check-input"
                type="checkbox"
                id="full_time"
                name="job_nature"
                onChange={changeHandler}
                onBlur={filterValueHandler}
                value="Full Time"
              />
              <label className="form-check-label" htmlFor="full_time">
                Full Time
              </label>
            </div>
          </div>
        </div>

        <div className="row mb-2">
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
                onBlur={filterValueHandler}
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
                onBlur={filterValueHandler}
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
                onBlur={filterValueHandler}
                value="Others"
              />
              <label className="form-check-label" htmlFor="others">
                Others
              </label>
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
                onBlur={filterValueHandler}
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
          <button className="search-btn" onClick={searchFilterHandler}>
            <FontAwesomeIcon className="me-2" icon={["fas", "eye"]} />
            Search
          </button>
        </div>
      </div>
    </>
  );
};

export default OthersFilter;
