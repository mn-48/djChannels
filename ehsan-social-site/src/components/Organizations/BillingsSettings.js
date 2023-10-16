import React from "react";

// svg icon
import { ReactComponent as SettingsImage } from "../../images/new/svg/cogwheel.svg";

import "./Organizations.css";

const BillingsSettings = () => {
  return (
    <div className="org-dashboard-accordion-items-content">
      <div div className="active-org-item">
        <div className="org-title-icon">
          <SettingsImage className="org-svg-color" />
        </div>

        <div className="flex-grow-1">
          <h2 className="org-content-title">Billings Settings</h2>
        </div>
      </div>
    </div>
  );
};

export default BillingsSettings;
