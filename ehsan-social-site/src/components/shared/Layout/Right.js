import React from 'react';
import "./Layout.css";

const Right = (props) => {
 
  return (
    <div className="col-lg-3 col-md-3 col-sm-3 layout right-layout-area ">
      <div className="false-space"></div>
      {props.children}
    </div>
      
  );
};

export default Right;