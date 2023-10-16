import React, { useState } from "react";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import GeneralProfile from "./GeneralProfile";
import JobProfile from "./JobProfile";
import Organization from "./Organization";
import Groups from "./Groups";
import Marriage from "./Marriage";
import Pages from "./Pages";
import SettingsAndPrivacy from "./SettingsAndPrivacy";

import JobImage from "../../images/briefcase.png";
import UserImage from "../../images/user.png";
import MarriageImage from "../../images/wedding-couple.png";
import OrganizationImage from "../../images/3d-buildings.png";
import GroupImage from "../../images/group.png";
import FlagImage from "../../images/flag.png";
import SettingsImage from "../../images/settings.png";
import EhsanMarketingImage from "../../images/EhsanMarketing.png";
import LogoutImage from "../../images/log-out.png";

import "./UserIconDropDown.css";

function UserIconDropDown() {
  const [item, setItem] = useState(0);

  // nested content handler
  const changeContentHandler = (id) => {
    setItem(item + id);
  };

  // back to main content handler
  const backPrevContentHandler = () => {
    setItem(0);
  };

  let nestedIconContent = null;

  if (item === 1) {
    nestedIconContent = (
      <GeneralProfile onBackPrevContentHandler={backPrevContentHandler} />
    );
  } else if (item === 2) {
    nestedIconContent = (
      <JobProfile onBackPrevContentHandler={backPrevContentHandler} />
    );
  } else if (item === 3) {
    nestedIconContent = (
      <Organization onBackPrevContentHandler={backPrevContentHandler} />
    );
  } else if (item === 4) {
    nestedIconContent = (
      <Marriage onBackPrevContentHandler={backPrevContentHandler} />
    );
  } else if (item === 5) {
    nestedIconContent = (
      <Groups onBackPrevContentHandler={backPrevContentHandler} />
    );
  } else if (item === 6) {
    nestedIconContent = (
      <Pages onBackPrevContentHandler={backPrevContentHandler} />
    );
  } else if (item === 7) {
    nestedIconContent = (
      <SettingsAndPrivacy onBackPrevContentHandler={backPrevContentHandler} />
    );
  }

  return (
    <div className="icon-drop-down">
      {item === 0 ? (
        <>
          {/* user name  */}
          <div className="d-flex" onClick={() => changeContentHandler(1)}>
            <div className="px-3 icon-left">
              <img src={UserImage} alt="user" />
            </div>
            <div className="flex-grow-1 ms-1 ps-1">
              <h5 className="content-title">Md Mohimenol Islam Munna</h5>
              <p className="content-message">View your main profile</p>
            </div>
            <div className="px-3 icon-right">
              <FontAwesomeIcon icon={["fas", "chevron-right"]} />
            </div>
          </div>

          {/* Job profile  */}
          <div className="d-flex" onClick={() => changeContentHandler(2)}>
            <div className="px-3 icon-left">
              <img src={JobImage} alt="Job" />
            </div>
            <div className="flex-grow-1 ms-1 ps-1">
              <h5 className="content-title">Job Profile</h5>
              <p className="content-message">
                Manage your job profile and find your job
              </p>
            </div>
            <div className="px-3 icon-right">
              <FontAwesomeIcon icon={["fas", "chevron-right"]} />
            </div>
          </div>

          {/* organization  */}
          <div className="d-flex" onClick={() => changeContentHandler(3)}>
            <div className="px-3 icon-left">
              <img src={OrganizationImage} alt="organization" />
            </div>
            <div className="flex-grow-1 ms-1 ps-1">
              <h5 className="content-title">Organization</h5>
              <p className="content-message">
                Manage your organization and job posts
              </p>
            </div>
            <div className="px-3 icon-right">
              <FontAwesomeIcon icon={["fas", "chevron-right"]} />
            </div>
          </div>

          {/* marriage  */}
          <div className="d-flex" onClick={() => changeContentHandler(4)}>
            <div className="px-3 icon-left">
              <img src={MarriageImage} alt="marriage" />
            </div>
            <div className="flex-grow-1 ms-1 ps-1">
              <h5 className="content-title">Marriage Profile</h5>
              <p className="content-message">Manage your marriage profile</p>
            </div>
            <div className="px-3 icon-right">
              <FontAwesomeIcon icon={["fas", "chevron-right"]} />
            </div>
          </div>

          {/* groups  */}
          <div className="d-flex" onClick={() => changeContentHandler(5)}>
            <div className="px-3 icon-left">
              <img src={GroupImage} alt="group" />
            </div>
            <div className="flex-grow-1 ms-1 ps-1">
              <h5 className="content-title">Groups</h5>
              <p className="content-message">
                Groups you have joined and your groups
              </p>
            </div>
            <div className="px-3 icon-right">
              <FontAwesomeIcon icon={["fas", "chevron-right"]} />
            </div>
          </div>

          {/* pages  */}
          <div className="d-flex" onClick={() => changeContentHandler(6)}>
            <div className="px-3 icon-left">
              <img src={FlagImage} alt="page" />
            </div>
            <div className="flex-grow-1 ms-1 ps-1">
              <h5 className="content-title">Pages</h5>
              <p className="content-message">
                Pages you are following and your pages
              </p>
            </div>
            <div className="px-3 icon-right">
              <FontAwesomeIcon icon={["fas", "chevron-right"]} />
            </div>
          </div>

          {/* setting and privacy  */}
          <div className="d-flex" onClick={() => changeContentHandler(7)}>
            <div className="px-3 icon-left">
              <img src={SettingsImage} alt="settings" />
            </div>
            <div className="flex-grow-1 ms-1 ps-1">
              <h5 className="content-title">Settings and Privacy</h5>
              <p className="content-message">Account's setting and privacy</p>
            </div>
            <div className="px-3 icon-right">
              <FontAwesomeIcon icon={["fas", "chevron-right"]} />
            </div>
          </div>

          {/* ehsan marketing  */}
          <div className="">
            <a
              className="d-flex ehsan-marketing"
              href="https://ehsanmarketing.com/"
              // target="_blank"
            >
              <div className="px-3 icon-left">
                <img src={EhsanMarketingImage} alt="ehsan marketing" />
              </div>
              <div className="flex-grow-1 ms-1 ps-1">
                <h5 className="content-title">Ehsan Marketing</h5>
                <p className="content-message">Go to Ehsan Marketing</p>
              </div>
            </a>
          </div>

          {/* logout  */}
          <div>
            <Link
              className="d-flex py-1 logout align-content-center mx-0"
              to="/logout"
            >
              <div className="px-3 icon-left">
                <img src={LogoutImage} alt="logout" />
              </div>
              <div className="flex-grow-1 ms-1 ps-1">
                <h5 className="content-title">Logout</h5>
              </div>
            </Link>
          </div>
        </>
      ) : (
        <>{nestedIconContent}</>
      )}
    </div>
  );
}

export default UserIconDropDown;
