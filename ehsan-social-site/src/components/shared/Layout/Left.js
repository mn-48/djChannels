import React from 'react';
import "./Layout.css";


const Left = (props) => {
    return (
      <div className="col-lg-2 col-md-2 col-sm-3 layout left-layout-area">
        <div className="false-space"></div>
        {props.children}
        <div className="false-space"></div>
      </div>
    );
};

export default Left;