import React from "react";
import "./Component39.css";

function Layout3(props) {
  return (
    <div
      className="col-lg-3 col-md-3 col-sm-3 layout layout3-area2 "
      style={props.mainStyle && props.mainStyle}
    >
      <div className="inner-area" style={props.innerStyle && props.innerStyle}>
        {props.children}
      </div>
    </div>
  );
}

export default Layout3;
