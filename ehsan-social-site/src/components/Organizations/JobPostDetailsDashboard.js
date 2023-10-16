import React, { useState, useEffect } from "react";

import Accordion from "react-bootstrap/Accordion";
import moment from "moment";
import Swal from "sweetalert2";
import axios from "axios";
import Tippy from "@tippyjs/react";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { ReactComponent as OrganizationImage } from "../../images/new/svg/3d-buildings.svg";

// components
import Navigation from "../shared/Navigation/Navigation";
import JobPostColorBox from "../../components/shared/Organization/JobPostColorBox";
import QuickFilter from "./ApplicantFilters/QuickFilter";
import AcademicFilter from "./ApplicantFilters/AcademicFilter";
import ExperienceFilter from "./ApplicantFilters/ExperienceFilter";
import KeywordsFilter from "./ApplicantFilters/KeywordsFilter";
import AllApplicants from "./ApplicantFilters/AllApplicant";
import Rejected from "./ApplicantFilters/Rejected";
import ViewedFilter from "./ApplicantFilters/ViewedFilter";
import ShortlistedFilter from "./ApplicantFilters/ShortlistedFilter";
import InterviewedFilter from "./ApplicantFilters/InterviewedFilter";
import SelectedFilter from "./ApplicantFilters/SelectedFilter";
import NotInterviewedFilter from "./ApplicantFilters/NotInterviewedFilter";

