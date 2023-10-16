import React from "react";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css";

import { ReactComponent as FlagImage } from "../../images/new/svg/flag.svg";
import YourPage from "../../images/new/finish.png";
import JoinedPage from "../../images/new/flags.png";
import CreateImage from "../../images/new/button.png";
import FeedImage from "../../images/new/rss.png";

import "./UserIconDropDown.css";

const Pages = ({ onBackPrevContentHandler }) => {
  return (
    <>
      {/* Pages Title  */}
      <div
        className="d-flex py-2 nested-content-title-container"
        onClick={onBackPrevContentHandler}
      >
        <div className="ms-1 ps-3 pe-2 nested-title-left-icon">
          <FontAwesomeIcon icon={["fas", "chevron-left"]} />
        </div>
        <div className="flex-grow-1 ms-3 ps-1">
          <h2 className="nested-content-title">Pages</h2>
        </div>
        <div className="px-3 svg-icon">
          <FlagImage />
        </div>
      </div>

      {/* pages you manage  */}
      <Tippy
        trigger={"click"}
        interactive={true}
        theme={"light"}
        animation={"perspective"}
        placement={"left"}
        content={
          <div>
            <Link to="/route1">
              <div div className="d-flex p-1 nested-custom-tippy-content-item">
                <div className="pe-2 icon-left d-flex justify-content-center align-items-center custom-tippy-content-style">
                  <img src={CreateImage} alt="user" />
                </div>
                <div className="flex-grow-1">
                  <h5 className="content-title">Creates One</h5>
                  <p className="content-message">Find all organization</p>
                </div>
              </div>
            </Link>

            <Link to="/route2">
            <div className="d-flex p-1 nested-custom-tippy-content-item">
              <div className="pe-2 icon-left d-flex justify-content-center align-items-center">
                <img src={CreateImage} alt="user" />
              </div>
              <div className="flex-grow-1">
                <h5 className="content-title">Create Two</h5>
                <p className="content-message">Find all organization</p>
              </div>
            </div>
            </Link>

            <Link to="/route3">
            <div className="d-flex p-1 nested-custom-tippy-content-item">
              <div className="pe-2 icon-left d-flex justify-content-center align-items-center">
                <img src={CreateImage} alt="user" />
              </div>
              <div className="flex-grow-1">
                <h5 className="content-title">Create Three</h5>
                <p className="content-message">Find all organization</p>
              </div>
            </div>
            </Link>
          </div>
        }
      >
        <div
          className="d-flex"
          onClick={() => console.log("view profile")}
        >
          <div className="px-3 icon-left">
            <img src={YourPage} alt="user" />
          </div>
          <div className="flex-grow-1 ms-1 ps-1">
            <h5 className="content-title">Pages You Manage</h5>
            <p className="content-message">See your own pages</p>
          </div>
        </div>
      </Tippy>

      {/* pages you follow  */}
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
                  <img src={CreateImage} alt="user" />
                </div>
                <div className="flex-grow-1">
                  <h5 className="content-title">Creates One</h5>
                  <p className="content-message">Find all organization</p>
                </div>
              </div>
            </Link>

            <div className="d-flex p-1 nested-custom-tippy-content-item">
              <div className="pe-2 icon-left d-flex justify-content-center align-items-center">
                <img src={CreateImage} alt="user" />
              </div>
              <div className="flex-grow-1">
                <h5 className="content-title">Create Two</h5>
                <p className="content-message">Find all organization</p>
              </div>
            </div>

            <div className="d-flex p-1 nested-custom-tippy-content-item">
              <div className="pe-2 icon-left d-flex justify-content-center align-items-center">
                <img src={CreateImage} alt="user" />
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
            <img src={JoinedPage} alt="user" />
          </div>
          <div className="flex-grow-1 ms-1 ps-1">
            <h5 className="content-title">Pages You Follow</h5>
            <p className="content-message">See pages you are following</p>
          </div>
        </div>
      </Tippy>

      {/* create new page  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={CreateImage} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Create Page </h5>
          <p className="content-message">Create new page </p>
        </div>
      </div>

      {/* all pages feeds  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={FeedImage} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">All Pages Feeds </h5>
          <p className="content-message">See pages feeds</p>
        </div>
      </div>
    </>
  );
};

export default Pages;
