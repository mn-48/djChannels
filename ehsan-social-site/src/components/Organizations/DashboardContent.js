import React from "react";

// svg icon
import { ReactComponent as ActiveJobsImage } from "../../images/new/svg/list.svg";

import "./Organizations.css";

const DashboardContent = () => {
  return (
    <div className="org-dashboard-accordion-items-content">
      <div div className="active-org-item">
        <div className="org-title-icon">
          <ActiveJobsImage className="org-svg-color" />
        </div>

        <div className="flex-grow-1">
          <h2 className="org-content-title">
            Organization Dashboard Content munna
          </h2>
          <p className="org-content-message">
            Show all information about organizations dashboard
          </p>
        </div>
      </div>
    </div>
  );
};

export default DashboardContent;
