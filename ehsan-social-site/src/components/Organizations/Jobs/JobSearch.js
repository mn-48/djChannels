import React, { useState, useEffect } from "react";

import axios from "axios";
import Modal from "react-bootstrap/Modal";
import moment from "moment";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css";

// components
import Navigation from "../../shared/Navigation/Navigation";
import JobSearchDetails from "./JobSearchDetails";
import KeywoardFilter from "./JobsSearchFilters/KeywoardsFilter";
import CategoryFilter from "./JobsSearchFilters/CategoryFilter";
import IndustryFilter from "./JobsSearchFilters/IndustryFilter";
import DeadlineFilter from "./JobsSearchFilters/DeadlineFilter";
import LocationFilter from "./JobsSearchFilters/LocationFilter";
import OthersFilter from "./JobsSearchFilters/OthersFilter";

// css
import "../Organizations.css";

const JobSearch = () => {
  const [featured, setFeatured] = useState([]);
  const [allJobs, setAllJobs] = useState([]);
  const [threeCat, setThreeCat] = useState({});
  const [activeFilterItem, setActiveFilterItem] = useState([]);

  // modal state
  const [show, setShow] = useState(false);
  const [jobSearch, setJobSearch] = useState({});

  // job search filter input state
  const [jobsSearchFilterState, setJobsSearchFilterState] = useState({
    keywords: "",
    industry_type: null,
    industry_category: null,
    functional_category: null,
    special_skills_category: null,
    location: null,
    workplace: "",
    posted: null,
    deadline: null,
    experience_min: null,
    experience_max: null,
    min_age: null,
    max_age: null,
    job_level: [],
    job_nature: [],
    gender: [],
    person_with_disability: false,
  });

  // get featured data
  useEffect(() => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    async function fetchData() {
      try {
        const featuredJob = axios.get(
          `http://127.0.0.1:8000/api/employer/featured/`,
          config
        );

        const allJob = axios.get(
          `http://127.0.0.1:8000/api/employer/allpost/`,
          config
        );

        const threeCategory = axios.get(
          `http://127.0.0.1:8000/api/employer/three_cat/`,
          config
        );

        axios.all([featuredJob, allJob, threeCategory]).then(
          axios.spread((...res) => {
            setFeatured(res[0].data);
            setAllJobs(res[1].data);
            setThreeCat(res[2].data);
          })
        );
      } catch (err) {
        console.log("Featured Job Post not found : ", err);
      }
    }

    fetchData();
  }, []);

  // multi filter form state change handler
  const inputChangeHandler = (e) => {
    switch (e.target.name) {
      // keywords
      case "keywords":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          keywords: e.target.value,
        });
        break;

      // industry_type
      case "industry_type":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          industry_type: e.target.value,
        });
        break;

      // industry_category
      case "industry_category":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          industry_category: e.target.value,
        });
        break;

      // functional_category
      case "functional_category":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          functional_category: e.target.value,
        });
        break;

      // special_skills_category
      case "special_skills_category":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          special_skills_category: e.target.value,
        });
        break;

      // location
      case "location":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          location: e.target.value,
        });

        break;

      // workplace
      case "workplace":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          workplace: e.target.value,
        });
        break;

      // posted
      case "posted":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          posted: e.target.value,
        });
        break;

      // deadline
      case "deadline":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          deadline: e.target.value,
        });
        break;

      // min_experience
      case "min_experience":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          min_experience: e.target.value,
        });
        break;

      // max_experience
      case "max_experience":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          max_experience: e.target.value,
        });
        break;

      // min age
      case "age_min":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          age_min: e.target.value,
        });
        break;

      // max age
      case "age_max":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          age_max: e.target.value,
        });
        break;

      // job level
      case "job_level":
        let newJobLevel = [...jobsSearchFilterState.job_level, e.target.value];

        if (jobsSearchFilterState.job_level.includes(e.target.value)) {
          newJobLevel = jobsSearchFilterState.job_level.filter(
            (g) => g !== e.target.value
          );
        }
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          job_level: newJobLevel,
        });
        break;

      // job nature
      case "job_nature":
        let newJobNature = [
          ...jobsSearchFilterState.job_nature,
          e.target.value,
        ];

        if (jobsSearchFilterState.job_nature.includes(e.target.value)) {
          newJobNature = jobsSearchFilterState.job_nature.filter(
            (g) => g !== e.target.value
          );
        }
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          job_nature: newJobNature,
        });
        break;

      // gender
      case "gender":
        let newGender = [...jobsSearchFilterState.gender, e.target.value];

        if (jobsSearchFilterState.gender.includes(e.target.value)) {
          newGender = jobsSearchFilterState.gender.filter(
            (g) => g !== e.target.value
          );
        }
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          gender: newGender,
        });
        break;

      // person_with_disability
      case "person_with_disability":
        setJobsSearchFilterState({
          ...jobsSearchFilterState,
          person_with_disability: e.target.checked ? true : false,
        });
        break;

      default:
        setJobsSearchFilterState({});
    }
  };

  // show modal handler
  const handleShow = (item) => {
    setShow(true);
    setJobSearch(item);
  };

  // close modal handler
  const handleClose = () => setShow(false);

  // show filter values handler
  const showFilterValueHandler = (e) => {
    let skcObj = document.getElementById("special_skills_category");
    let fcObj = document.getElementById("functional_category");
    let idtObj = document.getElementById("industry_type");
    let icObj = document.getElementById("industry_category");
    let locatObj = document.getElementById("location");

    let skc = skcObj && skcObj.options[skcObj.selectedIndex].text;
    let fc = fcObj && fcObj.options[fcObj.selectedIndex].text;
    let idt = idtObj && idtObj.options[idtObj.selectedIndex].text;
    let ic = icObj && icObj.options[icObj.selectedIndex].text;
    let locat = locatObj && locatObj.options[locatObj.selectedIndex].text;

    if (e.target.value === "" || e.target.value === null) {
      setActiveFilterItem([...activeFilterItem]);
    } else if (e.target.name === "special_skills_category") {
      setActiveFilterItem([...activeFilterItem, skc]);
    } else if (e.target.name === "functional_category") {
      setActiveFilterItem([...activeFilterItem, fc]);
    } else if (e.target.name === "industry_type") {
      setActiveFilterItem([...activeFilterItem, idt]);
    } else if (e.target.name === "industry_category") {
      setActiveFilterItem([...activeFilterItem, ic]);
    } else if (e.target.name === "location") {
      setActiveFilterItem([...activeFilterItem, locat]);
    } else {
      setActiveFilterItem([...activeFilterItem, e.target.value]);
    }
  };

  // multi search filter handler submit form
  const searchFilterHandler = async (e) => {
    e.preventDefault();

    // hide tippy content after click on search button
    let tippyContent = document.getElementById("searchContent");
    tippyContent.lastChild.style.visibility = "hidden";

    // remove empty value from form data
    Object.keys(jobsSearchFilterState).forEach((key) =>
      jobsSearchFilterState[key] === "" || jobsSearchFilterState[key] === null
        ? delete jobsSearchFilterState[key]
        : jobsSearchFilterState
    );

    console.log("jobsSearchFilterState :", jobsSearchFilterState);

    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      const res = await axios.post(
        `http://127.0.0.1:8000/api/employer/filter_jobs/`,
        jobsSearchFilterState,
        config
      );

      setAllJobs(res.data);
    } catch (err) {
      console.log("All Jobs filter : ", err);
    }
  };

  // clear single filter value by click on cross icon
  const clearFilterItemHandler = (id) => {
    activeFilterItem.splice(id, 1);
    setActiveFilterItem([...activeFilterItem]);
  };

  // clear all filters value and input fields, handler
  const clearAllFilterHandler = () => {
    setJobsSearchFilterState({
      ...jobsSearchFilterState,
      keywords: "",
      functional_category: null,
      special_skills_category: null,
      location: null,
      workplace: "",
      posted: null,
      deadline: null,
      experience_min: null,
      experience_max: null,
      min_age: null,
      max_age: null,
      job_level: [],
      job_nature: [],
      gender: [],
      person_with_disability: false,
    });

    setActiveFilterItem([]);

    // reset form
    document.getElementById("searchContent").reset();
  };

  return (
    <>
      {/* header  */}
      <Navigation />
      {/* main content  */}
      <div className="container job_search ">
        {/* top section  */}
        <div className="job_search__job_pagination d-md-flex">
          {/* total job count  */}
          <div className="job_count rounded-pill">
            <h4>420</h4>
          </div>
          {/* matching text  */}
          <div className="d-flex align-items-center ms-3 text-capitalize">
            <h6>jobs matching your search criteria</h6>
          </div>

          {/* pagination  */}
          <div className="ms-auto">
            <nav aria-label="Page navigation example">
              <ul className="pagination">
                <li className="page-item">
                  <a className="page-link" href="#h">
                    Previous
                  </a>
                </li>
                <li className="page-item">
                  <a className="page-link" href="#q">
                    1
                  </a>
                </li>
                <li className="page-item">
                  <a className="page-link" href="#l">
                    2
                  </a>
                </li>
                <li className="page-item">
                  <a className="page-link" href="#k">
                    3
                  </a>
                </li>
                <li className="page-item">
                  <a className="page-link" href="#n">
                    Next
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>

        {/* job active filters  */}
        <div className="job_search__job_active_filters d-md-flex mx-0">
          <div className="job_search__job_active_filters__title">
            <h6>Active Filters</h6>
            <div className="active_filters_title__arrow"></div>
          </div>

          <div className="job_search__job_active_filters__items">
            {activeFilterItem.length > 0 ? (
              activeFilterItem.map((item, index) => (
                <span
                  key={index}
                  className="bg-secondary mx-1 my-1 rounded-pill py-1 px-2 text-white"
                >
                  {item}
                  <FontAwesomeIcon
                    className="ms-1 clear_filter_cross"
                    icon={["fas", "times-circle"]}
                    onClick={() => clearFilterItemHandler(index)}
                  />
                </span>
              ))
            ) : (
              <span>Filter's values</span>
            )}
          </div>
        </div>

        {/* job_items  */}
        <div className="row job_search__job_items">
          {/* filter item container  */}
          <div className="jpdd-filter-item-container col-sm-2">
            <div>
              <form id="searchContent">
                {/* keywoards  */}
                <Tippy
                  trigger={"click"}
                  theme={"light"}
                  animation={"shift-toward"}
                  placement={"right"}
                  interactive={true}
                  className="jpdd-tippy-container"
                  content={
                    <KeywoardFilter
                      changeHandler={inputChangeHandler}
                      searchFilterHandler={searchFilterHandler}
                      filterValueHandler={showFilterValueHandler}
                      // keywordsRef={inputRefs}
                    />
                  }
                >
                  <div className="jpdd-filter-item jpdd-filter-item-first-child">
                    <FontAwesomeIcon
                      className="fs-3 mb-3"
                      icon={["fas", "tags"]}
                    />
                    <p className="font-small">Keywoards</p>
                  </div>
                </Tippy>

                {/* category  */}
                <Tippy
                  trigger={"click"}
                  theme={"light"}
                  animation={"shift-toward"}
                  placement={"right"}
                  interactive={true}
                  className="jpdd-tippy-container"
                  content={
                    <CategoryFilter
                      changeHandler={inputChangeHandler}
                      searchFilterHandler={searchFilterHandler}
                      filterValueHandler={showFilterValueHandler}
                      category={threeCat && threeCat}
                    />
                  }
                >
                  <div
                    className="jpdd-filter-item"

                    //   onClick={() => activeFilterHandler(2)}
                  >
                    <FontAwesomeIcon
                      className="fs-3 mb-3"
                      icon={["fas", "th-list"]}
                    />
                    <p className="font-small">Category</p>
                  </div>
                </Tippy>

                {/* industry  */}
                <Tippy
                  trigger={"click"}
                  theme={"light"}
                  animation={"shift-toward"}
                  placement={"right"}
                  interactive={true}
                  className="jpdd-tippy-container"
                  content={
                    <IndustryFilter
                      changeHandler={inputChangeHandler}
                      searchFilterHandler={searchFilterHandler}
                      filterValueHandler={showFilterValueHandler}
                      industry={threeCat && threeCat}
                    />
                  }
                >
                  <div
                    className="jpdd-filter-item"

                    //   onClick={() => activeFilterHandler(3)}
                  >
                    <FontAwesomeIcon
                      className="fs-3 mb-3"
                      icon={["fas", "building"]}
                    />
                    <p className="font-small">Industry</p>
                  </div>
                </Tippy>

                {/* location  */}
                <Tippy
                  trigger={"click"}
                  theme={"light"}
                  animation={"shift-toward"}
                  placement={"right"}
                  interactive={true}
                  className="jpdd-tippy-container"
                  content={
                    <LocationFilter
                      changeHandler={inputChangeHandler}
                      searchFilterHandler={searchFilterHandler}
                      filterValueHandler={showFilterValueHandler}
                      location={threeCat && threeCat}
                    />
                  }
                >
                  <div
                    className="jpdd-filter-item"

                    //   onClick={() => activeFilterHandler(3)}
                  >
                    <FontAwesomeIcon
                      className="fs-3 mb-3"
                      icon={["fas", "map-marker-alt"]}
                    />
                    <p className="font-small">location</p>
                  </div>
                </Tippy>

                {/* Posted/Deadline  */}
                <Tippy
                  trigger={"click"}
                  theme={"light"}
                  animation={"shift-toward"}
                  placement={"right"}
                  interactive={true}
                  className="jpdd-tippy-container"
                  content={
                    <DeadlineFilter
                      changeHandler={inputChangeHandler}
                      searchFilterHandler={searchFilterHandler}
                      filterValueHandler={showFilterValueHandler}
                    />
                  }
                >
                  <div
                    className="jpdd-filter-item"

                    //   onClick={() => activeFilterHandler(3)}
                  >
                    <FontAwesomeIcon
                      className="fs-3 mb-3"
                      icon={["fas", "calendar-alt"]}
                    />
                    <p className="font-small">Posted/Deadline</p>
                  </div>
                </Tippy>

                {/* Others Filters */}
                <Tippy
                  trigger={"click"}
                  theme={"light"}
                  animation={"shift-toward"}
                  placement={"right"}
                  interactive={true}
                  className="jpdd-tippy-container"
                  content={
                    <OthersFilter
                      changeHandler={inputChangeHandler}
                      searchFilterHandler={searchFilterHandler}
                      filterValueHandler={showFilterValueHandler}
                      // OthersRef={inputRefs}
                    />
                  }
                >
                  <div
                    className="jpdd-filter-item"

                    //   onClick={() => activeFilterHandler(4)}
                  >
                    <FontAwesomeIcon
                      className="fs-3 mb-3"
                      icon={["fas", "filter"]}
                    />
                    <p className="font-small">Others Filters</p>
                  </div>
                </Tippy>

                {/* clear all  */}
                <div
                  className="jpdd-filter-item jpdd-filter-item-last-child"
                  onClick={clearAllFilterHandler}
                >
                  <p className="font-small  d-flex align-items-center">
                    Clear All{" "}
                    <FontAwesomeIcon
                      className="fs-3 ms-1"
                      icon={["fas", "times-circle"]}
                    />
                  </p>
                </div>
              </form>
            </div>
          </div>

          {/* jobs items container  */}
          <div className="jobs_items_container col-sm-10 px-0">
            {/* title  */}
            <div className="d-flex align-items-center">
              <div>
                <h6>Click at the job title to view details </h6>
              </div>
              <div className="ms-auto">
                <span>Jobs per pages : </span>
                <select>
                  <option>10</option>
                  <option>20</option>
                  <option>30</option>
                  <option>40</option>
                </select>
              </div>
            </div>

            {/* featured jobs  */}
            <div className="row">
              {featured.length > 0 ? (
                featured.map((item, index) => (
                  <div
                    className="col-md-6 features__job__item__container"
                    key={index}
                    onClick={() => handleShow(item)}
                  >
                    <div className="features__job__item">
                      <div>
                        <h5 className="text-danger text-capitalize">
                          {" "}
                          <FontAwesomeIcon
                            className="me-2 mt-2"
                            icon={["fas", "award"]}
                          />
                          Featured
                        </h5>
                        <h5 className="mt-2 text-primary text-capitalize">
                          <span className="job_title_action">
                            {item.job_title}
                          </span>
                        </h5>

                        <h6 className="mt-2 text-capitalize">
                          {item.employer.company_name === "" ||
                          item.employer.company_name === null
                            ? "company name not specified"
                            : item.employer.company_name}
                        </h6>

                        <p>
                          <FontAwesomeIcon
                            className="me-2 mt-2"
                            icon={["fas", "map-marker-alt"]}
                          />
                          <span>{item.job_location.name}</span>
                        </p>

                        <p>
                          <FontAwesomeIcon
                            className="me-2 mt-2"
                            icon={["fas", "graduation-cap"]}
                          />
                          <span>{item.job_context}</span>
                        </p>

                        <p>
                          <FontAwesomeIcon
                            className="me-2 mt-2"
                            icon={["fas", "id-card"]}
                          />
                          <span>At least {item.min_experience} years</span>
                        </p>
                        <p>
                          <FontAwesomeIcon
                            className="me-2 mt-2"
                            icon={["fas", "calendar-alt"]}
                          />
                          <span>
                            {moment(`${item.deadline}`).format("MMM Do YY")}
                          </span>
                        </p>
                      </div>
                      <div className="feature__job__logo">
                        <img src={item.employer.logo} alt="logo" />
                      </div>
                    </div>
                  </div>
                ))
              ) : (
                <div className="text-center">
                  <FontAwesomeIcon
                    className="me-2 mt-2 fa-spin fs-1"
                    icon={["fas", "spinner"]}
                  />
                </div>
              )}
            </div>

            {/* others jobs  */}
            <div className="others__job">
              {allJobs &&
                allJobs.map((allItem, index) => (
                  <div
                    key={index}
                    className="others__job__item"
                    onClick={() => handleShow(allItem)}
                  >
                    <h5 className="text-primary text-capitalize">
                      <span className="job_title_action">
                        {allItem.job_title}
                      </span>
                    </h5>
                    {allItem.employer.company_name === "" ||
                    allItem.employer.company_name === null ? (
                      "company name not specified"
                    ) : (
                      <h5 className="mt-2">{allItem.employer.company_name}</h5>
                    )}
                    <p>
                      <FontAwesomeIcon
                        className="me-2 mt-2"
                        icon={["fas", "map-marker-alt"]}
                      />
                      <span>{allItem.job_location.name}</span>
                    </p>
                    <p>
                      <FontAwesomeIcon
                        className="me-2 mt-2"
                        icon={["fas", "graduation-cap"]}
                      />
                      <span>{allItem.job_context}</span>
                    </p>
                    <div className="d-flex justify-content-between">
                      <p>
                        <FontAwesomeIcon
                          className="me-2 mt-2"
                          icon={["fas", "id-card"]}
                        />
                        <span>At least {allItem.min_experience} years</span>
                      </p>
                      <p>
                        <FontAwesomeIcon
                          className="me-2 mt-2"
                          icon={["fas", "calendar-alt"]}
                        />
                        {moment(`${allItem.deadline}`).format("MMM Do YY")}
                      </p>
                    </div>
                  </div>
                ))}
            </div>
          </div>
        </div>
      </div>

      {/* modal content  */}
      <Modal show={show} size="lg" onHide={handleClose} centered>
        <Modal.Header closeButton></Modal.Header>
        <Modal.Body>
          <JobSearchDetails jobSearch={jobSearch && jobSearch} />
        </Modal.Body>
      </Modal>
    </>
  );
};

export default JobSearch;
