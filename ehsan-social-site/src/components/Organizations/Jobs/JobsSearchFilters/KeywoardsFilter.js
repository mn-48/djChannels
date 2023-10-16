import React from "react";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import "../../Organizations.css";

const KeywordsFilter = ({
  changeHandler,
  searchFilterHandler,
  filterValueHandler,
}) => {
  return (
    <>
      <div className="filter-overlay-container">
        {/* Keyword search */}
        <div className="row mb-2">
          {/* Keyword search  */}
          <div className="col-12">
            <label htmlFor="Keyword_search " className="form-label">
              Keyword search
            </label>

            <div className="input-group">
              <input
                type="text"
                className="form-control"
                id="Keyword_search"
                name="keywords"
                onChange={changeHandler}
                onBlur={filterValueHandler}
                placeholder="Keyword search"
              />
              <span className="input-group-text" id="Keyword_search">
                <FontAwesomeIcon className="" icon={["fas", "search"]} />
              </span>
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

export default KeywordsFilter;
