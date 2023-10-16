import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React, { useState } from "react";
import { Link } from "react-router-dom";
import notifications from "../../../FakeData/notifications";
import "./NotificationDropdown.css";
import NotificationSingleCard from "./NotificationSingleCard/NotificationSingleCard";

const NotificationDropdown = () => {
    const [notification, setNotification] = useState(notifications);
    const handleRemove = (id) => {
        //console.log('Notification Removed' + id);
        const afterRemove = notification.filter((oldItem) => oldItem.id !== id);
        setNotification(afterRemove);
        //console.log(afterRemove);
    }
  return (
    <div>
      <div className="inner-dropdown notification-inner-dropdown">
        <div className="top-area">
          <div className="notification-header">
            <h1>Notifications</h1>

            <span>
              <FontAwesomeIcon icon={["fas", "cogs"]} />
            </span>
          </div>

          <div className="notification-body">
            {notification.map((msg) => (
              <NotificationSingleCard
                key={msg.id}
                msgInfo={msg}
                handleRemove={handleRemove}
              />
            ))}
          </div>
        </div>
      </div>
      <footer className="bottom-area">
        <Link to="/notifications">
          <FontAwesomeIcon icon={["fas", "link"]} /> Go to all notifications
        </Link>
      </footer>
    </div>
  );
};

export default NotificationDropdown;
