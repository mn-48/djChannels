import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import { ReactComponent as UserImage } from "../../images/new/svg/user.svg";
import LinkImage from "../../images/link.png";
import Edit from "../../images/edit.png"; 
import Visibility from "../../images/visibility.png";
import Copy from "../../images/copy.png";

import "./UserIconDropDown.css";

const GeneralProfile = ({ onBackPrevContentHandler }) => {
  return (
    <>
      {/* General Profile title  */}
      <div
        className="d-flex py-2 nested-content-title-container"
        onClick={onBackPrevContentHandler}
      >
        <div className="ms-1 ps-3 pe-2 nested-title-left-icon">
          <FontAwesomeIcon icon={["fas", "chevron-left"]} />
        </div>
        <div className="flex-grow-1 ms-3 ps-1">
          <h2 className="nested-content-title">General Profile</h2>
        </div>
        <div className="px-3 svg-icon">
          <UserImage />
        </div>
      </div>

      {/* view profile  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={LinkImage} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">View Profile</h5>
          <p className="content-message">View your main profile </p>
        </div>
      </div>

      {/* edit profile  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={Edit} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Edit Profile </h5>
          <p className="content-message">Edit your main profile</p>
        </div>
      </div>

      {/* manage profile privacy  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={Visibility} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Manage Profile Privacy</h5>
          <p className="content-message">Manage your profile privacy</p>
        </div>
      </div>

      {/* share profile  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={Copy} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Share Profile</h5>
          <p className="content-message">Share your main profile</p>
        </div>
      </div>
    </>
  );
};

export default GeneralProfile;
