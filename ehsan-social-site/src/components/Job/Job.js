import React from 'react';
import { Row } from "react-bootstrap";
import Left from "../shared/Layout/Left";
import Middle from "../shared/Layout/Middle";
import Right from "../shared/Layout/Right";
import Navigation from '../shared/Navigation/Navigation';
import JobProfile from './JobProfile';


const Job = () => {
    return (
      <>
        <Navigation />
        <div className="container-fluid">
          <Row>
            <Left name="JOB" />
            <Middle name="JOB">
            <div className="false-space"></div><div className="false-space"></div>
              <JobProfile/>
            </Middle>
            <Right name="JOB" />
          </Row>
          
        </div>
      </>
    );
};

export default Job;