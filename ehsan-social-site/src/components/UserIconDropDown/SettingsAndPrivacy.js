import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import { ReactComponent as SettingsTitleImage } from "../../images/new/svg/settings.svg";
import SettingsImages from "../../images/new/settings.png";
import PrivacyCheckUp from "../../images/new/compliant.png";
import PrivacyShortCut from "../../images/new/keyhole.png";
import ActivityLog from "../../images/new/menu.png";
import FeedImage from "../../images/new/rss.png";
import Language from "../../images/new/language.png";

import "./UserIconDropDown.css";

const SettingsAndPrivacy = ({ onBackPrevContentHandler }) => {
  return (
    <>
      {/* Settings title  */}
      <div
        className="d-flex py-2 nested-content-title-container"
        onClick={onBackPrevContentHandler}
      >
        <div className="ms-1 ps-3 pe-2 nested-title-left-icon">
          <FontAwesomeIcon icon={["fas", "chevron-left"]} />
        </div>
        <div className="flex-grow-1 ms-3 ps-1">
          <h2 className="nested-content-title">Settings And Privacy</h2>
        </div>
        <div className="px-3 svg-icon">
          <SettingsTitleImage />
        </div>
      </div>

      {/* settings */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={SettingsImages} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Settings</h5>
          <p className="content-message">Manage your settings</p>
        </div>
      </div>

      {/* privcy checkup  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={PrivacyCheckUp} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Privacy Checkup </h5>
          <p className="content-message">Your privacy checkup </p>
        </div>
      </div>

      {/* privacy shortcuts  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={PrivacyShortCut} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Privacy Shortcuts</h5>
          <p className="content-message">Privacy shortcuts</p>
        </div>
      </div>

      {/* activity log  */}
      <div
        className="d-flex"
        onClick={() => console.log("share your profile")}
      >
        <div className="px-3 icon-left">
          <img src={ActivityLog} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Activity Log</h5>
          <p className="content-message">Your activity log</p>
        </div>
      </div>

      {/* news feed preference  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={FeedImage} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">News Feed Preference </h5>
          <p className="content-message">Your activaity log</p>
        </div>
      </div>

      {/* language  */}
      <div className="d-flex">
        <div className="px-3 icon-left">
          <img src={Language} alt="user" />
        </div>
        <div className="flex-grow-1 ms-1 ps-1">
          <h5 className="content-title">Language</h5>
          <p className="content-message">Choose your language</p>
        </div>
      </div>
    </>
  );
};

export default SettingsAndPrivacy;
