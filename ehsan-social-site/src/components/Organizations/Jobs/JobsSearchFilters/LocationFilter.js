import React from "react";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import "../../Organizations.css";

const LocationFilter = ({
  changeHandler,
  searchFilterHandler,
  filterValueHandler,
  location,
}) => {
  return (
    <>
      <div className="filter-overlay-container">
        <div className="row mb-2">
          <div className="col-12">
            <div className="row">
              {/*  location */}
              <div className="col">
                <label
                  htmlFor="location "
                  className="form-label text-capitalize"
                >
                  location
                </label>
                <select
                  id="location"
                  className="form-control"
                  name="location"
                  onChange={changeHandler}
                  onBlur={filterValueHandler}
                >
                  <option value="">--select city--</option>
                  {location.continents &&
                    location.continents.map(
                      (item, index) =>
                        item.country &&
                        item.country.map(
                          (country, cindex) =>
                            country.state &&
                            country.state.map(
                              (state, sIndex) =>
                                state.city &&
                                state.city.map((city, ctyIndex) => (
                                  <option key={ctyIndex} value={city.id}>
                                    {city.name}
                                  </option>
                                ))
                            )
                        )
                    )}
                </select>
              </div>

              {/* workplace */}
              <div className="col">
                <label
                  htmlFor="workplace "
                  className="form-label text-capitalize"
                >
                  workplace
                </label>
                <select
                  id="workplace"
                  className="form-control"
                  name="workplace"
                  onChange={changeHandler}
                  onBlur={filterValueHandler}
                >
                  <option value="">--workplace--</option>
                  <option value="Office">Office</option>
                  <option value="Remote">Remote</option>
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

export default LocationFilter;
