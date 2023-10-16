import React, { useState, useEffect } from "react";
import { Link, Outlet, useNavigate } from "react-router-dom";

import axios from "axios";
import Accordion from "react-bootstrap/Accordion";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

// svg icons
import { ReactComponent as OrganizationImage } from "../../images/new/svg/3d-buildings.svg";
import { ReactComponent as JobsImage } from "../../images/new/svg/briefcase.svg";

import { ReactComponent as PendingJobsImages } from "../../images/new/svg/sand-clock.svg";

import { ReactComponent as ActiveJobsImages } from "../../images/new/svg/list.svg";
import { ReactComponent as CreateJobsImage } from "../../images/new/svg/plus.svg";

import { ReactComponent as BillingsImages } from "../../images/new/svg/credit-card.svg";
import { ReactComponent as NewOrg } from "../../images/new/svg/plus.svg";
import { ReactComponent as PendingOrg } from "../../images/new/svg/sand-clock.svg";
import { ReactComponent as ActiveOrg } from "../../images/new/svg/list.svg";
import { ReactComponent as Settings } from "../../images/new/svg/cogwheel.svg";
import { ReactComponent as AllInvoice } from "../../images/new/svg/invoices.svg";
import { ReactComponent as PendingInvoice } from "../../images/new/svg/wall-clock.svg";
import { ReactComponent as FaqImage } from "../../images/new/svg/faq.svg";
import { ReactComponent as HelpImage } from "../../images/new/svg/help.svg";

// components
import Navigation from "../shared/Navigation/Navigation";
import ThreeColumnLayout from "../shared/Layout/Component39/Layout3";
import NineColumnLayout from "../shared/Layout/Component39/Layout9";

import "./Organizations.css";

