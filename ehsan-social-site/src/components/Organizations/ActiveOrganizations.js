import React, { useState } from "react";
import { Link, useOutletContext } from "react-router-dom";

import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css";

// compopnents
import OrganizationDetails from "./OrganizationDetails";
// svg icon
import { ReactComponent as ActiveOrganization } from "../../images/new/svg/list.svg";
import { ReactComponent as Viewer } from "../../images/new/svg/viewer.svg";
import { ReactComponent as Briefcase } from "../../images/new/svg/briefcase2.svg";
import { ReactComponent as Edit } from "../../images/new/svg/edit.svg";
import { ReactComponent as Settings } from "../../images/new/svg/cogwheel.svg";
import { ReactComponent as Hide } from "../../images/new/svg/s-lock.svg";
import { ReactComponent as Lock } from "../../images/new/svg/b-lock.svg";

import { ReactComponent as Pause } from "../../images/new/svg/pause-button.svg";
import { ReactComponent as Role } from "../../images/new/svg/stng.svg";
import { ReactComponent as Remove } from "../../images/new/svg/trash.svg";

import "./Organizations.css";

const ActiveOrganizations = ({}) => {
  // outlet context
  const {
    active,
    orgData,
    hideFromSearchHandler,
    removeOrganizationHandler,
    updateHandler,
  } = useOutletContext();

  // modal state
  const [show, setShow] = useState(false);

  // modal type
  const [modalType, setModalType] = useState(null);

  // pass data to modal
  const [modalData, setModalData] = useState({});

  // modal handler
  const handleClose = () => setShow(false);

  const handleShow = (item, type) => {
    setShow(true);
    setModalType(type);
    setModalData(item);
  };

  const activeOrgData = orgData.filter((items) => {
    return items.is_active === true;
  });

  return (
    <div className="org-dashboard-accordion-items-content">
      {/* Active Organizations Title  */}
      <div div className="active-org-item">
        <div className="org-title-icon">
          <ActiveOrganization className="org-svg-color" />
        </div>

        <div className="flex-grow-1">
          <h2 className="org-content-title">Active Organizations List</h2>
          <p className="org-content-message">
            Total Active Organizations{" "}
            <span className="ms-1 org-active-color">{`(${active})`}</span>
          </p>
        </div>
      </div>

      {/* Active Organizations  */}
      {activeOrgData.map((item, index) => {
        return (
          <div className="justify-content-between active-org-item" key={index}>
            {/* logo  */}
            <div className="org-dynamic-logo">
              <img
                src={`http://127.0.0.1:8000${item.logo}`}
                alt={item.company_name}
              />
            </div>

            {/* main info  */}
            <div className="flex-grow-1">
              <div>
                <div className="d-flex align-items-center">
                  <h2 className="org-content-title">{item.company_name}</h2>
                  <div className="org-lock-svg-icon">
                    {item.is_hidden && <Lock />}
                  </div>
                </div>

                <p className="org-content-message">
                  {item.contact_person_designation},
                  <span className="ms-1">
                    {item.industry_type && item.industry_type.name} |{" "}
                  </span>
                  Created at
                  <span className="ms-1">{item.year_of_establishment}</span>
                </p>
              </div>

              <div className="d-flex align-items-center mt-1">
                <p className="org-content-message">
                  <FontAwesomeIcon icon={["fas", "user"]} className="me-1" />
                  {item.contact_person_name}
                </p>
                <p className="org-content-message">
                  <FontAwesomeIcon
                    icon={["fas", "mobile-alt"]}
                    className="me-1"
                  />
                  {item.contact_person_phone}
                </p>
              </div>
            </div>

            {/* view  */}
            <div
              className="org-svg-icon svg-icon-container"
              onClick={() => handleShow(item, "view")}
            >
              <Viewer />
            </div>

            {/* job  */}
            <div className="org-svg-icon svg-icon-container">
              <Link to="/jobpost-details-dashboard">
                <Briefcase />
              </Link>
            </div>

            {/* edit  */}

            <div
              className="org-svg-icon svg-icon-container"
              onClick={() => handleShow(item, "edit")}
            >
              <Edit />
            </div>

            {/* settings  */}
            <Tippy
              trigger={"click"}
              theme={"light"}
              animation={"perspective"}
              placement={"bottom"}
              interactive={true}
              content={
                <div>
                  <div
                    className="svg-icon-container-tippy-item"
                    onClick={() =>
                      hideFromSearchHandler(item.id, item.is_hidden)
                    }
                  >
                    {item.is_hidden ? (
                      <>
                        <div className="org-svg-icon">
                          <Lock />
                        </div>
                        <div className="flex-grow-1">
                          <h5 className="org-tippy-content-title">
                            UnHide From Search
                          </h5>
                        </div>
                      </>
                    ) : (
                      <>
                        <div className="org-svg-icon">
                          <Hide />
                        </div>
                        <div className="flex-grow-1">
                          <h5 className="org-tippy-content-title">
                            Hide From Search
                          </h5>
                        </div>
                      </>
                    )}
                  </div>

                  <Link to="/route2">
                    <div className="svg-icon-container-tippy-item">
                      <div className="org-svg-icon">
                        <Pause />
                      </div>
                      <div className="flex-grow-1">
                        <h5 className="org-tippy-content-title">
                          freeze all job post
                        </h5>
                      </div>
                    </div>
                  </Link>

                  <Link to="/route3">
                    <div className="svg-icon-container-tippy-item">
                      <div className="org-svg-icon">
                        <Role />
                      </div>
                      <div className="flex-grow-1">
                        <h5 className="org-tippy-content-title">
                          Manage User role
                        </h5>
                      </div>
                    </div>
                  </Link>

                  <div
                    className="svg-icon-container-tippy-item"
                    onClick={() => removeOrganizationHandler(item.id)}
                  >
                    <div className="org-svg-icon">
                      <Remove />
                    </div>
                    <div className="flex-grow-1">
                      <h5 className="org-tippy-content-title">
                        remove organization
                      </h5>
                    </div>
                  </div>
                </div>
              }
            >
              <div className="org-svg-icon svg-icon-container">
                <Settings />
              </div>
            </Tippy>
          </div>
        );
      })}

      {/* modal content  */}
      <Modal show={show} size="lg" onHide={handleClose} centered>
        <Modal.Header closeButton></Modal.Header>
        <Modal.Body>
          <OrganizationDetails
            orgData={modalData}
            modalType={modalType}
            onUpdate={updateHandler}
          />
        </Modal.Body>
      </Modal>
    </div>
  );
};

export default ActiveOrganizations;
