import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React from "react";
import { Link } from "react-router-dom";

const HomeLeftLayoutCard = (props) => {
  const { iconType, imageUrl, title, url, counter, notification } =
    props.cardData;

    // console.log('home left layout data::',url);

  return (
    <Link to={`/${url}`} className="left-layout-card">
      {iconType === "image" ? (
        <div className="custom-avatar">
          <img src={imageUrl} alt={title} />
        </div>
      ) : (
        <div className="custom-icon">
          <img src={imageUrl} alt={title} />
        </div>
      )}

      <div className="content">
        <h3>
          {title} {counter > 0 && <span>({counter})</span>}
        </h3>
        {notification > 0 && (
          <p>
            <FontAwesomeIcon icon={["far", "dot-circle"]} /> {notification} new
          </p>
        )}
      </div>
    </Link>
  );
};

export default HomeLeftLayoutCard;
