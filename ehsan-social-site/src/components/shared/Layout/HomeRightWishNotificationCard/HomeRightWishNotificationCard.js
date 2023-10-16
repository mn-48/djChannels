import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";
import { Link } from "react-router-dom";
import "./HomeRightWishNotificationCard.css";

const HomeRightWishNotificationCard = (props) => {
  const {
    id,
    notificationType,
    icon,
    iconType,
    notificationFor,
    link,
  } = props.dataInfo;
  return (
    <div className=" shadow-sm bg-body rounded special-notification-card">
      <div className="card">
        <div className="card-body">
          <div className="card-header1">
            <p>
              <FontAwesomeIcon icon={[iconType, icon]} />
              <strong>{notificationType}</strong>
            </p>
            <span>
              <FontAwesomeIcon
                icon={["fas", "times"]}
                onClick={() => props.handleWishNotificationsRemove(id)}
              />
            </span>
          </div>

          <Link to={`/${link}`} className="card-text">
            <strong>
              {notificationFor}'s' {notificationType}{" "}
            </strong>{" "}
            Do you want to wish?
            <FontAwesomeIcon icon={["fas", "external-link-alt"]} />
          </Link>
        </div>
      </div>
    </div>
  );
};

export default HomeRightWishNotificationCard;