const OrganizationDashboard = () => {
  // navigate
  let navigate = useNavigate();

  // organization data
  const [orgData, setOrgData] = useState([]);

  // all job post state
  const [jobPosts, setJobPosts] = useState([]);

  // accordion button's state
  const [accordionButton, setAccordionButton] = useState({
    itemOne: true,
    itemTwo: false,
    itemThree: false,
  });
  // active icon's state
  const [isActive, setIsActive] = useState(0);
  const [item, setItem] = useState("");

  // three category
  const [threeCategory, setThreeCategory] = useState({});

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
          "http://127.0.0.1:8000/api/employer/",
          config
        );

        setOrgData(res.data);

        // get multi category information
        const threeCat = await axios.get(
          "http://127.0.0.1:8000/api/employer/three_cat/",
          config
        );

        setThreeCategory(threeCat.data);

        // get all job posts
        const jobPostsRes = await axios.get(
          "http://127.0.0.1:8000/api/employer/jobpost/",
          config
        );

        setJobPosts(jobPostsRes.data);
      } catch (err) {
        console.log("from org dashboard", err);
      }
    }

    fetchData();
  }, []);

  let active = 0;
  let pending = 909;
  let activeJob = 0;
  let pendingJob = 0;

  // check active or pending organization
  orgData.forEach((item) => {
    // check is organization active or pending
    if (item.is_active) {
      active = active + 1;
    } else {
      pending = pending + 1;
    }
  });

  // check active or pending jobs
  jobPosts.forEach((item) => {
    // check is organization active or pending
    if (item.is_active) {
      activeJob = activeJob + 1;
    } else {
      pendingJob = pendingJob + 1;
    }
  });

  // active icon's handler
  const activeClassHandler = (id, title) => {
    setIsActive(id);
    setItem(title);
  };

  // accordion button change handler one
  const accordionButtonChangeOne = () => {
    setAccordionButton({
      ...accordionButton,
      itemOne: !accordionButton.itemOne,
      itemTwo: false,
      itemThree: false,
    });
  };

  // accordion button change handler two
  const accordionButtonChangeTwo = () => {
    setAccordionButton({
      ...accordionButton,
      itemOne: false,
      itemTwo: !accordionButton.itemTwo,
      itemThree: false,
    });
  };

  // accordion button change handler three
  const accordionButtonChangeThree = () => {
    setAccordionButton({
      ...accordionButton,
      itemOne: false,
      itemTwo: false,
      itemThree: !accordionButton.itemThree,
    });
  };

  // Hide or unhide From search
  const hideFromSearchHandler = async (id, hidden) => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      const res = await axios.get(
        hidden
          ? `http://127.0.0.1:8000/api/employer/unhideorg/${id}/`
          : `http://127.0.0.1:8000/api/employer/hideorg/${id}/`,
        config
      );

      setOrgData(res.data);

      console.log("Successfully Hide/Unhide From Search");
    } catch (err) {
      console.log("Does not Hide From Search", err);
    }
  };

  // update organization
  const updateHandler = (data) => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    axios
      .patch(
        `http://127.0.0.1:8000/api/employer/${orgData && orgData.id}/`,
        data,
        config
      )
      .then((res) => {
        console.log("organization updated successfully");

        navigate("/organizations-dashboard", { replace: true });
      })
      .catch((err) => {
        console.log("organization does not updated");
      });
  };

  // remove organization
  const removeOrganizationHandler = async (id) => {
    // header configuration
    const config = {
      headers: {
        Authorization: `Bearer ${localStorage.token}`,
      },
    };

    try {
      const res = await axios.delete(
        `http://127.0.0.1:8000/api/employer/${id}/`,
        config
      );

      setOrgData(res.data);
    } catch (err) {
      console.log("Does not Deleted", err);
    }
  };

  return (
    <>
      <Navigation />
      <div className="container" style={{ marginTop: "100px" }}>
        <div className="row">
          <ThreeColumnLayout innerStyle={{ padding: "0px" }}>
            <Accordion defaultActiveKey="0">
              {/* organization  */}
              <Accordion.Item eventKey="0" className="custom-accordion-item">
                {/* header  */}

                <Accordion.Header
                  className="custom-accordion-header"
                  onClick={accordionButtonChangeOne}
                >
                  <div className="org-svg-icon">
                    <OrganizationImage
                      className={isActive === 1 && "org-svg-color"}
                    />
                  </div>

                  <div className="flex-grow-1">
                    <h5 className="org-content-title">Manage Organizations</h5>
                    <p className="org-content-message">
                      Create view all and check status
                    </p>
                  </div>

                  <div>
                    {accordionButton.itemOne ? (
                      <FontAwesomeIcon
                        icon={["fas", "minus"]}
                        className="text-dark"
                      />
                    ) : (
                      <FontAwesomeIcon
                        icon={["fas", "plus"]}
                        className="text-dark"
                      />
                    )}
                  </div>
                </Accordion.Header>

                {/* Organization Accordion body  */}
                <Accordion.Body className="custom-accordion-body">
                  {/* create organization  */}
                  <Link to="/organizations-dashboard/create-organizaton">
                    <div
                      className={
                        item === "org1"
                          ? "inner-accordion-items org-active-item"
                          : "inner-accordion-items"
                      }
                      onClick={() => activeClassHandler(1, "org1")}
                    >
                      <div className="org-svg-icon center-inner-item">
                        <NewOrg />
                      </div>

                      <div className="flex-grow-1 center-inner-item">
                        <h5 className="org-content-title">
                          Create New Organization
                        </h5>
                      </div>
                    </div>
                  </Link>

                  {/* pending organization  */}
                  <Link to="/organizations-dashboard/pending-organizations">
                    <div
                      className={
                        item === "org2"
                          ? "d-flex inner-accordion-items org-active-item"
                          : "d-flex inner-accordion-items"
                      }
                      onClick={() => activeClassHandler(1, "org2")}
                    >
                      <div className="org-svg-icon center-inner-item">
                        <PendingOrg />
                      </div>

                      <div className="flex-grow-1 center-inner-item">
                        <h5 className="org-content-title">
                          Pending Organization
                          <span className="ms-1 org-pending-color">{`(${pending})`}</span>
                        </h5>
                      </div>
                    </div>
                  </Link>

                  {/* active organizations  */}
                  {/* <Link to={`${url}/active-organizations`}> */}
                  <Link to="/organizations-dashboard/active-organizations">
                    <div
                      className={
                        item === "org3"
                          ? "d-flex inner-accordion-items org-active-item"
                          : "d-flex inner-accordion-items"
                      }
                      onClick={() => activeClassHandler(1, "org3")}
                    >
                      <div className="org-svg-icon center-inner-item">
                        <ActiveOrg />
                      </div>

                      <div className="flex-grow-1 center-inner-item">
                        <h5 className="org-content-title">
                          Active Organization
                          <span className="ms-1 org-active-color">{`(${active})`}</span>
                        </h5>
                      </div>
                    </div>
                  </Link>
                </Accordion.Body>
              </Accordion.Item>

              {/* jobs  */}
              <Accordion.Item eventKey="1" className="custom-accordion-item">
                <Accordion.Header
                  className="custom-accordion-header"
                  onClick={accordionButtonChangeTwo}
                >
                  <div className="org-svg-icon">
                    <JobsImage className={isActive === 2 && "org-svg-color"} />
                  </div>

                  <div className="flex-grow-1">
                    <h5 className="org-content-title">Manage Jobs</h5>
                    <p className="org-content-message">
                      Manage all jobs and chech status
                    </p>
                  </div>
                  <div>
                    {accordionButton.itemTwo ? (
                      <FontAwesomeIcon
                        icon={["fas", "minus"]}
                        className="text-dark"
                      />
                    ) : (
                      <FontAwesomeIcon
                        icon={["fas", "plus"]}
                        className="text-dark"
                      />
                    )}
                  </div>
                </Accordion.Header>

                {/* Jobs Accordion body */}
                <Accordion.Body className="custom-accordion-body">
                  {/* create new jobs  */}
                  <Link to="/organizations-dashboard/create-new-job">
                    <div
                      className={
                        item === "jobs1"
                          ? "d-flex inner-accordion-items org-active-item"
                          : "d-flex inner-accordion-items"
                      }
                      onClick={() => activeClassHandler(2, "jobs1")}
                    >
                      <div className="org-svg-icon center-inner-item">
                        <CreateJobsImage />
                      </div>
                      <div className="flex-grow-1 center-inner-item">
                        <h5 className="org-content-title">Create New Jobs</h5>
                      </div>
                    </div>
                  </Link>

                  {/* pending jobs  */}
                  <Link to="/organizations-dashboard/pending-jobs">
                    <div
                      className={
                        item === "jobs2"
                          ? "d-flex inner-accordion-items org-active-item"
                          : "d-flex inner-accordion-items"
                      }
                      onClick={() => activeClassHandler(2, "jobs2")}
                    >
                      <div className="org-svg-icon center-inner-item">
                        <PendingJobsImages />
                      </div>
                      <div className="flex-grow-1 center-inner-item">
                        <h5 className="org-content-title">
                          Pending Jobs
                          <span className="ms-1 org-pending-color">
                            ({pendingJob})
                          </span>
                        </h5>
                      </div>
                    </div>
                  </Link>

                  {/* active jobs  */}
                  {/* <Link to={`${url}/active-jobs`}> */}
                  <Link to="/organizations-dashboard/active-jobs">
                    <div
                      className={
                        item === "jobs3"
                          ? "d-flex inner-accordion-items org-active-item"
                          : "d-flex inner-accordion-items"
                      }
                      onClick={() => activeClassHandler(2, "jobs3")}
                    >
                      <div className="org-svg-icon center-inner-item">
                        <ActiveJobsImages />
                      </div>
                      <div className="flex-grow-1 center-inner-item">
                        <h5 className="org-content-title">
                          Active/Expired Job Post
                          <span className="ms-1 org-active-color">
                            ({activeJob})
                          </span>
                        </h5>
                      </div>
                    </div>
                  </Link>
                </Accordion.Body>
              </Accordion.Item>

              {/* billings  */}
              <Accordion.Item eventKey="2" className="custom-accordion-item">
                {/* headers  */}
                <Accordion.Header
                  className="custom-accordion-header"
                  onClick={accordionButtonChangeThree}
                >
                  <div className="org-svg-icon active">
                    <BillingsImages
                      className={isActive === 3 && "org-svg-color"}
                    />
                  </div>
                  <div className="flex-grow-1">
                    <h5 className="org-content-title">Manage Billings</h5>
                    <p className="org-content-message">
                      All invoices and payments
                    </p>
                  </div>
                  <div>
                    {accordionButton.itemThree ? (
                      <FontAwesomeIcon
                        icon={["fas", "minus"]}
                        className="text-dark"
                      />
                    ) : (
                      <FontAwesomeIcon
                        icon={["fas", "plus"]}
                        className="text-dark"
                      />
                    )}
                  </div>
                </Accordion.Header>

                {/* Billings Accordion body  */}
                <Accordion.Body className="custom-accordion-body">
                  {/* billings settings  */}
                  <Link to="/organizations-dashboard/billings-settings">
                    <div
                      className={
                        item === "bill1"
                          ? "d-flex inner-accordion-items org-active-item"
                          : "d-flex inner-accordion-items"
                      }
                      onClick={() => activeClassHandler(3, "bill1")}
                    >
                      <div className="org-svg-icon center-inner-item">
                        <Settings />
                      </div>
                      <div className="flex-grow-1 center-inner-item">
                        <h5 className="org-content-title">Billings Settings</h5>
                      </div>
                    </div>
                  </Link>

                  {/* All Invoices   */}
                  <Link to="/organizations-dashboard/all-invoices">
                    <div
                      className={
                        item === "bill2"
                          ? "d-flex inner-accordion-items org-active-item"
                          : "d-flex inner-accordion-items"
                      }
                      onClick={() => activeClassHandler(3, "bill2")}
                    >
                      <div className="org-svg-icon center-inner-item">
                        <AllInvoice />
                      </div>
                      <div className="flex-grow-1 center-inner-item">
                        <h5 className="org-content-title">
                          All Invoices
                          <span className="ms-1 org-active-color">(21)</span>
                        </h5>
                      </div>
                    </div>
                  </Link>

                  {/* pending invoices */}
                  <Link to="/organizations-dashboard/pending-invoices">
                    <div
                      className={
                        item === "bill3"
                          ? "d-flex inner-accordion-items org-active-item"
                          : "d-flex inner-accordion-items"
                      }
                      onClick={() => activeClassHandler(3, "bill3")}
                    >
                      <div className="org-svg-icon center-inner-item">
                        <PendingInvoice />
                      </div>
                      <div className="flex-grow-1 center-inner-item">
                        <h5 className="org-content-title">
                          Pending Invoices{" "}
                          <span className="ms-1 org-pending-color">(25)</span>
                        </h5>
                      </div>
                    </div>
                  </Link>
                </Accordion.Body>
              </Accordion.Item>
            </Accordion>

            {/* Frequently Ask Question */}
            <Link to={"#faq"}>
              <div
                className={
                  item === "faq"
                    ? "d-flex inner-accordion-items org-active-item"
                    : "d-flex inner-accordion-items"
                }
                onClick={() => activeClassHandler(4, "faq")}
              >
                <div
                  className={
                    isActive === 4
                      ? "org-svg-icon center-inner-item org-svg-color"
                      : "org-svg-icon center-inner-item"
                  }
                >
                  <FaqImage />
                </div>
                <div className="flex-grow-1 center-inner-item">
                  <h5 className="org-content-title">
                    {" "}
                    Frequently Ask Question
                  </h5>
                </div>
              </div>
            </Link>

            {/* Help and Support  */}
            <Link to={"#help"}>
              <div
                className={
                  item === "help"
                    ? "d-flex inner-accordion-items org-active-item"
                    : "d-flex inner-accordion-items"
                }
                onClick={() => activeClassHandler(5, "help")}
              >
                <div
                  className={
                    isActive === 5
                      ? "org-svg-icon center-inner-item org-svg-color"
                      : "org-svg-icon center-inner-item"
                  }
                >
                  <HelpImage />
                </div>
                <div className="flex-grow-1 center-inner-item">
                  <h5 className="org-content-title"> Help &amp; Support</h5>
                </div>
              </div>
            </Link>
          </ThreeColumnLayout>

          <NineColumnLayout
            innerStyle={{
              padding: "0px",
              backgroundColor: "transparent",
              boxShadow: "none",
            }}
          >
            <div>
              <Outlet
                context={{
                  threeCategory,
                  orgData,
                  activeJob,
                  pending,
                  pendingJob,
                  active,
                  activeClassHandler,
                  accordionButtonChangeOne,
                  accordionButtonChangeTwo,
                  accordionButtonChangeThree,
                  hideFromSearchHandler,
                  updateHandler,
                  removeOrganizationHandler,
                }}
              />
            </div>
          </NineColumnLayout>
        </div>
      </div>
    </>
  );
};

export default OrganizationDashboard;
