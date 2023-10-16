import React from "react";
import { Link } from "react-router-dom";
import Navigation from "../shared/Navigation/Navigation";
import ThreeColumnLayout from "../shared/Layout/Component39/Layout3";
import NineColumnLayout from "../shared/Layout/Component39/Layout9";

import "./Organizations.css";

const Organizations = () => {
  return (
    <>
      <Navigation />
      <div className="container-fluid">
        <div className="row bg-light" style={{ marginTop: "60px" }}>
          {/* left sidebar  */}
          <ThreeColumnLayout>
            <div>
              <h2>Organizations Sidebar</h2>
              <div>
                <Link to="/organizations-dashboard">
                  <h2>Organization Dashboard</h2>
                </Link>
              </div>
            </div>
          </ThreeColumnLayout>

          {/* main content  */}
          <NineColumnLayout>
            <div>
              <h2>All Type Organizations Will be Show Here</h2>
              <p>This is the organization components</p>
            </div>
          </NineColumnLayout>
        </div>
      </div>
    </>
  );
};

export default Organizations;
