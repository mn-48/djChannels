import React from "react";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css";

import MyOrganization from "../../images/new/user.png";
import CreateOrganization from "../../images/new/building.png";
import CreateImage from "../../images/new/button.png";
import { ReactComponent as OrganizationImage } from "../../images/new/svg/3d-buildings.svg";
import AllJob from "../../images/new/job.png";

import "./UserIconDropDown.css";

const Organization = ({ onBackPrevContentHandler }) => {
  return (
    <>
      {/* Orgnization Title  */}
      <div
        className="d-flex py-2 nested-content-title-container"
        onClick={onBackPrevContentHandler}
      >
        <div className="ms-1 ps-3 pe-2 nested-title-left-icon">
          <FontAwesomeIcon icon={["fas", "chevron-left"]} />
        </div>
        <div className="flex-grow-1 ms-3 ps-1">
          <h2 className="nested-content-title">Organization</h2>
        </div>
        <div className="px-3 svg-icon">
          <OrganizationImage />
        </div>
      </div>

      {/* organization dashboard */}
      <div>
        <Link to="/organizations-dashboard">
          <div className="d-flex">
            <div className="px-3 icon-left">
              <img src={CreateOrganization} alt="user" />
            </div>
            <div className="flex-grow-1 ms-1 ps-1">
              <h5 className="content-title">
                <b>Organization Dashboard</b>
              </h5>
              <p className="content-message">Go to dashboard</p>
            </div>
          </div>
        </Link>
      </div>

      {/* my organization  */}
      <Tippy
        trigger={"click"}
        theme={"light"}
        animation={"perspective"}
        placement={"left"}
        interactive={true}
        content={
          <div>
            <Link to="/route1">
              <div div className="d-flex p-1 nested-custom-tippy-content-item">
                <div className="pe-2 icon-left d-flex justify-content-center align-items-center custom-tippy-content-style">
                  <img src={MyOrganization} alt="user" />
                </div>
                <div className="flex-grow-1">
                  <h5 className="content-title">Organizations One</h5>
                  <p className="content-message">Find all organization</p>
                </div>
              </div>
            </Link>

            <Link to="/route2">
              <div className="d-flex p-1 nested-custom-tippy-content-item">
                <div className="pe-2 icon-left d-flex justify-content-center align-items-center">
                  <img src={MyOrganization} alt="user" />
                </div>
                <div className="flex-grow-1">
                  <h5 className="content-title">Organizations Two</h5>
                  <p className="content-message">Find all organization</p>
                </div>
              </div>
            </Link>

            <Link to="/route3">
              <div className="d-flex p-1 nested-custom-tippy-content-item">
                <div className="pe-2 icon-left d-flex justify-content-center align-items-center">
                  <img src={MyOrganization} alt="user" />
                </div>
                <div className="flex-grow-1">
                  <h5 className="content-title">Organizations Three</h5>
                  <p className="content-message">Find all organization</p>
                </div>
              </div>
            </Link>
          </div>
        }
      >
        <div className="d-flex">
          <div className="px-3 icon-left">
            <img src={MyOrganization} alt="user" />
          </div>
          <div className="flex-grow-1 ms-1 ps-1">
            <h5 className="content-title">My Organizations</h5>
            <p className="content-message">Find all organization</p>
          </div>
        </div>
      </Tippy>

      {/* create organization */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={CreateOrganization} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Create Organization</h5>
          <p className="content-message">Create new organization</p>
        </div>
      </div>

      {/* create job post  */}
      <Tippy
        trigger={"click"}
        interactive={true}
        theme={"light"}
        animation={"perspective"}
        placement={"left"}
        content={
          <div>
            <Link to="/org1">
              <div div className="d-flex p-1 nested-custom-tippy-content-item">
                <div className="pe-2 icon-left d-flex justify-content-center align-items-center custom-tippy-content-style">
                  <img src={MyOrganization} alt="user" />
                </div>
                <div className="flex-grow-1">
                  <h5 className="content-title">Creates One</h5>
                  <p className="content-message">Find all organization</p>
                </div>
              </div>
            </Link>

            <div className="d-flex p-1 nested-custom-tippy-content-item">
              <div className="pe-2 icon-left d-flex justify-content-center align-items-center">
                <img src={MyOrganization} alt="user" />
              </div>
              <div className="flex-grow-1">
                <h5 className="content-title">Create Two</h5>
                <p className="content-message">Find all organization</p>
              </div>
            </div>

            <div className="d-flex p-1 nested-custom-tippy-content-item">
              <div className="pe-2 icon-left d-flex justify-content-center align-items-center">
                <img src={MyOrganization} alt="user" />
              </div>
              <div className="flex-grow-1">
                <h5 className="content-title">Create Three</h5>
                <p className="content-message">Find all organization</p>
              </div>
            </div>
          </div>
        }
      >
        <div className="d-flex">
          <div className="px-3 icon-left">
            <img src={CreateImage} alt="user" />
          </div>
          <div className="flex-grow-1 ms-1 ps-1">
            <h5 className="content-title">Create Job Post</h5>
            <p className="content-message">Create new job post</p>
          </div>
        </div>
      </Tippy>

      {/* all job posts  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={AllJob} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">All Job Posts</h5>
          <p className="content-message">Show all job posts</p>
        </div>
      </div>
    </>
  );
};

export default Organization;
