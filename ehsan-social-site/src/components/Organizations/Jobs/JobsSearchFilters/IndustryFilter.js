import React from "react";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import "../../Organizations.css";

const IndustryFilter = ({
  changeHandler,
  searchFilterHandler,
  filterValueHandler,
  industry,
}) => {
  return (
    <>
      <div className="filter-overlay-container">
        <div className="row mb-2">
          <div className="col-12">
            <div className="row">
              {/*  industry type */}
              <div className="col">
                <label
                  htmlFor="industry_type "
                  className="form-label text-capitalize"
                >
                  industry type
                </label>
                <select
                  id="industry_type"
                  className="form-control"
                  name="industry_type"
                  onChange={changeHandler}
                  onBlur={filterValueHandler}
                >
                  <option value="">--select--</option>
                  {industry.industry_type &&
                    industry.industry_type.map((type, index) => (
                      <option key={index} value={type.id}>
                        {type.name}
                      </option>
                    ))}
                </select>
              </div>

              {/* industry_category */}
              <div className="col">
                <label
                  htmlFor="industry_category "
                  className="form-label text-capitalize"
                >
                  industry category
                </label>
                <select
                  id="industry_category"
                  className="form-control"
                  name="industry_category"
                  onChange={changeHandler}
                  onBlur={filterValueHandler}
                >
                  <option value="">--select--</option>
                  {industry.industry_cat &&
                    industry.industry_cat.map((industry_cat, index) => (
                      <option key={index} value={industry_cat.id}>
                        {industry_cat.name}
                      </option>
                    ))}
                </select>
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

export default IndustryFilter;
