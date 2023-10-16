import React from "react";
import "./Layout.css";

const Middle = (props) => {
  // const profile = `https://i.ibb.co/2vbWBg0/Potato.jpg`;
  return (
    <div className="col-lg-7 col-md-7 col-sm-6 layout middle-layout-area">
      <div className="false-space"></div>
      <div className="false-space"></div>
      {props.children}
    </div>
  );
};

export default Middle;
