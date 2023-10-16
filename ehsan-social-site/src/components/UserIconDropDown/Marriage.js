import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import { ReactComponent as MarriageImage} from "../../images/new/svg/wedding-couple.svg";
import EditMarriage from "../../images/new/wedding-ring.png";
import EditExpactation from "../../images/new/consumer.png";
import SearchMatch from "../../images/new/magnifier.png";
import Share from "../../images/new/copy.png";
import ViewMarriage from "../../images/new/couple.png";

import "./UserIconDropDown.css";

const Marriage = ({ onBackPrevContentHandler }) => {
  return (
    <>
      {/* Marriage Title  */}
      <div
        className="d-flex py-2 nested-content-title-container"
        onClick={onBackPrevContentHandler}
      >
        <div className="ms-1 ps-3 pe-2 nested-title-left-icon">
          <FontAwesomeIcon icon={["fas", "chevron-left"]} />
        </div>
        <div className="flex-grow-1 ms-3 ps-1">
          <h2 className="nested-content-title">Marriage Profile</h2>
        </div>
        <div className="px-3 svg-icon">
          <MarriageImage />
          
        </div>
      </div>

      {/* view marriage profile  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={ViewMarriage} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">View Marriage Profile</h5>
          <p className="content-message">View your marriage profile</p>
        </div>
      </div>

      {/* edit marriage profile  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={EditMarriage} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Edit Marriage Profile</h5>
          <p className="content-message">Edit your marriage profile</p>
        </div>
      </div>

      {/* edit expectation  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={EditExpactation} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Edit Expectation</h5>
          <p className="content-message">Edit your expectation</p>
        </div>
      </div>

      {/* search match  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={SearchMatch} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Search Match</h5>
          <p className="content-message">Find your match</p>
        </div>
      </div>

      {/* share marriage profile  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={Share} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Share Marriage Profile</h5>
          <p className="content-message">Share your marriage profile</p>
        </div>
      </div>
    </>
  );
};

export default Marriage;
