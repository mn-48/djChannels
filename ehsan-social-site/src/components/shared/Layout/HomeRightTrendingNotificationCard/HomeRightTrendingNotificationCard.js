import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from 'react';
import { Link } from "react-router-dom";

const HomeRightTrendingNotificationCard = (props) => {
    const { id, hashName, link, counter, icon, iconType } = props.dataInfo;
    return (
         <div className="rounded hash-notification-card">
        <div className="card">
          <div className="card-body">
            <div className="card-header1">
              <p>
                <FontAwesomeIcon icon={[iconType,icon]} />
                <strong>{hashName}({ counter})</strong>
              </p>
              <span>
              <FontAwesomeIcon icon={["fas", "times"]} onClick={()=>props.handleTrendingNotificationsRemove(id)} />
              </span>
            </div>

          <Link to={`/${link}`}className="card-text">
            <strong>{ hashName}</strong>
            <FontAwesomeIcon icon={["fas", "external-link-alt"]} />
            </Link>
          </div>
        </div>
      </div>
    );
};

export default HomeRightTrendingNotificationCard;