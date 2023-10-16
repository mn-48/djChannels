import React from "react";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import "../../Organizations.css";

const DeadlineFilter = ({ changeHandler, searchFilterHandler, filterValueHandler}) => {
  return (
    <>
      <div className="filter-overlay-container">
        <div className="row mb-2">
          <div className="col-12">
            <div className="row">
              {/* posted */}
              <div className="col">
                <label htmlFor="posted " className="form-label text-capitalize">
                  posted
                </label>
                <input
                  type="number"
                  id="posted"
                  className="form-control"
                  name="posted"
                  onChange={changeHandler}
                  onBlur={filterValueHandler}
                  placeholder="Last 1/2/3 days posts"
                />
              </div>

              {/* deadline  */}
              <div className="col">
                <label
                  htmlFor="deadline "
                  className="form-label text-capitalize"
                >
                  deadline
                </label>
                <input
                  type="number"
                  id="deadline"
                  className="form-control"
                  name="deadline"
                  onChange={changeHandler}
                  onBlur={filterValueHandler}
                  placeholder="Expired between 1/2/3 days"
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
      </div>
    </>
  );
};

export default DeadlineFilter;
