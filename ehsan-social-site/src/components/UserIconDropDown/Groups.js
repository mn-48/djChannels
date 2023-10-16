import React from "react";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css";

import { ReactComponent as GroupImage } from "../../images/new/svg/group.svg";
import YourGroup from "../../images/new/collaboration.png";
import JoinedGroup from "../../images/new/third-party.png";
import CreateImage from "../../images/new/button.png";
import FeedImage from "../../images/new/rss.png";

import "./UserIconDropDown.css";

const Groups = ({ onBackPrevContentHandler }) => {
  return (
    <>
      {/* Groups Title */}
      <div
        className="d-flex py-2 nested-content-title-container"
        onClick={onBackPrevContentHandler}
      >
        <div className="ms-1 ps-3 pe-2 nested-title-left-icon">
          <FontAwesomeIcon icon={["fas", "chevron-left"]} />
        </div>
        <div className="flex-grow-1 ms-3 ps-1">
          <h2 className="nested-content-title">Groups</h2>
        </div>
        <div className="px-3 svg-icon">
          <GroupImage />
        </div>
      </div>

      {/* group you manage  */}
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
        <div className="d-flex">
          <div className="px-3 icon-left">
            <img src={YourGroup} alt="user" />
          </div>
          <div className="flex-grow-1 ms-1 ps-1">
            <h5 className="content-title">Group You Manage</h5>
            <p className="content-message">Your own groups</p>
          </div>
        </div>
      </Tippy>

      {/* groups you have joined */}
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
            <img src={JoinedGroup} alt="user" />
          </div>
          <div className="flex-grow-1 ms-1 ps-1">
            <h5 className="content-title">Group You Have Joined</h5>
            <p className="content-message">Your following groups</p>
          </div>
        </div>
      </Tippy>

      {/* create group  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={CreateImage} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Create Group</h5>
          <p className="content-message">Create new group</p>
        </div>
      </div>

      {/* all groups feeds  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={FeedImage} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">All Groups Feeds</h5>
          <p className="content-message">See groups feeds</p>
        </div>
      </div>
    </>
  );
};

export default Groups;