const JobPostDetailsDashboard = () => {
  const [accordionHeaderToggleIcon, setAccordionHeaderToggleIcon] =
    useState(true);
  const [jobPostDetailsDashboardData, setJobPostDetailsDashboardData] =
    useState({});
  const [filterLoading, setFilterLoading] = useState(false);
  const [applicationList, setApplicationList] = useState([]);
  // filter components render state
  const [filterComponents, setFilterComponents] = useState("all");
  // filter modal state
  const [multiFilterState, setMultiFilterState] = useState({
    name: "",
    location: "",
    age_min: null,
    age_max: null,
    gender: [],
    location_present: false,
    location_permanent: false,
    job_level: [],
    salary_min: null,
    salary_max: null,
    person_with_disability: false,
    keywords: "",
    experience_min: null,
    experience_max: null,
    degree_level: "",
    degree_name: "",
    major_in: "",
    result: "",
    gpa_min: null,
    gpa_max: null,
    institutions: [],
  });

  console.log("filterLoading", filterLoading);

  const [active, setActive] = useState({
    quick: false,
    academic: false,
    experience: false,
    keyword: false,
  });

  const activeFilterHandler = (id) => {
    if (id === 1) {
      setActive({
        quick: !active.quick,
        academic: false,
        experience: false,
        keyword: false,
      });
    } else if (id === 2) {
      setActive({
        quick: false,
        academic: !active.academic,
        experience: false,
        keyword: false,
      });
    } else if (id === 3) {
      setActive({
        quick: false,
        academic: false,
        experience: !active.experience,
        keyword: false,
      });
    } else {
      setActive({
        quick: false,
        academic: false,
        experience: false,
        keyword: !active.keyword,
      });
    }
  };

  // get data
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
        const res = await axios.get(
          `http://127.0.0.1:8000/api/employer/applicants/23/`,
          config
        );

        setJobPostDetailsDashboardData(res.data);
        setApplicationList(res.data.list);
      } catch (err) {
        console.log("Job Post Details Dashboard Data not found : ", err);
      }
    }

    fetchData();
  }, []);

  // multi filter form state change handler
  const multiFilterStateChangeHandler = (e) => {
    // console.log("comming", e.target.name);

    switch (e.target.name) {
      // name
      case "name":
        setMultiFilterState({
          ...multiFilterState,
          name: e.target.value,
        });
        break;

      // min age
      case "age_min":
        setMultiFilterState({
          ...multiFilterState,
          age_min: e.target.value,
        });
        break;

      // max age
      case "age_max":
        setMultiFilterState({
          ...multiFilterState,
          age_max: e.target.value,
        });

        break;

      // location
      case "location":
        setMultiFilterState({
          ...multiFilterState,
          location: e.target.value,
        });

        break;

      // gender
      case "gender":
        let newGender = [...multiFilterState.gender, e.target.value];

        if (multiFilterState.gender.includes(e.target.value)) {
          newGender = multiFilterState.gender.filter(
            (g) => g !== e.target.value
          );
        }
        setMultiFilterState({
          ...multiFilterState,
          gender: newGender,
        });
        break;

      // location_present
      case "location_present":
        setMultiFilterState({
          ...multiFilterState,
          location_present: e.target.checked ? true : false,
        });
        break;

      // location_permanent
      case "location_permanent":
        setMultiFilterState({
          ...multiFilterState,
          location_permanent: e.target.checked ? true : false,
        });
        break;

      // job level
      case "job_level":
        let newJobLevel = [...multiFilterState.job_level, e.target.value];

        if (multiFilterState.job_level.includes(e.target.value)) {
          newJobLevel = multiFilterState.job_level.filter(
            (g) => g !== e.target.value
          );
        }
        setMultiFilterState({
          ...multiFilterState,
          job_level: newJobLevel,
        });
        break;

      // salary_min
      case "salary_min":
        setMultiFilterState({
          ...multiFilterState,
          salary_min: e.target.value,
        });
        break;

      // salary_max
      case "salary_max":
        setMultiFilterState({
          ...multiFilterState,
          salary_max: e.target.value,
        });
        break;

      // person_with_disability
      case "person_with_disability":
        setMultiFilterState({
          ...multiFilterState,
          person_with_disability: e.target.checked ? true : false,
        });
        break;

      // degree_level
      case "degree_level":
        setMultiFilterState({
          ...multiFilterState,
          degree_level: e.target.value,
        });
        break;

      // degree_name
      case "degree_name":
        setMultiFilterState({
          ...multiFilterState,
          degree_name: e.target.value,
        });
        break;

      // major_in
      case "major_in":
        setMultiFilterState({
          ...multiFilterState,
          major_in: e.target.value,
        });
        break;

      // experience_min
      case "experience_min":
        setMultiFilterState({
          ...multiFilterState,
          experience_min: e.target.value,
        });
        break;

      // experience_max
      case "experience_max":
        setMultiFilterState({
          ...multiFilterState,
          experience_max: e.target.value,
        });
        break;

      // result
      case "resultGrade":
        if (e.target.value === "Grade") {
          setMultiFilterState({
            ...multiFilterState,
            result: e.target.value,
          });
        } else {
          setMultiFilterState({
            ...multiFilterState,
            result: "",
          });
        }
        break;

      case "resultDivision":
        setMultiFilterState({
          ...multiFilterState,
          result: e.target.value,
          gpa_min: null,
          gpa_max: null,
        });

        break;

      // gpa_min
      case "gpa_min":
        setMultiFilterState({
          ...multiFilterState,
          gpa_min: e.target.value,
        });
        break;

      // gpa_max
      case "gpa_max":
        setMultiFilterState({
          ...multiFilterState,
          gpa_max: e.target.value,
        });
        break;

      // keywords
      case "keywords":
        setMultiFilterState({
          ...multiFilterState,
          keywords: e.target.value,
        });
        break;

      default:
        setMultiFilterState({});
    }
  };

  // institutions change handler
  const institutionshandler = (e) => {
    setMultiFilterState({
      ...multiFilterState,
      institutions: e.map((i) => i.value),
    });
  };

  // ----------- all applicant -----------
  // all applicant List Handler
  const allApplicantListHandler = async () => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      // get employer/orgaization information
      const res = await axios.get(
        `http://127.0.0.1:8000/api/employer/applicants/23/`,
        config
      );

      setApplicationList(res.data.list);
      setFilterComponents("all");
    } catch (err) {
      console.log("application list does not found: ", err);
    }
  };

  // ----------- views -----------
  // show all viewed applicant list handler
  const viewListHandler = async (id) => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      const res = await axios.get(
        `http://127.0.0.1:8000/api/employer/viewedlist/23/`,
        config
      );

      setApplicationList(res.data);
      setFilterComponents("Viewed");
    } catch (err) {
      console.log("error in views list", err);
    }
  };

  // make applicant viewed
  const viewedHandler = async (id) => {
    // header configuration
    // const config = {
    //   headers: {
    //     Authorization: `Bearer ${localStorage.token}`,
    //   },
    // };

    try {
      // const res = await axios.get(
      //   `http://127.0.0.1:8000/api/employer/viewed/${id}/`,
      //   config
      // );

      // applicationList, setApplicationList
      let saw = 0;
      let view = applicationList.find((i) => i.id === id);
      if (view.viewed === false) {
        view.viewed = true;
        saw = 1;
      } else if (view.viewed === true) {
        view.viewed = true;
        saw = 0;
      }

      setApplicationList([...applicationList]);

      // jobPostDetailsDashboardData, setJobPostDetailsDashboardData
      setJobPostDetailsDashboardData({
        ...jobPostDetailsDashboardData,
        viewed: jobPostDetailsDashboardData.viewed + saw,
      });
    } catch (err) {
      console.log("applicant does not rejected: ", err);
    }
  };

  // ----------- shortlist -----------
  // show all shortlisted applicant list Handler
  const shortlistedHandler = async () => {
    console.log("shortlistedHandler");

    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      // get employer/orgaization information
      const res = await axios.get(
        `http://127.0.0.1:8000/api/employer/shortlisted/23/`,
        config
      );

      setApplicationList(res.data);
      setFilterComponents("Shortlisted");
      console.log(res.data);
    } catch (err) {
      console.log("Job Post Details Dashboard Data not found : ", err);
    }
  };

  //  make applicant shortlisted
  const shortlistHandler = async (id) => {
    console.log("shortlistHandler", id);

    // header configuration
    // const config = {
    //   headers: {
    //     Authorization: `Bearer ${localStorage.token}`,
    //   },
    // };

    try {
      // let doShortList = axios.get(
      //   `http://127.0.0.1:8000/api/employer/doshortlist/${id}/`,
      //   config
      // );

      // for state change
      let shortSaw = 0;
      let rejec = 0;
      let applicant = applicationList.find((i) => i.id === id);
      applicant.shortlisted = true;

      if (applicant.rejected === true) {
        applicant.rejected = false;
        rejec = 1;
      } else {
        applicant.rejected = false;
        rejec = 0;
      }

      if (applicant.viewed === false) {
        applicant.viewed = true;
        shortSaw = 1;
      } else if (applicant.viewed === true) {
        applicant.viewed = true;
        shortSaw = 0;
      }

      setApplicationList([...applicationList]);

      setJobPostDetailsDashboardData({
        ...jobPostDetailsDashboardData,
        shortlisted: jobPostDetailsDashboardData.shortlisted + 1,
        viewed: jobPostDetailsDashboardData.viewed + shortSaw,
        rejected: jobPostDetailsDashboardData.rejected - rejec,
      });

      Swal.fire({
        icon: "success",
        width: 300,
        title: "wow",
        text: "applicant become short listed",
      });
    } catch (err) {
      console.log("applicant does not shortlisted: ", err);
    }
  };

  // remove applicant from shortlisted handler
  const shortlistRemoveHandler = async (id) => {
    console.log("short list remove handler ", id);

    // header configuration
    // const config = {
    //   headers: {
    //     Authorization: `Bearer ${localStorage.token}`,
    //   },
    // };

    try {
      // const unshortlisted = await axios.get(
      //   `http://127.0.0.1:8000/api/employer/unshortlisted/${id}/`,
      //   config
      // );

      // make viewed
      let applicant = applicationList.find((i) => i.id === id);
      applicant.shortlisted = false;

      setApplicationList([...applicationList]);

      setJobPostDetailsDashboardData({
        ...jobPostDetailsDashboardData,
        shortlisted: jobPostDetailsDashboardData.shortlisted - 1,
      });

      // Swal.fire({
      //   icon: "error",
      //   width: 300,
      //   title: "Sad!",
      //   text: "remove from shortlist",
      // });
    } catch (err) {
      console.log("applicant does not short listed: ", err);
    }
  };

  // ----------- reject -----------
  // show all rejected applicant list Handler
  const rejectListHandler = async () => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      // get employer/orgaization information
      const res = await axios.get(
        `http://127.0.0.1:8000/api/employer/rejectlist/23/`,
        config
      );

      setApplicationList(res.data);
      setFilterLoading(true);
      setFilterComponents("reject");
    } catch (err) {
      console.log("Job Post Details Dashboard Data not found : ", err);
    }
  };

  // Make applicant rejected handler
  const rejectHandler = async (id) => {
    // sweetalert2
    // const swalRes = await Swal.fire({
    //   input: "textarea",
    //   inputLabel: "Why want to reject ?",
    //   inputPlaceholder: "Type your message here...",
    //   inputAttributes: {
    //     name: "feedback",
    //     "aria-label": "Type your message here",
    //     required: "required",
    //   },
    //   padding: 5,

    //   showCancelButton: true,
    //   confirmButtonText: "SUBMIT",
    //   cancelButtonText: "Cancel",
    // });

    // header configuration
    // const config = {
    //   headers: {
    //     Authorization: `Bearer ${localStorage.token}`,
    //   },
    // };

    try {
      // const res = await axios.post(
      //   `http://127.0.0.1:8000/api/employer/reject/${id}/`,
      //   { feedback: swalRes.value },
      //   config
      // );

      // for state change
      let rejSaw = 0;
      let short = 0;
      let rej = applicationList.find((i) => i.id === id);
      rej.rejected = true;

      if (rej.shortlisted === true) {
        rej.shortlisted = false;
        short = 1;
      } else if (rej.shortlisted === false) {
        rej.shortlisted = false;
        short = 0;
      }

      if (rej.viewed === false) {
        rej.viewed = true;
        rejSaw = 1;
      } else if (rej.viewed === true) {
        rej.viewed = true;
        rejSaw = 0;
      }

      setApplicationList([...applicationList]);

      setJobPostDetailsDashboardData({
        ...jobPostDetailsDashboardData,
        rejected: jobPostDetailsDashboardData.rejected + 1,
        viewed: jobPostDetailsDashboardData.viewed + rejSaw,
        shortlisted: jobPostDetailsDashboardData.shortlisted - short,
      });

      console.log("applicant rejected successfully");
    } catch (err) {
      console.log("applicant does not rejected: ", err);
    }
  };

  // remove applicant from rejected handler
  const removeRejectHandler = async (id) => {
    // header configuration
    // const config = {
    //   headers: {
    //     Authorization: `Bearer ${localStorage.token}`,
    //   },
    // };

    try {
      // const res = await axios.get(
      //   `http://127.0.0.1:8000/api/employer/removereject/${id}/`,
      //   config
      // );

      // applicationList, setApplicationList
      let rej = applicationList.find((i) => i.id === id);
      rej.rejected = false;

      setApplicationList([...applicationList]);

      // jobPostDetailsDashboardData, setJobPostDetailsDashboardData
      setJobPostDetailsDashboardData({
        ...jobPostDetailsDashboardData,
        rejected: jobPostDetailsDashboardData.rejected - 1,
      });

      console.log("applicant remove from rejected successfully");
    } catch (err) {
      console.log("applicant does not remove from rejected: ", err);
    }
  };

  // ----------- interview -----------
  //  show all interviewed applicant list Handler
  const interviewedListHandler = async (id) => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      const res = await axios.get(
        `http://127.0.0.1:8000/api/employer/interviewed/23/`,
        config
      );

      setApplicationList(res.data);
      setFilterComponents("Interviewed");
    } catch (err) {
      console.log("error in interviewed list", err);
    }
  };

  // Make applicant interviewed handler
  const interviewedHandler = async (id) => {
    console.log(id);

    // header configuration
    // const config = {
    //   headers: {
    //     Authorization: `Bearer ${localStorage.token}`,
    //   },
    // };

    try {
      // const res = await axios.get(
      //   `http://127.0.0.1:8000/api/employer/dointerviewed/${id}/`,
      //   config
      // );

      // applicationList, setApplicationList
      let interviewed = applicationList.find((i) => i.id === id);
      interviewed.interviewed = true;

      setApplicationList([...applicationList]);

      // jobPostDetailsDashboardData, setJobPostDetailsDashboardData
      setJobPostDetailsDashboardData({
        ...jobPostDetailsDashboardData,
        interviewed: jobPostDetailsDashboardData.interviewed + 1,
      });

      console.log("applicant becomes interviewed");

      Swal.fire({
        icon: "success",
        width: 300,
        title: "wow",
        text: "applicant become interviewed",
      });
    } catch (err) {
      console.log("applicant does not short listed: ", err);
    }
  };

  // remove applicant from interviewed handler
  const removeInterviewedHandler = async (id) => {
    // header configuration
    // const config = {
    //   headers: {
    //     Authorization: `Bearer ${localStorage.token}`,
    //   },
    // };

    try {
      // const res = await axios.get(
      //   `http://127.0.0.1:8000/api/employer/uninterviewed/${id}/`,
      //   config
      // );

      // applicationList, setApplicationList
      let rej = applicationList.find((i) => i.id === id);
      rej.interviewed = false;

      setApplicationList([...applicationList]);

      // jobPostDetailsDashboardData, setJobPostDetailsDashboardData
      setJobPostDetailsDashboardData({
        ...jobPostDetailsDashboardData,
        interviewed: jobPostDetailsDashboardData.interviewed - 1,
      });

      console.log("applicant remove from interviewed successfully");
    } catch (err) {
      console.log("applicant does not remove from interviewed: ", err);
    }
  };

  // not interviewed list
  const notInterviewedList = async () => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      // get employer/orgaization information
      const res = await axios.get(
        `http://127.0.0.1:8000/api/employer/applicants/23/`,
        config
      );

      setApplicationList(res.data.list);
      setFilterComponents("NotInterviewedList");
    } catch (err) {
      console.log("notInterviewedList list does not found: ", err);
    }
  };

  // ----------- select -----------
  // show all selected List Handler
  const selectedListHandler = async (id) => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      const res = await axios.get(
        `http://127.0.0.1:8000/api/employer/selected/23/`,
        config
      );

      setApplicationList(res.data);
      setFilterComponents("Selected");
    } catch (err) {
      console.log("error in Selected list", err);
    }
  };

  //  make applicant selected  handler
  const selectedHandler = async (id) => {
    console.log(id);

    // header configuration
    // const config = {
    //   headers: {
    //     Authorization: `Bearer ${localStorage.token}`,
    //   },
    // };

    try {
      // const res = await axios.get(
      //   `http://127.0.0.1:8000/api/employer/doselected/${id}/`,
      //   config
      // );

      // applicationList, setApplicationList
      let selected = applicationList.find((i) => i.id === id);
      selected.selected = true;

      setApplicationList([...applicationList]);

      // jobPostDetailsDashboardData, setJobPostDetailsDashboardData
      setJobPostDetailsDashboardData({
        ...jobPostDetailsDashboardData,
        selected: jobPostDetailsDashboardData.selected + 1,
      });

      Swal.fire({
        icon: "success",
        width: 300,
        title: "Congratulations!",
        text: "Finally Selected",
      });
    } catch (err) {
      console.log("applicant does not selected: ", err);
    }
  };

  // remove applicant from interviewed handler
  const removeSelectedHandler = async (id) => {
    // header configuration
    // const config = {
    //   headers: {
    //     Authorization: `Bearer ${localStorage.token}`,
    //   },
    // };

    try {
      // const res = await axios.get(
      //   `http://127.0.0.1:8000/api/employer/deselect/${id}/`,
      //   config
      // );

      // applicationList, setApplicationList
      let rej = applicationList.find((i) => i.id === id);
      rej.selected = false;

      setApplicationList([...applicationList]);

      // jobPostDetailsDashboardData, setJobPostDetailsDashboardData
      setJobPostDetailsDashboardData({
        ...jobPostDetailsDashboardData,
        selected: jobPostDetailsDashboardData.selected - 1,
      });

      console.log("applicant remove from selected successfully");
    } catch (err) {
      console.log("applicant does not remove from selected: ", err);
    }
  };

  // add comment handler
  const addCommentHandler = async (id) => {
    // const cmntSwal = await Swal.fire({
    //   input: "textarea",
    //   inputLabel: "Add Your Comment",
    //   inputPlaceholder: "Type your message here...",
    //   inputAttributes: {
    //     "aria-label": "Type your message here",
    //     required: "required",
    //   },
    //   showCancelButton: true,
    //   confirmButtonText: "SUBMIT",
    //   cancelButtonText: "Cancel",
    // });

    // header configuration
    // const config = {
    //   headers: {
    //     Authorization: `Bearer ${localStorage.token}`,
    //   },
    // };

    try {
      // const res = await axios.post(
      //   `http://127.0.0.1:8000/api/employer/commentApi/${id}/`,
      //   { feedback: cmntSwal.value },
      //   config
      // );

      console.log("comment added successfully");
    } catch (err) {
      console.log("you should correct api endpoint");
    }
  };

  // multi search filter handler
  const searchFilterHandler = async (e) => {
    e.preventDefault();

    Object.keys(multiFilterState).forEach((key) =>
      multiFilterState[key] === "" || multiFilterState[key] === null
        ? delete multiFilterState[key]
        : multiFilterState
    );

    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      const res = await axios.post(
        `http://127.0.0.1:8000/api/employer/filter_applicants/23/`,
        multiFilterState,
        config
      );

      setApplicationList(res.data);
      setFilterComponents("all");
    } catch (err) {
      console.log("quick filter does not successfull : ", err);
    }
  };

  return (
    <>
      <Navigation />
      {/* main content  */}
      <div className="container" style={{ marginTop: "70px" }}>
        {/* color box container  */}
        <div id="color-box-container" className="row">
          <Accordion defaultActiveKey="0">
            <Accordion.Item eventKey="0" className="jpdd-accordion-item">
              {/* accordion header container  */}
              <div className="jpdd-accordion-header-container px-3 rounded">
                <div className="jpdd-accordion-header-logo">
                  <OrganizationImage />
                </div>

                <div className="jpdd-accordion-header-title">
                  <h5 className="text-capitalize">
                    React Full Stack Developer
                  </h5>
                </div>

                <div className="ms-2">
                  <button className="btn btn-primary btn-sm rounded-pill  text-capitalize">
                    <FontAwesomeIcon
                      className="me-2"
                      icon={["far", "check-circle"]}
                    />
                    active
                  </button>
                </div>

                <Accordion.Header
                  className="jpdd-accordion-header ms-auto"
                  onClick={() =>
                    setAccordionHeaderToggleIcon(!accordionHeaderToggleIcon)
                  }
                >
                  <div className="">
                    {accordionHeaderToggleIcon ? (
                      <button className="btn btn-primary rounded-pill  text-uppercase">
                        <FontAwesomeIcon
                          icon={["fas", "chevron-up"]}
                          className="me-2"
                        />
                        {""}
                        Dashboard
                      </button>
                    ) : (
                      <button className="btn btn-primary rounded-pill  text-uppercase">
                        <FontAwesomeIcon
                          icon={["fas", "chevron-down"]}
                          className="me-2"
                        />
                        Dashboard
                      </button>
                    )}
                  </div>
                </Accordion.Header>
              </div>

              <Accordion.Body className="jpdd-accordion-body">
                {/* 1st row of color box  */}
                <div className="d-flex">
                  <div className="flex-grow-1 color-box-item-container">
                    <JobPostColorBox
                      title="Published On"
                      content={
                        jobPostDetailsDashboardData.jobpost &&
                        moment(
                          `${jobPostDetailsDashboardData.jobpost.created_at}`
                        ).format("Do MMM YYYY")
                      }
                      bgColor="rgba(41, 15, 186, 0.7)"
                      icon="calendar-alt"
                    />
                  </div>

                  <div className="flex-grow-1 color-box-item-container">
                    <JobPostColorBox
                      title="Expired On"
                      content={
                        jobPostDetailsDashboardData.jobpost &&
                        moment(
                          `${jobPostDetailsDashboardData.jobpost.deadline}`
                        ).format("Do MMM YYYY")
                      }
                      bgColor="rgba(130, 54, 203, 0.6)
                  "
                      icon="calendar-alt"
                    />
                  </div>

                  <div className="flex-grow-1 color-box-item-container">
                    <JobPostColorBox
                      title="Job Type"
                      content={
                        jobPostDetailsDashboardData.jobpost &&
                        jobPostDetailsDashboardData.jobpost.job_level
                      }
                      bgColor="rgba(185, 122, 149, 1)"
                      icon="envelope"
                    />
                  </div>

                  <div
                    onClick={allApplicantListHandler}
                    className="flex-grow-1 color-box-item-container"
                  >
                    <JobPostColorBox
                      title="Applicantions"
                      content={jobPostDetailsDashboardData.total}
                      bgColor="rgba(133, 39, 71, 1)"
                      icon="users"
                    />
                  </div>
                </div>

                {/* 2nd row of color box  */}
                <div className="d-flex">
                  {/* Views  */}
                  <div
                    onClick={viewListHandler}
                    className="flex-grow-1 color-box-item-container"
                  >
                    <JobPostColorBox
                      title="Views"
                      content={
                        jobPostDetailsDashboardData &&
                        jobPostDetailsDashboardData.viewed
                      }
                      bgColor="rgba(162, 15, 186, 0.55)"
                      icon="eye"
                    />
                  </div>

                  {/*interviewed  */}
                  <div
                    className="flex-grow-1 color-box-item-container"
                    onClick={interviewedListHandler}
                  >
                    <JobPostColorBox
                      title="Interviewed"
                      content={jobPostDetailsDashboardData.interviewed}
                      bgColor="rgba(162, 65, 107, 1)"
                      icon="eye"
                    />
                  </div>

                  {/* Not interviewed  */}
                  <div
                    className="flex-grow-1 color-box-item-container"
                    onClick={notInterviewedList}
                  >
                    <JobPostColorBox
                      title="Not Interviewed"
                      content={
                        jobPostDetailsDashboardData.total &&
                        jobPostDetailsDashboardData.total -
                          jobPostDetailsDashboardData.interviewed
                      }
                      bgColor="rgba(255, 119, 119, 1)"
                      icon="eye-slash"
                    />
                  </div>

                  {/* rejected  */}
                  <div
                    onClick={rejectListHandler}
                    className="flex-grow-1 color-box-item-container"
                  >
                    <JobPostColorBox
                      title="Rejected"
                      content={jobPostDetailsDashboardData.rejected}
                      bgColor="rgba(255, 97, 109, 1)"
                      icon="ban"
                    />
                  </div>
                </div>

                {/* 3rd row of color box  */}
                <div className="d-flex">
                  <div
                    onClick={shortlistedHandler}
                    className="flex-grow-1 color-box-item-container"
                  >
                    <JobPostColorBox
                      title="Short listed"
                      content={jobPostDetailsDashboardData.shortlisted}
                      bgColor="rgba(113, 111, 129, 1)"
                      icon="check-square"
                    />
                  </div>

                  <div
                    onClick={selectedListHandler}
                    className="flex-grow-1 color-box-item-container"
                  >
                    <JobPostColorBox
                      title="Selected"
                      content={jobPostDetailsDashboardData.selected}
                      bgColor="rgba(185, 122, 149, 1)"
                      icon="user-check"
                    />
                  </div>

                  <div className="flex-grow-1 color-box-item-container">
                    <a
                      href="#a"
                      style={{
                        backgroundColor: "blueviolet",
                        margin: "10px 5px 0 5px",
                      }}
                      className="flex-fill d-flex justify-content-between rounded px-3 align-items-center text-white"
                      download
                    >
                      <div>
                        <h6 className="fw-bold">Download CSV</h6>
                        <h3 className="text-capitalize">Report</h3>
                      </div>
                      <div className="color-box-icon">
                        <FontAwesomeIcon
                          className="ms-2"
                          icon={["fas", "file-download"]}
                        />
                      </div>
                    </a>
                  </div>
                </div>
              </Accordion.Body>
            </Accordion.Item>
          </Accordion>
        </div>

        {/* filter container */}
        <div id="jpdd-filter-container" className="row rounded">
          {/* filter item container  */}
          <div className="jpdd-filter-item-container col-md-2 ">
            <div>
              {/* quick filter  */}
              <Tippy
                trigger={"click"}
                theme={"light"}
                animation={"shift-toward"}
                placement={"right"}
                interactive={true}
                className="jpdd-tippy-container"
                content={
                  <QuickFilter
                    searchFilterHandler={searchFilterHandler}
                    changeHandler={multiFilterStateChangeHandler}
                  />
                }
              >
                <div
                  className={
                    active.quick
                      ? "jpdd-filter-item jpdd-filter-item-first-child jpdd-filter-item-active"
                      : "jpdd-filter-item jpdd-filter-item-first-child"
                  }
                  onClick={() => activeFilterHandler(1)}
                >
                  <FontAwesomeIcon
                    className="fs-1 mb-3"
                    icon={["fas", "filter"]}
                  />
                  <h6 className="font-small">Quick Filters</h6>
                </div>
              </Tippy>

              {/* academic  */}
              <Tippy
                trigger={"click"}
                theme={"light"}
                animation={"shift-toward"}
                placement={"right"}
                interactive={true}
                className="jpdd-tippy-container"
                content={
                  <AcademicFilter
                    searchFilterHandler={searchFilterHandler}
                    changeHandler={multiFilterStateChangeHandler}
                    institutionshandler={institutionshandler}
                  />
                }
              >
                <div
                  className={
                    active.academic
                      ? "jpdd-filter-item jpdd-filter-item-active"
                      : "jpdd-filter-item"
                  }
                  onClick={() => activeFilterHandler(2)}
                >
                  <FontAwesomeIcon
                    className="fs-1 mb-3"
                    icon={["fas", "graduation-cap"]}
                  />
                  <h6 className="font-small">Academic</h6>
                </div>
              </Tippy>

              {/* experience  */}
              <Tippy
                trigger={"click"}
                theme={"light"}
                animation={"shift-toward"}
                placement={"right"}
                interactive={true}
                className="jpdd-tippy-container"
                content={
                  <ExperienceFilter
                    searchFilterHandler={searchFilterHandler}
                    changeHandler={multiFilterStateChangeHandler}
                  />
                }
              >
                <div
                  className={
                    active.experience
                      ? "jpdd-filter-item jpdd-filter-item-active"
                      : "jpdd-filter-item"
                  }
                  onClick={() => activeFilterHandler(3)}
                >
                  <FontAwesomeIcon
                    className="fs-1 mb-3"
                    icon={["fas", "calendar-alt"]}
                  />
                  <h6 className="font-small">Experience</h6>
                </div>
              </Tippy>

              {/* keywords */}
              <Tippy
                trigger={"click"}
                theme={"light"}
                animation={"shift-toward"}
                placement={"right"}
                interactive={true}
                className="jpdd-tippy-container"
                content={
                  <KeywordsFilter
                    searchFilterHandler={searchFilterHandler}
                    changeHandler={multiFilterStateChangeHandler}
                  />
                }
              >
                <div
                  className={
                    active.keyword
                      ? "jpdd-filter-item jpdd-filter-item-last-child  jpdd-filter-item-active"
                      : "jpdd-filter-item jpdd-filter-item-last-child "
                  }
                  onClick={() => activeFilterHandler(4)}
                >
                  <FontAwesomeIcon
                    className="fs-1 mb-3"
                    icon={["fas", "tags"]}
                  />
                  <h6 className="font-small">Keywords</h6>
                </div>
              </Tippy>
            </div>
          </div>

          {/* filter item content  */}
          <div className="jpdd-filter-item-content-container col-md-10 ">
            {filterComponents === "all" && (
              <AllApplicants
                applicationList={applicationList && applicationList}
                viewedHandler={viewedHandler}
                addCommentHandler={addCommentHandler}
                shortlistHandler={shortlistHandler}
                rejectHandler={rejectHandler}
              />
            )}{" "}
            {filterComponents === "reject" && (
              <Rejected
                applicationList={applicationList && applicationList}
                removeRejectHandler={removeRejectHandler}
                addCommentHandler={addCommentHandler}
                shortlistHandler={shortlistHandler}
                rejectHandler={rejectHandler}
              />
            )}
            {filterComponents === "Viewed" && (
              <ViewedFilter
                applicationList={applicationList && applicationList}
                addCommentHandler={addCommentHandler}
                type={filterComponents}
                viewListHandler={viewListHandler}
              />
            )}
            {filterComponents === "Shortlisted" && (
              <ShortlistedFilter
                applicationList={applicationList && applicationList}
                addCommentHandler={addCommentHandler}
                shortlistRemoveHandler={shortlistRemoveHandler}
                interviewedHandler={interviewedHandler}
                removeInterviewedHandler={removeInterviewedHandler}
              />
            )}
            {filterComponents === "Interviewed" && (
              <InterviewedFilter
                applicationList={applicationList && applicationList}
                addCommentHandler={addCommentHandler}
                selectedHandler={selectedHandler}
                removeInterviewedHandler={removeInterviewedHandler}
                removeSelectedHandler={removeSelectedHandler}
              />
            )}
            {filterComponents === "Selected" && (
              <SelectedFilter
                applicationList={applicationList && applicationList}
                addCommentHandler={addCommentHandler}
                removeSelectedHandler={removeSelectedHandler}
              />
            )}
            {filterComponents === "NotInterviewedList" && (
              <NotInterviewedFilter
                applicationList={applicationList && applicationList}
                addCommentHandler={addCommentHandler}
                shortlistHandler={shortlistHandler}
                rejectHandler={rejectHandler}
                interviewedHandler={interviewedHandler}
              />
            )}
          </div>
        </div>
      </div>
    </>
  );
};

export default JobPostDetailsDashboard;
