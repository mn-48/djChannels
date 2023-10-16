import React, { useState } from "react";
import { Link, useOutletContext } from "react-router-dom";

import Modal from "react-bootstrap/Modal";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

// components
import OrganizationDetails from "./OrganizationDetails";

// svg icon
import { ReactComponent as PendingOrgImage } from "../../images/new/svg/sand-clock.svg";
import { ReactComponent as Viewer } from "../../images/new/svg/viewer.svg";
import { ReactComponent as Briefcase } from "../../images/new/svg/briefcase2.svg";
import { ReactComponent as Edit } from "../../images/new/svg/edit.svg";

import "./Organizations.css";

const PendingOrganizations = () => {
  // outlet context
  const {pending, orgData} = useOutletContext();

  // modal state
  const [show, setShow] = useState(false);

  // modal type
  const [modalType, setModalType] = useState(null);

  // pass data to modal
  const [modalData, setModalData] = useState({});

  const handleClose = () => setShow(false);
  const handleShow = (item, type) => {
    setShow(true);
    setModalType(type);
    setModalData(item);
  };

  const pendingOrgData = orgData.filter((items) => {
    return items.is_active === false;
  });

  return (
    <div className="org-dashboard-accordion-items-content">
      {/* title  */}
      <div div className="active-org-item">
        <div className="org-title-icon">
          <PendingOrgImage className="org-svg-color" />
        </div>

        <div className="flex-grow-1">
          <h2 className="org-content-title">Pending Organizations List</h2>
          <p className="org-content-message">
            Total Pending Organizations
            <span className="ms-1 org-pending-color">{`(${pending})`}</span>
          </p>
        </div>
      </div>

      {/* Pending Organizations  */}
      {pendingOrgData.map((item, index) => {
        return (
          <div className="justify-content-between active-org-item" key={index}>
            <div className="org-dynamic-logo">
              <img
                src={`http://127.0.0.1:8000${item.logo}`}
                alt={item.company_name}
              />
            </div>

            <div className="flex-grow-1">
              <div>
                <h2 className="org-content-title">{item.company_name}</h2>
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
            <div>
              <div
                className="svg-icon-container org-svg-icon "
                onClick={() => handleShow(item)}
              >
                <Viewer />
              </div>
            </div>

            <div className="org-svg-icon svg-icon-container">
              <Link to="/jobpost-details-dashboard">
                <Briefcase />
              </Link>
            </div>

            <div>
              <div
                className="org-svg-icon svg-icon-container"
                onClick={() => handleShow(item, "edit")}
              >
                <Edit />
              </div>
            </div>
          </div>
        );
      })}

      {/* modal content  */}
      <Modal show={show} size="lg" onHide={handleClose} centered>
        <Modal.Header closeButton></Modal.Header>
        <Modal.Body>
          <OrganizationDetails orgData={modalData} modalType={modalType} />
        </Modal.Body>
      </Modal>
    </div>
  );
};

export default PendingOrganizations;
