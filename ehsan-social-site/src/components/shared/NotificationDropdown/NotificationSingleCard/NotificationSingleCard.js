import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Tippy from "@tippyjs/react";
import React from "react";
import { Link } from "react-router-dom";
import "tippy.js/animations/perspective.css";
import "tippy.js/themes/light.css";
import "./NotificationSingleCard.css";

const NotificationSingleCard = (props) => {
  const {
    id,
    imageUrl,
    whoDid,
    text,
    ago,
    actionGrammer,
    actionFor,
    actionAt,
    iconUrl,
  } = props.msgInfo;

  return (
    <Link to="/abcd" className="singleNotificationCard">
      {/* Avatar start */}
      <div
        className="col-lg-2 col-md-2 col-sm-2 single-notification-image-controller"
        style={{ height: "50px", position: "relative" }}
      >
        <div
          className="custom-avatar-sm "
          style={{ border: "1px solid var(--ehsan-ash-color)" }}
        >
          <img src={imageUrl} alt={whoDid} />
        </div>
        <img src={iconUrl} alt={iconUrl} />
      </div>
      {/* Avatar ends */}

      {/* Notification Content start*/}
      <div className="content col-lg-10 col-md-10 col-sm-10">
        <p>
          <strong>{whoDid}</strong> {actionGrammer} <strong>{actionFor}</strong>
          {actionAt} {text}
          <span className="ago">{ago}</span>
        </p>
        <Tippy
          trigger={"click"}
          hideOnClick={true}
          animation={"perspective"}
          theme={"light"}
          content={
            <div className="notification-options">
              <p onClick={() => alert(whoDid)}>
                <FontAwesomeIcon icon={["fas", "check"]} />
                Mark as read
              </p>
              <p onClick={() => props.handleRemove(id)}>
                <FontAwesomeIcon icon={["far", "window-close"]} />
                Remove from the List
              </p>
            </div>
          }
          interactive={true}
          // animation={"shift-toward"}
        >
          <span className="action-btn">
            <FontAwesomeIcon icon={["fas", "ellipsis-v"]} />
          </span>
        </Tippy>
      </div>
      {/* Notification Content Ends*/}
    </Link>
  );
};

export default NotificationSingleCard;
