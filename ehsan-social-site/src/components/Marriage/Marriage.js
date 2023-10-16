import React from "react";
import { Outlet } from "react-router-dom";
import { Row } from "react-bootstrap";
import Left from "../shared/Layout/Left";
import Middle from "../shared/Layout/Middle";
import Right from "../shared/Layout/Right";
import Navigation from "../shared/Navigation/Navigation";

const Marriage = () => {
  return (
    <>
      <Navigation></Navigation>
      <div className="container-fluid">
        <Row>
          {/* left sidebar */}
          <Left name="Marriage" />

          {/* main content  */}
          <Middle name="Marriage">
            <div style={{ margin: "60px auto" }}>
              <Outlet />
            </div>
          </Middle>

          {/* right sidebar  */}
          <Right name="Marriage" />
        </Row>
      </div>
    </>
  );
};

export default Marriage;
