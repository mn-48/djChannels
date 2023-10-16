import React from "react";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import "../Organizations.css";

const ExperienceFilter = ({ changeHandler, searchFilterHandler }) => {
  return (
    <>
      <div className="filter-overlay-container">
        <form>
          <div className="row mb-2">
            {/* Experience  */}

            <div className="col-12">
              <div className="row">
                <div>
                  <label htmlFor="salary_range " className="form-label">
                    Experience
                  </label>
                </div>

                <div className="col">
                  <input
                    type="number"
                    className="form-control"
                    name="experience_min"
                    onChange={changeHandler}
                    placeholder="Min"
                  />
                </div>

                <div className="col">
                  <input
                    type="number"
                    className="form-control"
                    name="experience_max"
                    onChange={changeHandler}
                    placeholder="Max"
                  />
                </div>
              </div>
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

export default ExperienceFilter;
