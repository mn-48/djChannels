import React from "react";
import { Row } from "react-bootstrap";
import Left from "../shared/Layout/Left";
import Middle from "../shared/Layout/Middle";
import Right from "../shared/Layout/Right";
import Navigation from "../shared/Navigation/Navigation";
const BuySale = () => {
  return (
    <>
      <Navigation />
      <div className="container-fluid">
        <Row>
          <Left name="Buy Sale" />
          <Middle name="Buy Sale" />
          <Right name="Buy Sale" />
        </Row>
      </div>
    </>
  );
};

///

export default BuySale;
