import React from "react";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import "../../Organizations.css";

const CategoryFilter = ({
  changeHandler,
  searchFilterHandler,
  filterValueHandler,
  category,
}) => {
  return (
    <>
      <div className="filter-overlay-container">
        <div className="row mb-2">
          <div className="col-12">
            <div className="row">
              {/* functional category  */}
              <div className="col">
                <label
                  htmlFor="functional_category "
                  className="form-label text-capitalize"
                >
                  functional category
                </label>
                <select
                  id="functional_category"
                  className="form-control"
                  name="functional_category"
                  onChange={changeHandler}
                  onBlur={filterValueHandler}
                >
                  <option value="">--select--</option>
                  {category.functional_cat &&
                    category.functional_cat.map((functional_cat, index) => (
                      <option key={index} value={functional_cat.id}>
                        {functional_cat.name}
                      </option>
                    ))}
                </select>
              </div>

              {/* special skills category  */}
              <div className="col">
                <label
                  htmlFor="special_skills_category "
                  className="form-label text-capitalize"
                >
                  special skills category
                </label>
                <select
                  id="special_skills_category"
                  className="form-control"
                  name="special_skills_category"
                  onChange={changeHandler}
                  onBlur={filterValueHandler}
                >
                  <option value="">--select--</option>
                  {category.special_skills_category &&
                    category.special_skills_category.map(
                      (special_skills_category, index) => (
                        <option
                          key={index}
                          value={special_skills_category.id}
                          data-customvalue={special_skills_category.name}
                        >
                          {special_skills_category.name}
                        </option>
                      )
                    )}
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

export default CategoryFilter;
