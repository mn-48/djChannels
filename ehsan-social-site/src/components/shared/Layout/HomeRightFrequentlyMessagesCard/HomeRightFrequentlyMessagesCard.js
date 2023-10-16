import React, { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import "tippy.js/animations/shift-toward.css";
import "tippy.js/dist/tippy.css"; // optional
import "./HomeRightFrequentlyMessagesCard.css";
import { Link } from "react-router-dom";

const HomeRightFrequentlyMessagesCard = (props) => {
  const {
    imageUrl,
    title,
    userName,
    country,
    // address1,
    // address2,
    education,
    profession,
    // online,
  } = props.cardData;
  //   const [address, setAddress] = useState(country);
  const [address] = useState(country);

  //   useEffect(() => {
  //     if (address1 && address2) {
  //       setAddress(`${country}, ${address1}, ${address2}`);
  //     } else if (address1 && !address2) {
  //       setAddress(`${country}, ${address1}`);
  //     } else if (!address1 && address2) {
  //       setAddress(`${country}, ${address2}`);
  //     }
  //   });

  return (
    <Tippy
      animation={"perspective"}
      theme={"light"}
      placement={"left"}
      delay={500}
      content={
        <Link to={`profile/${userName}`} className="frequently-message-profile">
          {/* Header */}
          <div className="left-layout-card">
            <div className="custom-avatar">
              <img src={imageUrl} alt={title} />
            </div>
            <div className="content">
              <h3>{title}</h3>
            </div>
          </div>
          {/* Footer */}
          <div className="tippy-profile">
            {address && (
              <p>
                <span>
                  <FontAwesomeIcon icon={["fas", "map-marker-alt"]} />
                </span>{" "}
                {address}
              </p>
            )}
            {education && (
              <p>
                <span>
                  <FontAwesomeIcon icon={["fas", "graduation-cap"]} />
                </span>{" "}
                {education}
              </p>
            )}
            {profession && (
              <p>
                <span>
                  <FontAwesomeIcon icon={["fas", "briefcase"]} />
                </span>{" "}
                {profession}
              </p>
            )}
          </div>
        </Link>
      }
      interactive={true}
      //   animation={"shift-toward"}
    >
      <div className="left-layout-card">
        <div className="custom-avatar">
          <img src={imageUrl} alt={title} />
        </div>
        <div className="content">
          <h3>{title}</h3>
        </div>
      </div>
    </Tippy>
  );
};

export default HomeRightFrequentlyMessagesCard;
