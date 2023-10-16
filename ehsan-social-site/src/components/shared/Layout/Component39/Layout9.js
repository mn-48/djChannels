import React from "react";
import "../Layout.css";

function Layout9(props) {
  return (
    <div
      className="col-lg-9 col-md-9 col-sm-9 layout layout9-area2 "
      style={props.mainStyle && props.mainStyle}
    >
      <div className="inner-area" style={props.innerStyle && props.innerStyle}>
        {props.children}
      </div>
    </div>
  );
}

export default Layout9;
