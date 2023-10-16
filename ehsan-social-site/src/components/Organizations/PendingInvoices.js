import React from "react";

// svg icon
import { ReactComponent as PendingInvoiceImage } from "../../images/new/svg/wall-clock.svg";

import "./Organizations.css";

const PendingInvoices = () => {
  return (
    <div className="org-dashboard-accordion-items-content">
    <div div className="active-org-item">
      <div className="org-title-icon">
        <PendingInvoiceImage className="org-svg-color" />
      </div>

      <div className="flex-grow-1">
        <h2 className="org-content-title">Pending Invoices</h2>
        <p className="org-content-message">
            Total Pending Invoices<span className="ms-1 org-pending-color">(25)</span>
          </p>
      </div>
    </div>
  </div>
  );
};

export default PendingInvoices;
