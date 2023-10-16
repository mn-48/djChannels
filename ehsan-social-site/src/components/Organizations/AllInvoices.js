import React from "react";

// svg icon
import { ReactComponent as AllInvoiceImage } from "../../images/new/svg/invoices.svg";

import "./Organizations.css";

const AllInvoices = () => {
  return (
    <div className="org-dashboard-accordion-items-content">
      <div div className="active-org-item">
        <div className="org-title-icon">
          <AllInvoiceImage className="org-svg-color" />
        </div>

        <div className="flex-grow-1">
          <h2 className="org-content-title">All Invoices</h2>
          <p className="org-content-message">
            Total Invoices<span className="ms-1 org-active-color">(21)</span>
          </p>
        </div>
      </div>
    </div>
  );
};

export default AllInvoices;
